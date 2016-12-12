package org.sbgrid.api;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.http.ContentType;

import static org.hamcrest.Matchers.equalTo;

import org.apache.commons.io.IOUtils;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.UUID;

import static com.jayway.restassured.RestAssured.given;
import static junit.framework.Assert.fail;

public class SBGridResourcesIT {
    
    private static ClassLoader classLoader = SBGridResourcesIT.class.getClassLoader();

    // test properties
    private static String testName;
    private static String token;

    // dataset properties
    private static int dsId;
    
    public static final String API_TOKEN_HTTP_HEADER = "X-Dataverse-key";
    private static final String BUILTIN_USER_KEY = "burrito";

    @BeforeClass
    public static void setUpClass() throws Exception {
        RestAssured.baseURI = getRestAssuredBaseUri();
    }

    @Before
    public void setUpDataverse() {

        try {
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
            System.out.println("\nTOKEN: " + token);
            
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
        } catch (Exception e) {
            System.out.println("Error creating test dataverse: " + e.getMessage());
            fail();
        }
    }

    @AfterClass
    public static void tearDownClass() {
        RestAssured.reset();
    }

    @After
    public void tearDownDataverse() {
        try {
            if (dsId > 0) {
                // delete dataset
                given().header(API_TOKEN_HTTP_HEADER, token)
                        .delete("/api/datasets/" + dsId)
                        .then().assertThat().statusCode(200);
            }
            // delete dataverse
            given().header(API_TOKEN_HTTP_HEADER, token)
                    .delete("/api/dataverses/" + testName)
                    .then().assertThat().statusCode(200);
            // delete user
            given().header(API_TOKEN_HTTP_HEADER, token)
                    .delete("/api/admin/authenticatedUsers/" + testName + "/")
                    .then().assertThat().statusCode(200);
            
        } catch (Exception e) {
            System.out.println("Error tearDownDataverse: " + e.getMessage());
            e.printStackTrace();
            fail();
        }
    }
    
    @Test
    public void testMigrateDatasetWithDoi() {

        try {
            // make user a super user
            given().post("/api/admin/superuser/" + testName).then().assertThat().statusCode(200);
            String json = IOUtils.toString(classLoader.getResourceAsStream("json/dataset-finch2.json"));
            dsId = given()
                    .queryParam("importType", "migration")
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .body(json)
                    .contentType("application/json")
                    .post("/api/sbgrid/dataverses/" + testName + "/datasets")
                    .then().assertThat().statusCode(201)
                    .extract().jsonPath().getInt("data.id");
            System.out.println("DATASET ID: " + dsId);
        } catch (Exception e) {
            System.out.println("Failed testMigrateDatasetWithDoi: " + e.getMessage());
            fail();
        }
    }

    @Test
    // attempt to migrate dataset missing global ID param: authority
    public void testMigrateDatasetWithMissingGlobalIdAuthority() {

        try {
            // make user a super user
            given().post("/api/admin/superuser/" + testName).then().assertThat().statusCode(200);
            String json = IOUtils.toString(classLoader.getResourceAsStream("json/dataset-finch3.json"));
            given()
                    .queryParam("importType", "migration")
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .body(json)
                    .contentType("application/json")
                    .post("/api/sbgrid/dataverses/" + testName + "/datasets")
                    .then().assertThat().statusCode(400)
                    .body("message", equalTo("Protocol, authority and identifier must all be specified when migrating a "
                            + "dataset with an existing global identifier."));
            dsId = -1;
        } catch (Exception e) {
            System.out.println("Failed testMigrateDatasetWithDoi: " + e.getMessage());
            fail();
        }
    }

    @Test
    // migrate dataset with no import type specified 
    // (should be reset to MIGRATION since all global ID params are present)
    public void testMigrateDatasetWithMissingImportType() {

        try {
            // make user a super user
            given().post("/api/admin/superuser/" + testName).then().assertThat().statusCode(200);
            String json = IOUtils.toString(classLoader.getResourceAsStream("json/dataset-finch4.json"));
            dsId = given()
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .body(json)
                    .contentType("application/json")
                    .post("/api/sbgrid/dataverses/" + testName + "/datasets")
                    .then().assertThat().statusCode(201)
                    .extract().jsonPath().getInt("data.id");
            System.out.println("DATASET ID: " + dsId);
        } catch (Exception e) {
            System.out.println("Failed testMigrateDatasetWithDoi: " + e.getMessage());
            fail();
        }
    }
    
    @Test
    public void testMigrateDatasetNoSuperUser() {
        try {
            
            String json = IOUtils.toString(classLoader.getResourceAsStream("json/dataset-finch4.json"));
            given()
                    .queryParam("importType", "migration")
                    .header(API_TOKEN_HTTP_HEADER, token)
                    .body(json)
                    .contentType("application/json")
                    .post("/api/sbgrid/dataverses/" + testName + "/datasets")
                    .then().assertThat().statusCode(401);
            dsId = -1;
        } catch (Exception e) {
            System.out.println("Failed testMigrateDatasetWithDoi: " + e.getMessage());
            fail();
        }
    }

    // utils
    static String getRestAssuredBaseUri() {
        String restAssuredBaseUri = "http://localhost:8080";
        String specifiedUri = System.getProperty("dataverse.test.baseurl");
        if (specifiedUri != null) {
            restAssuredBaseUri = specifiedUri;
        }
        System.out.println("Base URL for tests: " + restAssuredBaseUri);
        return restAssuredBaseUri;
    }
    
}
