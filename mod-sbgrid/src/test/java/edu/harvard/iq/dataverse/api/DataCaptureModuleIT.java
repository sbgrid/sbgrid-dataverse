package edu.harvard.iq.dataverse.api;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.http.ContentType;
import org.apache.commons.io.IOUtils;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.IOException;
import java.util.Properties;
import java.util.UUID;

import static com.jayway.restassured.RestAssured.given;
import static junit.framework.Assert.fail;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.startsWith;

/**
 * Test for DCM Module
 */
public class DataCaptureModuleIT {

    private static ClassLoader classLoader = DataCaptureModuleIT.class.getClassLoader();

    // test properties
    private static String testName;
    private static String token;

    // dataset properties
    private static int dsId;

    private static Properties props = new Properties();
    private static final String API_TOKEN_HTTP_HEADER = "X-Dataverse-key";
    private static final String BUILTIN_USER_KEY = "burrito";
    
    private static String dcmUrl = "mock";

    @BeforeClass
    public static void setUpClass() throws Exception {

        // this allows for testing on dataverse staging servers via jvm setting
        String restAssuredBaseUri = "http://localhost:8080";
        String specifiedUri = System.getProperty("dataverse.test.baseurl");
        if (specifiedUri != null) {
            restAssuredBaseUri = specifiedUri;
        }
        System.out.println("Base URL for tests: " + restAssuredBaseUri +  "\n");
        RestAssured.baseURI = restAssuredBaseUri;
        
        // use mock dcm unless specified via jvm setting
        String specifiedDcmUrl = System.getProperty("dataverse.dcm.url");
        if (specifiedDcmUrl != null) {
            dcmUrl = specifiedDcmUrl;
        }
        System.out.println("DCM URL: " + dcmUrl + "\n");
    }

    @Before
    public void setUpDataverse() {

        try {
            String dsIdentifier;
            
            // create random test name
            testName = UUID.randomUUID().toString().substring(0, 8);
            
            // create user and set token
            token = given()
                    .body("{" +
                            "   \"userName\": \"" + testName + "\"," +
                            "   \"firstName\": \"" + testName + "\"," +
                            "   \"lastName\": \"" + testName + "\"," +
                            "   \"email\": \"" + testName + "@mailinator.com\"" +
                            "}")
                    .contentType(ContentType.JSON)
                    .request()
                    .post("/api/builtin-users/secret/" + BUILTIN_USER_KEY)
                    .then().assertThat().statusCode(200)
                    .extract().jsonPath().getString("data.apiToken");
           System.out.println("TOKEN: " + token);
            
            // create dataverse
            given().body("{" +
                    "    \"name\": \"" + testName + "\"," +
                    "    \"alias\": \"" + testName + "\"," +
                    "    \"affiliation\": \"Test-Driven University\"," +
                    "    \"dataverseContacts\": [" +
                    "        {" +
                    "            \"contactEmail\": \"test@example.com\"" +
                    "        }," +
                    "        {" +
                    "            \"contactEmail\": \"test@example.org\"" +
                    "        }" +
                    "    ]," +
                    "    \"permissionRoot\": true," +
                    "    \"description\": \"test Description.\"" +
                    "}")
                    .contentType(ContentType.JSON).request()
                    .post("/api/dataverses/:root?key=" + token)
                    .then().assertThat().statusCode(201);
            System.out.println("DATAVERSE: http://localhost:8080/dataverse/" + testName);
            
            // create x-ray diffraction dataset and set id
            String json = IOUtils.toString(classLoader.getResourceAsStream("json/x-ray-diffraction.json"));
            dsId = given()
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .body(json)
                    .contentType("application/json")
                    .post("/api/dataverses/" + testName + "/datasets")
                    .then().assertThat().statusCode(201)
                    .extract().jsonPath().getInt("data.id");
            System.out.println("DATASET PRIMARY ID: " + dsId);
            
            // get dataset identifier
            dsIdentifier = given()
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .get("/api/datasets/" + dsId)
                    .then().assertThat().statusCode(200)
                    .extract().jsonPath().getString("data.identifier");
            System.out.println("IDENTIFIER: " + dsIdentifier);
            
            // set the dcm url ("mock" unless otherwise specified)
            given()
                    .body(dcmUrl)
                    .contentType("application/json")
                    .put("api/admin/settings/:DataCaptureModuleUrl?key=" + token)
                    .then().assertThat().statusCode(200);
            System.out.println("DCM URL: " + dcmUrl);
            
            // set the file upload mechanisms: GUI and RSYNC
            given()
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .body("GUI:RSYNC")
                    .contentType("text/plain")
                    .post("api/dataverses/" + testName + "/uploadmechanisms")
                    .then().assertThat().statusCode(200);
            System.out.println("UPLOAD MECHANISMS: GUI:RSYNC");
            
        } catch (IOException ioe) {
            System.out.println("Error creating test dataset: " + ioe.getMessage());
            fail();
        }
    }

