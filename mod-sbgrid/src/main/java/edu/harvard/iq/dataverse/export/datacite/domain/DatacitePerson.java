package edu.harvard.iq.dataverse.export.datacite.domain;

import edu.harvard.iq.dataverse.DatasetField;
import edu.harvard.iq.dataverse.DatasetFieldCompoundValue;

import java.util.ArrayList;
import java.util.List;

public class DatacitePerson {
    
    String familyName;
    String givenName;
    String composedName;
    String affiliation;
    String nameIdentifier;
    String nameIdentifierScheme;
    String nameIdentifierSchemeUri;
    String role;

    public DatacitePerson() {}
    
    public DatacitePerson(String name) {
        this.composedName = name;
    }
    
    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getComposedName() {
        return composedName;
    }

    public void setComposedName(String composedName) {
        this.composedName = composedName;
    }

    public String getAffiliation() {
        return affiliation;
    }

    public void setAffiliation(String affiliation) {
        this.affiliation = affiliation;
    }

    public String getNameIdentifier() {
        return nameIdentifier;
    }

    public void setNameIdentifier(String nameIdentifier) {
        this.nameIdentifier = nameIdentifier;
    }

    public String getNameIdentifierScheme() {
        return nameIdentifierScheme;
    }

    public void setNameIdentifierScheme(String nameIdentifierScheme) {
        this.nameIdentifierScheme = nameIdentifierScheme;
    }

    public String getNameIdentifierSchemeUri() {
        return nameIdentifierSchemeUri;
    }

    public void setNameIdentifierSchemeUri(String nameIdentifierSchemeUri) {
        this.nameIdentifierSchemeUri = nameIdentifierSchemeUri;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public static List<DatacitePerson> getDatacitePersons(DatasetField datasetField) {
        List<DatacitePerson> list = new ArrayList<>();
        for (DatasetFieldCompoundValue compoundVal : datasetField.getDatasetFieldCompoundValues()) {
            DatacitePerson datacitePerson = new DatacitePerson();
            for (DatasetField child : compoundVal.getChildDatasetFields()) {
                String type = child.getDatasetFieldType().getName();
                if (type.equalsIgnoreCase("contributorName")) {
                    datacitePerson.setComposedName(child.getValue());
                }
                if (type.equalsIgnoreCase("contributorType")) {
                    datacitePerson.setRole(child.getValue());
                }
            }
            list.add(datacitePerson);
        }
        return list;
    }

}
