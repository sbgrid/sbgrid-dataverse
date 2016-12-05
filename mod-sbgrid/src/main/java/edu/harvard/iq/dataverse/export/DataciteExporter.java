package edu.harvard.iq.dataverse.export;

import com.google.auto.service.AutoService;
import edu.harvard.iq.dataverse.DatasetVersion;
import edu.harvard.iq.dataverse.export.datacite.DataciteTemplateWriter;
import edu.harvard.iq.dataverse.export.spi.Exporter;

import javax.json.JsonObject;
import java.io.OutputStream;

@AutoService(Exporter.class)
public class DataciteExporter implements Exporter {

    public static String DATACITE_XML_NAMESPACE = "http://datacite.org/schema/kernel-4";
    public static String DATACITE_XML_SCHEMALOCATION = "http://datacite.org/schema/kernel-4 http://schema.datacite.org/meta/kernel-4/metadata.xsd";
    public static String DATACITE_XML_SCHEMA_URL = "https://schema.datacite.org/meta/kernel-4.0/metadata.xsd";
    public static String DEFAULT_XML_VERSION = "4.0";
    public static String PROVIDER_NAME = "datacite_xml";
    public static String DISPLAY_NAME = "DataCite Metadata Schema 4.0";
    
    @Override
    public void exportDataset(DatasetVersion version, JsonObject json, OutputStream os) throws ExportException {
        DataciteTemplateWriter writer = new DataciteTemplateWriter();
        writer.setDataset(version.getDataset());
        writer.setSchemaUrl(DATACITE_XML_SCHEMA_URL);
        writer.process(os, true);
    }

    @Override
    public Boolean isXMLFormat() {
        return true;
    }

    @Override
    public Boolean isHarvestable() {
        return true;
    }

    @Override
    public Boolean isAvailableToUsers() {
        return true;
    }

    @Override
    public String getXMLNameSpace() throws ExportException { return DATACITE_XML_NAMESPACE; }

    @Override
    public String getXMLSchemaLocation() throws ExportException { return DATACITE_XML_SCHEMALOCATION; }

    @Override
    public String getXMLSchemaVersion() throws ExportException { return DEFAULT_XML_VERSION; }

    @Override
    public String getProviderName() {
        return PROVIDER_NAME;
    }

    @Override
    public String getDisplayName() {
        return  DISPLAY_NAME;
    }

    @Override
    public void setParam(String name, Object value) { }
}