    @AfterClass
    public static void tearDownClass() {
        RestAssured.reset();
    }

    @After
    public void tearDownDataverse() {
        // delete dataset
        given().header(API_TOKEN_HTTP_HEADER, token)
                .delete("/api/datasets/" + dsId)
                .then().assertThat().statusCode(200);
        // delete dataverse
        given().header(API_TOKEN_HTTP_HEADER, token)
                .delete("/api/dataverses/" + testName)
                .then().assertThat().statusCode(200);
        // delete user
        given().header(API_TOKEN_HTTP_HEADER, token)
                .delete("/api/admin/authenticatedUsers/" + testName + "/")
                .then().assertThat().statusCode(200);
    }


    @Test
    public void testSetAndGetRsyncScriptIsSuperUser() {
        
        // make user a super user
        given().post("/api/admin/superuser/" + testName).then().assertThat().statusCode(200);

        // set script
        given()
                .header(API_TOKEN_HTTP_HEADER, token)
                .body("Just a test")
                .post("/api/datasets/" + dsId + "/dataCaptureModule/rsync")
                .then().assertThat().statusCode(200)
                .body("data.script", equalTo("Just a test"));
        
        // get script
        if (dcmUrl.equalsIgnoreCase("mock")) {
            given()
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .get("/api/datasets/" + dsId + "/dataCaptureModule/rsync")
                    .then().assertThat().statusCode(200)
                    .body("status", equalTo("OK"))
                    .body("data.script", equalTo("script goes here"));
        } else {
            given()
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .get("/api/datasets/" + dsId + "/dataCaptureModule/rsync")
                    .then().assertThat().statusCode(200)
                    .body("status", equalTo("OK"))
                    .body("data.script", equalTo("Just a test"));
        }
        
    }

    @Test
    public void testSetAndGetRsyncScriptNotSuperUser() {
        // set script
        given()
                .header(API_TOKEN_HTTP_HEADER, token)
                .body("Just a test")
                .post("/api/datasets/" + dsId + "/dataCaptureModule/rsync")
                .then().assertThat().statusCode(403)
                .body("status", equalTo("ERROR"))
                .body("message", equalTo("Not a superuser"));
    }

    @Test
    public void testSetRsyncWhenNotSupported() {

        // make user a super user
        given()
                .post("/api/admin/superuser/" + testName)
                .then().assertThat().statusCode(200);

        // set the file upload mechanisms to GUI only
        given()
                .header(API_TOKEN_HTTP_HEADER, token)
                .body("GUI")
                .contentType("text/plain")
                .post("api/dataverses/" + testName + "/uploadmechanisms")
                .then().assertThat().statusCode(200);

        // set script
        given()
                .header(API_TOKEN_HTTP_HEADER, token)
                .body("Just a test")
                .post("/api/datasets/" + dsId + "/dataCaptureModule/rsync")
                .then().assertThat().statusCode(501) // not implemented
                .body("status", equalTo("ERROR"))
                .body("message", startsWith("Parent dataverse doesn't support rsync transfers"));
        
    }
    
// NOT AVAILABLE UNTIL BATCH FILE IMPORT IS MERGED    
//    @Test
//    public void testSetChecksumValidation() {
//
//        // make user a super user
//        given()
//                .post("/api/admin/superuser/" + testName)
//                .then().assertThat().statusCode(200);
//        
//        // set checksum validation
//        given()
//                .header(API_TOKEN_HTTP_HEADER, token)
//                .body("{" +
//                "    \"userId\": \"" + testName + "\"," +
//                "    \"datasetId\": \"" + dsId + "\"," +
//                "    \"datasetIdentifier\": \"" + testName + "\"," +
//                "    \"status\": \"validation passed\"" +
//                "}")
//                .contentType(ContentType.JSON).request()
//                .post("api/datasets/dataCaptureModule/checksumValidation")
//                .then().assertThat().statusCode(201);
//
//    }
    

}