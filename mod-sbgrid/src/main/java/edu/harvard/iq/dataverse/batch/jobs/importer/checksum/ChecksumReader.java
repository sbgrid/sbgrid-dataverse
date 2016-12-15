package edu.harvard.iq.dataverse.batch.jobs.importer.checksum;

import edu.harvard.iq.dataverse.DataFile;
import edu.harvard.iq.dataverse.DataFileServiceBean;
import edu.harvard.iq.dataverse.Dataset;
import edu.harvard.iq.dataverse.DatasetServiceBean;

import javax.annotation.PostConstruct;
import javax.batch.api.BatchProperty;
import javax.batch.api.chunk.AbstractItemReader;
import javax.batch.operations.JobOperator;
import javax.batch.runtime.BatchRuntime;
import javax.batch.runtime.context.JobContext;
import javax.batch.runtime.context.StepContext;
import javax.ejb.EJB;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.Serializable;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

@Named
@Dependent
public class ChecksumReader extends AbstractItemReader {

    private static final Logger logger = Logger.getLogger(ChecksumReader.class.getName());

    public static final String FILE_SEPARATOR = System.getProperty("file.separator");
    
    @Inject
    JobContext jobContext;

    @Inject
    StepContext stepContext;

    @Inject
    @BatchProperty
    String checksumManifest;

    @Inject
    @BatchProperty
    String checksumType;

    @EJB
    DatasetServiceBean datasetServiceBean;

    @EJB
    DataFileServiceBean fileService;

    private String persistentUserData = "";

    File manifest;
    
    long currentRecordNumber = 0;
    
    List<DataFile> dataFileList;

    Dataset dataset;

    String jobChecksumManifest;
    
    BufferedReader reader;
    
    @PostConstruct
    public void init() {
        JobOperator jobOperator = BatchRuntime.getJobOperator();
        Properties jobParams = jobOperator.getParameters(jobContext.getInstanceId());
        dataset = datasetServiceBean.findByGlobalId(jobParams.getProperty("datasetId"));
        dataFileList = dataset.getFiles();
        // check system property first, otherwise use default property in FileSystemImportJob.xml
        if (System.getProperty("checksumManifest") != null) {
            jobChecksumManifest = System.getProperty("checksumManifest");
        } else {
            jobChecksumManifest = checksumManifest;
        }
    }

    @Override
    public void open(Serializable checkpoint) throws Exception {
        manifest = new File(System.getProperty("dataverse.files.directory")
                + FILE_SEPARATOR + dataset.getAuthority() 
                + FILE_SEPARATOR + dataset.getIdentifier() 
                + FILE_SEPARATOR + jobChecksumManifest);
        reader = new BufferedReader(new FileReader(manifest));
    }

    @Override
    public ChecksumRecord readItem() {
        currentRecordNumber++;
        try {
            String[] parts = reader.readLine().split("\\s+");
            if (parts.length == 2 && parts[0].length() > 0 && parts[1].length() > 0) {
                String path = parts[1];
                String value = parts[0];
                ChecksumRecord checksumRecord = new ChecksumRecord();
                checksumRecord.setPath(path.replaceAll("^\\./", ""));
                checksumRecord.setValue(value);
                return checksumRecord;
            } else {
                logger.log(Level.SEVERE, "ERROR: empty path and/or value parsing checksum record.");
                return null;
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "ERROR: reading checksum record: " + e.getMessage());
            return null;
        }
    }

    @Override
    public void close() {
        if (!persistentUserData.isEmpty()) {
            stepContext.setPersistentUserData(persistentUserData);
        }
    }
}
