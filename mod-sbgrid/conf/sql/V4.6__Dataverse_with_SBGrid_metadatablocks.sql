--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: EJB__TIMER__TBL; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE "EJB__TIMER__TBL" (
    "TIMERID" character varying(255) NOT NULL,
    "APPLICATIONID" bigint,
    "BLOB" bytea,
    "CONTAINERID" bigint,
    "CREATIONTIMERAW" bigint,
    "INITIALEXPIRATIONRAW" bigint,
    "INTERVALDURATION" bigint,
    "LASTEXPIRATIONRAW" bigint,
    "OWNERID" character varying(255),
    "PKHASHCODE" integer,
    "SCHEDULE" character varying(255),
    "STATE" integer
);


ALTER TABLE public."EJB__TIMER__TBL" OWNER TO dvnapp;

--
-- Name: actionlogrecord; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE actionlogrecord (
    id character varying(36) NOT NULL,
    actionresult character varying(255),
    actionsubtype character varying(255),
    actiontype character varying(255),
    endtime timestamp without time zone,
    info character varying(1024),
    starttime timestamp without time zone,
    useridentifier character varying(255)
);


ALTER TABLE public.actionlogrecord OWNER TO dvnapp;

--
-- Name: apitoken; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE apitoken (
    id integer NOT NULL,
    createtime timestamp without time zone NOT NULL,
    disabled boolean NOT NULL,
    expiretime timestamp without time zone NOT NULL,
    tokenstring character varying(255) NOT NULL,
    authenticateduser_id bigint NOT NULL
);


ALTER TABLE public.apitoken OWNER TO dvnapp;

--
-- Name: apitoken_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE apitoken_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.apitoken_id_seq OWNER TO dvnapp;

--
-- Name: apitoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE apitoken_id_seq OWNED BY apitoken.id;


--
-- Name: authenticateduser; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE authenticateduser (
    id integer NOT NULL,
    affiliation character varying(255),
    email character varying(255) NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    modificationtime timestamp without time zone,
    "position" character varying(255),
    superuser boolean,
    useridentifier character varying(255) NOT NULL,
    emailconfirmed timestamp without time zone
);


ALTER TABLE public.authenticateduser OWNER TO dvnapp;

--
-- Name: authenticateduser_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE authenticateduser_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.authenticateduser_id_seq OWNER TO dvnapp;

--
-- Name: authenticateduser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE authenticateduser_id_seq OWNED BY authenticateduser.id;


--
-- Name: authenticateduserlookup; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE authenticateduserlookup (
    id integer NOT NULL,
    authenticationproviderid character varying(255),
    persistentuserid character varying(255),
    authenticateduser_id bigint NOT NULL
);


ALTER TABLE public.authenticateduserlookup OWNER TO dvnapp;

--
-- Name: authenticateduserlookup_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE authenticateduserlookup_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.authenticateduserlookup_id_seq OWNER TO dvnapp;

--
-- Name: authenticateduserlookup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE authenticateduserlookup_id_seq OWNED BY authenticateduserlookup.id;


--
-- Name: authenticationproviderrow; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE authenticationproviderrow (
    id character varying(255) NOT NULL,
    enabled boolean,
    factoryalias character varying(255),
    factorydata text,
    subtitle character varying(255),
    title character varying(255)
);


ALTER TABLE public.authenticationproviderrow OWNER TO dvnapp;

--
-- Name: builtinuser; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE builtinuser (
    id integer NOT NULL,
    affiliation character varying(255),
    email character varying(255) NOT NULL,
    encryptedpassword character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    passwordencryptionversion integer,
    "position" character varying(255),
    username character varying(255) NOT NULL
);


ALTER TABLE public.builtinuser OWNER TO dvnapp;

--
-- Name: builtinuser_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE builtinuser_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.builtinuser_id_seq OWNER TO dvnapp;

--
-- Name: builtinuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE builtinuser_id_seq OWNED BY builtinuser.id;


--
-- Name: clientharvestrun; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE clientharvestrun (
    id integer NOT NULL,
    deleteddatasetcount bigint,
    faileddatasetcount bigint,
    finishtime timestamp without time zone,
    harvestresult integer,
    harvesteddatasetcount bigint,
    starttime timestamp without time zone,
    harvestingclient_id bigint NOT NULL
);


ALTER TABLE public.clientharvestrun OWNER TO dvnapp;

--
-- Name: clientharvestrun_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE clientharvestrun_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.clientharvestrun_id_seq OWNER TO dvnapp;

--
-- Name: clientharvestrun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE clientharvestrun_id_seq OWNED BY clientharvestrun.id;


--
-- Name: confirmemaildata; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE confirmemaildata (
    id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    expires timestamp without time zone NOT NULL,
    token character varying(255),
    authenticateduser_id bigint NOT NULL
);


ALTER TABLE public.confirmemaildata OWNER TO dvnapp;

--
-- Name: confirmemaildata_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE confirmemaildata_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.confirmemaildata_id_seq OWNER TO dvnapp;

--
-- Name: confirmemaildata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE confirmemaildata_id_seq OWNED BY confirmemaildata.id;


--
-- Name: controlledvocabalternate; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE controlledvocabalternate (
    id integer NOT NULL,
    strvalue text,
    controlledvocabularyvalue_id bigint NOT NULL,
    datasetfieldtype_id bigint NOT NULL
);


ALTER TABLE public.controlledvocabalternate OWNER TO dvnapp;

--
-- Name: controlledvocabalternate_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE controlledvocabalternate_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.controlledvocabalternate_id_seq OWNER TO dvnapp;

--
-- Name: controlledvocabalternate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE controlledvocabalternate_id_seq OWNED BY controlledvocabalternate.id;


--
-- Name: controlledvocabularyvalue; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE controlledvocabularyvalue (
    id integer NOT NULL,
    displayorder integer,
    identifier character varying(255),
    strvalue text,
    datasetfieldtype_id bigint
);


ALTER TABLE public.controlledvocabularyvalue OWNER TO dvnapp;

--
-- Name: controlledvocabularyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE controlledvocabularyvalue_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.controlledvocabularyvalue_id_seq OWNER TO dvnapp;

--
-- Name: controlledvocabularyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE controlledvocabularyvalue_id_seq OWNED BY controlledvocabularyvalue.id;


--
-- Name: customfieldmap; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE customfieldmap (
    id integer NOT NULL,
    sourcedatasetfield character varying(255),
    sourcetemplate character varying(255),
    targetdatasetfield character varying(255)
);


ALTER TABLE public.customfieldmap OWNER TO dvnapp;

--
-- Name: customfieldmap_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE customfieldmap_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.customfieldmap_id_seq OWNER TO dvnapp;

--
-- Name: customfieldmap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE customfieldmap_id_seq OWNED BY customfieldmap.id;


--
-- Name: customquestion; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE customquestion (
    id integer NOT NULL,
    displayorder integer,
    hidden boolean,
    questionstring character varying(255) NOT NULL,
    questiontype character varying(255) NOT NULL,
    required boolean,
    guestbook_id bigint NOT NULL
);


ALTER TABLE public.customquestion OWNER TO dvnapp;

--
-- Name: customquestion_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE customquestion_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.customquestion_id_seq OWNER TO dvnapp;

--
-- Name: customquestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE customquestion_id_seq OWNED BY customquestion.id;


--
-- Name: customquestionresponse; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE customquestionresponse (
    id integer NOT NULL,
    response text,
    customquestion_id bigint NOT NULL,
    guestbookresponse_id bigint NOT NULL
);


ALTER TABLE public.customquestionresponse OWNER TO dvnapp;

--
-- Name: customquestionresponse_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE customquestionresponse_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.customquestionresponse_id_seq OWNER TO dvnapp;

--
-- Name: customquestionresponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE customquestionresponse_id_seq OWNED BY customquestionresponse.id;


--
-- Name: customquestionvalue; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE customquestionvalue (
    id integer NOT NULL,
    displayorder integer,
    valuestring character varying(255) NOT NULL,
    customquestion_id bigint NOT NULL
);


ALTER TABLE public.customquestionvalue OWNER TO dvnapp;

--
-- Name: customquestionvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE customquestionvalue_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.customquestionvalue_id_seq OWNER TO dvnapp;

--
-- Name: customquestionvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE customquestionvalue_id_seq OWNED BY customquestionvalue.id;


--
-- Name: datafile; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datafile (
    id bigint NOT NULL,
    contenttype character varying(255) NOT NULL,
    filesystemname character varying(255) NOT NULL,
    filesize bigint,
    ingeststatus character(1),
    checksumvalue character varying(255) NOT NULL,
    name character varying(255),
    restricted boolean,
    checksumtype character varying(255) NOT NULL
);


ALTER TABLE public.datafile OWNER TO dvnapp;

--
-- Name: datafilecategory; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datafilecategory (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    dataset_id bigint NOT NULL
);


ALTER TABLE public.datafilecategory OWNER TO dvnapp;

--
-- Name: datafilecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datafilecategory_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datafilecategory_id_seq OWNER TO dvnapp;

--
-- Name: datafilecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datafilecategory_id_seq OWNED BY datafilecategory.id;


--
-- Name: datafiletag; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datafiletag (
    id integer NOT NULL,
    type integer NOT NULL,
    datafile_id bigint NOT NULL
);


ALTER TABLE public.datafiletag OWNER TO dvnapp;

--
-- Name: datafiletag_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datafiletag_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datafiletag_id_seq OWNER TO dvnapp;

--
-- Name: datafiletag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datafiletag_id_seq OWNED BY datafiletag.id;


--
-- Name: dataset; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataset (
    id bigint NOT NULL,
    authority character varying(255),
    doiseparator character varying(255),
    fileaccessrequest boolean,
    globalidcreatetime timestamp without time zone,
    identifier character varying(255) NOT NULL,
    protocol character varying(255),
    guestbook_id bigint,
    thumbnailfile_id bigint,
    citationdatedatasetfieldtype_id bigint,
    lastexporttime timestamp without time zone,
    harvestingclient_id bigint,
    harvestidentifier character varying(255),
    dcmtype text,
    dcmvalue text
);


ALTER TABLE public.dataset OWNER TO dvnapp;

--
-- Name: datasetfield; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetfield (
    id integer NOT NULL,
    datasetfieldtype_id bigint NOT NULL,
    datasetversion_id bigint,
    parentdatasetfieldcompoundvalue_id bigint,
    template_id bigint
);


ALTER TABLE public.datasetfield OWNER TO dvnapp;

--
-- Name: datasetfield_controlledvocabularyvalue; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetfield_controlledvocabularyvalue (
    datasetfield_id bigint NOT NULL,
    controlledvocabularyvalues_id bigint NOT NULL
);


ALTER TABLE public.datasetfield_controlledvocabularyvalue OWNER TO dvnapp;

--
-- Name: datasetfield_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetfield_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetfield_id_seq OWNER TO dvnapp;

--
-- Name: datasetfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetfield_id_seq OWNED BY datasetfield.id;


--
-- Name: datasetfieldcompoundvalue; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetfieldcompoundvalue (
    id integer NOT NULL,
    displayorder integer,
    parentdatasetfield_id bigint
);


ALTER TABLE public.datasetfieldcompoundvalue OWNER TO dvnapp;

--
-- Name: datasetfieldcompoundvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetfieldcompoundvalue_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetfieldcompoundvalue_id_seq OWNER TO dvnapp;

--
-- Name: datasetfieldcompoundvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetfieldcompoundvalue_id_seq OWNED BY datasetfieldcompoundvalue.id;


--
-- Name: datasetfielddefaultvalue; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetfielddefaultvalue (
    id integer NOT NULL,
    displayorder integer,
    strvalue text,
    datasetfield_id bigint NOT NULL,
    defaultvalueset_id bigint NOT NULL,
    parentdatasetfielddefaultvalue_id bigint
);


ALTER TABLE public.datasetfielddefaultvalue OWNER TO dvnapp;

--
-- Name: datasetfielddefaultvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetfielddefaultvalue_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetfielddefaultvalue_id_seq OWNER TO dvnapp;

--
-- Name: datasetfielddefaultvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetfielddefaultvalue_id_seq OWNED BY datasetfielddefaultvalue.id;


--
-- Name: datasetfieldtype; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetfieldtype (
    id integer NOT NULL,
    advancedsearchfieldtype boolean,
    allowcontrolledvocabulary boolean,
    allowmultiples boolean,
    description text,
    displayformat character varying(255),
    displayoncreate boolean,
    displayorder integer,
    facetable boolean,
    fieldtype character varying(255) NOT NULL,
    name text,
    required boolean,
    title text,
    watermark character varying(255),
    metadatablock_id bigint,
    parentdatasetfieldtype_id bigint
);


ALTER TABLE public.datasetfieldtype OWNER TO dvnapp;

--
-- Name: datasetfieldtype_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetfieldtype_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetfieldtype_id_seq OWNER TO dvnapp;

--
-- Name: datasetfieldtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetfieldtype_id_seq OWNED BY datasetfieldtype.id;


--
-- Name: datasetfieldvalue; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetfieldvalue (
    id integer NOT NULL,
    displayorder integer,
    value text,
    datasetfield_id bigint NOT NULL
);


ALTER TABLE public.datasetfieldvalue OWNER TO dvnapp;

--
-- Name: datasetfieldvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetfieldvalue_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetfieldvalue_id_seq OWNER TO dvnapp;

--
-- Name: datasetfieldvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetfieldvalue_id_seq OWNED BY datasetfieldvalue.id;


--
-- Name: datasetlinkingdataverse; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetlinkingdataverse (
    id integer NOT NULL,
    linkcreatetime timestamp without time zone NOT NULL,
    dataset_id bigint NOT NULL,
    linkingdataverse_id bigint NOT NULL
);


ALTER TABLE public.datasetlinkingdataverse OWNER TO dvnapp;

--
-- Name: datasetlinkingdataverse_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetlinkingdataverse_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetlinkingdataverse_id_seq OWNER TO dvnapp;

--
-- Name: datasetlinkingdataverse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetlinkingdataverse_id_seq OWNED BY datasetlinkingdataverse.id;


--
-- Name: datasetlock; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetlock (
    id integer NOT NULL,
    info character varying(255),
    starttime timestamp without time zone,
    user_id bigint NOT NULL,
    dataset_id bigint NOT NULL
);


ALTER TABLE public.datasetlock OWNER TO dvnapp;

--
-- Name: datasetlock_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetlock_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetlock_id_seq OWNER TO dvnapp;

--
-- Name: datasetlock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetlock_id_seq OWNED BY datasetlock.id;


--
-- Name: datasetversion; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetversion (
    id integer NOT NULL,
    unf character varying(255),
    archivenote character varying(1000),
    archivetime timestamp without time zone,
    createtime timestamp without time zone NOT NULL,
    deaccessionlink character varying(255),
    inreview boolean,
    lastupdatetime timestamp without time zone NOT NULL,
    minorversionnumber bigint,
    releasetime timestamp without time zone,
    version bigint,
    versionnote character varying(1000),
    versionnumber bigint,
    versionstate character varying(255),
    dataset_id bigint,
    termsofuseandaccess_id bigint
);


ALTER TABLE public.datasetversion OWNER TO dvnapp;

--
-- Name: datasetversion_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetversion_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetversion_id_seq OWNER TO dvnapp;

--
-- Name: datasetversion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetversion_id_seq OWNED BY datasetversion.id;


--
-- Name: datasetversionuser; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datasetversionuser (
    id integer NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    authenticateduser_id bigint,
    datasetversion_id bigint
);


ALTER TABLE public.datasetversionuser OWNER TO dvnapp;

--
-- Name: datasetversionuser_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datasetversionuser_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datasetversionuser_id_seq OWNER TO dvnapp;

--
-- Name: datasetversionuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datasetversionuser_id_seq OWNED BY datasetversionuser.id;


--
-- Name: datatable; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datatable (
    id integer NOT NULL,
    casequantity bigint,
    originalfileformat character varying(255),
    originalformatversion character varying(255),
    recordspercase bigint,
    unf character varying(255) NOT NULL,
    varquantity bigint,
    datafile_id bigint NOT NULL
);


ALTER TABLE public.datatable OWNER TO dvnapp;

--
-- Name: datatable_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datatable_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datatable_id_seq OWNER TO dvnapp;

--
-- Name: datatable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datatable_id_seq OWNED BY datatable.id;


--
-- Name: datavariable; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE datavariable (
    id integer NOT NULL,
    fileendposition bigint,
    fileorder integer,
    filestartposition bigint,
    format character varying(255),
    formatcategory character varying(255),
    "interval" integer,
    label text,
    name character varying(255),
    numberofdecimalpoints bigint,
    orderedfactor boolean,
    recordsegmentnumber bigint,
    type integer,
    unf character varying(255),
    universe character varying(255),
    weighted boolean,
    datatable_id bigint NOT NULL
);


ALTER TABLE public.datavariable OWNER TO dvnapp;

--
-- Name: datavariable_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE datavariable_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.datavariable_id_seq OWNER TO dvnapp;

--
-- Name: datavariable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE datavariable_id_seq OWNED BY datavariable.id;


--
-- Name: dataverse; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataverse (
    id bigint NOT NULL,
    affiliation character varying(255),
    alias character varying(255) NOT NULL,
    dataversetype character varying(255) NOT NULL,
    description text,
    facetroot boolean,
    guestbookroot boolean,
    metadatablockroot boolean,
    name character varying(255) NOT NULL,
    permissionroot boolean,
    templateroot boolean,
    themeroot boolean,
    defaultcontributorrole_id bigint NOT NULL,
    defaulttemplate_id bigint,
    citationredirecturl character varying(255),
    fileuploadmechanisms character varying(255)
);


ALTER TABLE public.dataverse OWNER TO dvnapp;

--
-- Name: dataverse_citationdatasetfieldtypes; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataverse_citationdatasetfieldtypes (
    dataverse_id bigint NOT NULL,
    citationdatasetfieldtype_id bigint NOT NULL
);


ALTER TABLE public.dataverse_citationdatasetfieldtypes OWNER TO dvnapp;

--
-- Name: dataverse_metadatablock; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataverse_metadatablock (
    dataverse_id bigint NOT NULL,
    metadatablocks_id bigint NOT NULL
);


ALTER TABLE public.dataverse_metadatablock OWNER TO dvnapp;

--
-- Name: dataversecontact; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataversecontact (
    id integer NOT NULL,
    contactemail character varying(255) NOT NULL,
    displayorder integer,
    dataverse_id bigint
);


ALTER TABLE public.dataversecontact OWNER TO dvnapp;

--
-- Name: dataversecontact_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dataversecontact_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dataversecontact_id_seq OWNER TO dvnapp;

--
-- Name: dataversecontact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dataversecontact_id_seq OWNED BY dataversecontact.id;


--
-- Name: dataversefacet; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataversefacet (
    id integer NOT NULL,
    displayorder integer,
    datasetfieldtype_id bigint,
    dataverse_id bigint
);


ALTER TABLE public.dataversefacet OWNER TO dvnapp;

--
-- Name: dataversefacet_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dataversefacet_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dataversefacet_id_seq OWNER TO dvnapp;

--
-- Name: dataversefacet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dataversefacet_id_seq OWNED BY dataversefacet.id;


--
-- Name: dataversefeatureddataverse; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataversefeatureddataverse (
    id integer NOT NULL,
    displayorder integer,
    dataverse_id bigint,
    featureddataverse_id bigint
);


ALTER TABLE public.dataversefeatureddataverse OWNER TO dvnapp;

--
-- Name: dataversefeatureddataverse_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dataversefeatureddataverse_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dataversefeatureddataverse_id_seq OWNER TO dvnapp;

--
-- Name: dataversefeatureddataverse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dataversefeatureddataverse_id_seq OWNED BY dataversefeatureddataverse.id;


--
-- Name: dataversefieldtypeinputlevel; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataversefieldtypeinputlevel (
    id integer NOT NULL,
    include boolean,
    required boolean,
    datasetfieldtype_id bigint,
    dataverse_id bigint
);


ALTER TABLE public.dataversefieldtypeinputlevel OWNER TO dvnapp;

--
-- Name: dataversefieldtypeinputlevel_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dataversefieldtypeinputlevel_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dataversefieldtypeinputlevel_id_seq OWNER TO dvnapp;

--
-- Name: dataversefieldtypeinputlevel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dataversefieldtypeinputlevel_id_seq OWNED BY dataversefieldtypeinputlevel.id;


--
-- Name: dataverselinkingdataverse; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataverselinkingdataverse (
    id integer NOT NULL,
    linkcreatetime timestamp without time zone,
    dataverse_id bigint NOT NULL,
    linkingdataverse_id bigint NOT NULL
);


ALTER TABLE public.dataverselinkingdataverse OWNER TO dvnapp;

--
-- Name: dataverselinkingdataverse_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dataverselinkingdataverse_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dataverselinkingdataverse_id_seq OWNER TO dvnapp;

--
-- Name: dataverselinkingdataverse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dataverselinkingdataverse_id_seq OWNED BY dataverselinkingdataverse.id;


--
-- Name: dataverserole; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataverserole (
    id integer NOT NULL,
    alias character varying(255) NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL,
    permissionbits bigint,
    owner_id bigint
);


ALTER TABLE public.dataverserole OWNER TO dvnapp;

--
-- Name: dataverserole_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dataverserole_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dataverserole_id_seq OWNER TO dvnapp;

--
-- Name: dataverserole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dataverserole_id_seq OWNED BY dataverserole.id;


--
-- Name: dataversesubjects; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataversesubjects (
    dataverse_id bigint NOT NULL,
    controlledvocabularyvalue_id bigint NOT NULL
);


ALTER TABLE public.dataversesubjects OWNER TO dvnapp;

--
-- Name: dataversetheme; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dataversetheme (
    id integer NOT NULL,
    backgroundcolor character varying(255),
    linkcolor character varying(255),
    linkurl character varying(255),
    logo character varying(255),
    logoalignment character varying(255),
    logobackgroundcolor character varying(255),
    logoformat character varying(255),
    tagline character varying(255),
    textcolor character varying(255),
    dataverse_id bigint
);


ALTER TABLE public.dataversetheme OWNER TO dvnapp;

--
-- Name: dataversetheme_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dataversetheme_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dataversetheme_id_seq OWNER TO dvnapp;

--
-- Name: dataversetheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dataversetheme_id_seq OWNED BY dataversetheme.id;


--
-- Name: defaultvalueset; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE defaultvalueset (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.defaultvalueset OWNER TO dvnapp;

--
-- Name: defaultvalueset_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE defaultvalueset_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.defaultvalueset_id_seq OWNER TO dvnapp;

--
-- Name: defaultvalueset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE defaultvalueset_id_seq OWNED BY defaultvalueset.id;


--
-- Name: doidataciteregistercache; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE doidataciteregistercache (
    id integer NOT NULL,
    doi character varying(255),
    status character varying(255),
    url character varying(255),
    xml text
);


ALTER TABLE public.doidataciteregistercache OWNER TO dvnapp;

--
-- Name: doidataciteregistercache_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE doidataciteregistercache_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.doidataciteregistercache_id_seq OWNER TO dvnapp;

--
-- Name: doidataciteregistercache_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE doidataciteregistercache_id_seq OWNED BY doidataciteregistercache.id;


--
-- Name: dvobject; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE dvobject (
    id integer NOT NULL,
    dtype character varying(31),
    createdate timestamp without time zone NOT NULL,
    indextime timestamp without time zone,
    modificationtime timestamp without time zone NOT NULL,
    permissionindextime timestamp without time zone,
    permissionmodificationtime timestamp without time zone,
    previewimageavailable boolean,
    publicationdate timestamp without time zone,
    creator_id bigint,
    owner_id bigint,
    releaseuser_id bigint
);


ALTER TABLE public.dvobject OWNER TO dvnapp;

--
-- Name: dvobject_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE dvobject_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.dvobject_id_seq OWNER TO dvnapp;

--
-- Name: dvobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE dvobject_id_seq OWNED BY dvobject.id;


--
-- Name: explicitgroup; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE explicitgroup (
    id integer NOT NULL,
    description character varying(1024),
    displayname character varying(255),
    groupalias character varying(255),
    groupaliasinowner character varying(255),
    owner_id bigint
);


ALTER TABLE public.explicitgroup OWNER TO dvnapp;

--
-- Name: explicitgroup_authenticateduser; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE explicitgroup_authenticateduser (
    explicitgroup_id bigint NOT NULL,
    containedauthenticatedusers_id bigint NOT NULL
);


ALTER TABLE public.explicitgroup_authenticateduser OWNER TO dvnapp;

--
-- Name: explicitgroup_containedroleassignees; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE explicitgroup_containedroleassignees (
    explicitgroup_id bigint,
    containedroleassignees character varying(255)
);


ALTER TABLE public.explicitgroup_containedroleassignees OWNER TO dvnapp;

--
-- Name: explicitgroup_explicitgroup; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE explicitgroup_explicitgroup (
    explicitgroup_id bigint NOT NULL,
    containedexplicitgroups_id bigint NOT NULL
);


ALTER TABLE public.explicitgroup_explicitgroup OWNER TO dvnapp;

--
-- Name: explicitgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE explicitgroup_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.explicitgroup_id_seq OWNER TO dvnapp;

--
-- Name: explicitgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE explicitgroup_id_seq OWNED BY explicitgroup.id;


--
-- Name: fileaccessrequests; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE fileaccessrequests (
    datafile_id bigint NOT NULL,
    authenticated_user_id bigint NOT NULL
);


ALTER TABLE public.fileaccessrequests OWNER TO dvnapp;

--
-- Name: filemetadata; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE filemetadata (
    id integer NOT NULL,
    description text,
    label character varying(255) NOT NULL,
    restricted boolean,
    version bigint,
    datafile_id bigint NOT NULL,
    datasetversion_id bigint NOT NULL,
    directorylabel character varying(255)
);


ALTER TABLE public.filemetadata OWNER TO dvnapp;

--
-- Name: filemetadata_datafilecategory; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE filemetadata_datafilecategory (
    filecategories_id bigint NOT NULL,
    filemetadatas_id bigint NOT NULL
);


ALTER TABLE public.filemetadata_datafilecategory OWNER TO dvnapp;

--
-- Name: filemetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE filemetadata_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.filemetadata_id_seq OWNER TO dvnapp;

--
-- Name: filemetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE filemetadata_id_seq OWNED BY filemetadata.id;


--
-- Name: foreignmetadatafieldmapping; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE foreignmetadatafieldmapping (
    id integer NOT NULL,
    datasetfieldname text,
    foreignfieldxpath text,
    isattribute boolean,
    foreignmetadataformatmapping_id bigint,
    parentfieldmapping_id bigint
);


ALTER TABLE public.foreignmetadatafieldmapping OWNER TO dvnapp;

--
-- Name: foreignmetadatafieldmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE foreignmetadatafieldmapping_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.foreignmetadatafieldmapping_id_seq OWNER TO dvnapp;

--
-- Name: foreignmetadatafieldmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE foreignmetadatafieldmapping_id_seq OWNED BY foreignmetadatafieldmapping.id;


--
-- Name: foreignmetadataformatmapping; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE foreignmetadataformatmapping (
    id integer NOT NULL,
    displayname character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    schemalocation character varying(255),
    startelement character varying(255)
);


ALTER TABLE public.foreignmetadataformatmapping OWNER TO dvnapp;

--
-- Name: foreignmetadataformatmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE foreignmetadataformatmapping_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.foreignmetadataformatmapping_id_seq OWNER TO dvnapp;

--
-- Name: foreignmetadataformatmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE foreignmetadataformatmapping_id_seq OWNED BY foreignmetadataformatmapping.id;


--
-- Name: guestbook; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE guestbook (
    id integer NOT NULL,
    createtime timestamp without time zone NOT NULL,
    emailrequired boolean,
    enabled boolean,
    institutionrequired boolean,
    name character varying(255),
    namerequired boolean,
    positionrequired boolean,
    dataverse_id bigint
);


ALTER TABLE public.guestbook OWNER TO dvnapp;

--
-- Name: guestbook_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE guestbook_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.guestbook_id_seq OWNER TO dvnapp;

--
-- Name: guestbook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE guestbook_id_seq OWNED BY guestbook.id;


--
-- Name: guestbookresponse; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE guestbookresponse (
    id integer NOT NULL,
    downloadtype character varying(255),
    email character varying(255),
    institution character varying(255),
    name character varying(255),
    "position" character varying(255),
    responsetime timestamp without time zone,
    sessionid character varying(255),
    authenticateduser_id bigint,
    datafile_id bigint NOT NULL,
    dataset_id bigint NOT NULL,
    datasetversion_id bigint,
    guestbook_id bigint NOT NULL
);


ALTER TABLE public.guestbookresponse OWNER TO dvnapp;

--
-- Name: guestbookresponse_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE guestbookresponse_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.guestbookresponse_id_seq OWNER TO dvnapp;

--
-- Name: guestbookresponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE guestbookresponse_id_seq OWNED BY guestbookresponse.id;


--
-- Name: harvestingclient; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE harvestingclient (
    id integer NOT NULL,
    archivedescription text,
    archiveurl character varying(255),
    deleted boolean,
    harveststyle character varying(255),
    harvesttype character varying(255),
    harvestingnow boolean,
    harvestingset character varying(255),
    harvestingurl character varying(255),
    metadataprefix character varying(255),
    name character varying(255) NOT NULL,
    scheduledayofweek integer,
    schedulehourofday integer,
    scheduleperiod character varying(255),
    scheduled boolean,
    dataverse_id bigint
);


ALTER TABLE public.harvestingclient OWNER TO dvnapp;

--
-- Name: harvestingclient_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE harvestingclient_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.harvestingclient_id_seq OWNER TO dvnapp;

--
-- Name: harvestingclient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE harvestingclient_id_seq OWNED BY harvestingclient.id;


--
-- Name: harvestingdataverseconfig; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE harvestingdataverseconfig (
    id bigint NOT NULL,
    archivedescription text,
    archiveurl character varying(255),
    harveststyle character varying(255),
    harvesttype character varying(255),
    harvestingset character varying(255),
    harvestingurl character varying(255),
    dataverse_id bigint
);


ALTER TABLE public.harvestingdataverseconfig OWNER TO dvnapp;

--
-- Name: ingestreport; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE ingestreport (
    id integer NOT NULL,
    endtime timestamp without time zone,
    report character varying(255),
    starttime timestamp without time zone,
    status integer,
    type integer,
    datafile_id bigint NOT NULL
);


ALTER TABLE public.ingestreport OWNER TO dvnapp;

--
-- Name: ingestreport_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE ingestreport_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.ingestreport_id_seq OWNER TO dvnapp;

--
-- Name: ingestreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE ingestreport_id_seq OWNED BY ingestreport.id;


--
-- Name: ingestrequest; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE ingestrequest (
    id integer NOT NULL,
    controlcard character varying(255),
    labelsfile character varying(255),
    textencoding character varying(255),
    datafile_id bigint
);


ALTER TABLE public.ingestrequest OWNER TO dvnapp;

--
-- Name: ingestrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE ingestrequest_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.ingestrequest_id_seq OWNER TO dvnapp;

--
-- Name: ingestrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE ingestrequest_id_seq OWNED BY ingestrequest.id;


--
-- Name: ipv4range; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE ipv4range (
    id bigint NOT NULL,
    bottomaslong bigint,
    topaslong bigint,
    owner_id bigint
);


ALTER TABLE public.ipv4range OWNER TO dvnapp;

--
-- Name: ipv6range; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE ipv6range (
    id bigint NOT NULL,
    bottoma bigint,
    bottomb bigint,
    bottomc bigint,
    bottomd bigint,
    topa bigint,
    topb bigint,
    topc bigint,
    topd bigint,
    owner_id bigint
);


ALTER TABLE public.ipv6range OWNER TO dvnapp;

--
-- Name: maplayermetadata; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE maplayermetadata (
    id integer NOT NULL,
    embedmaplink character varying(255) NOT NULL,
    layerlink character varying(255) NOT NULL,
    layername character varying(255) NOT NULL,
    mapimagelink character varying(255),
    worldmapusername character varying(255) NOT NULL,
    dataset_id bigint NOT NULL,
    datafile_id bigint NOT NULL,
    isjoinlayer boolean DEFAULT false,
    joindescription text,
    maplayerlinks text
);


ALTER TABLE public.maplayermetadata OWNER TO dvnapp;

--
-- Name: maplayermetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE maplayermetadata_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.maplayermetadata_id_seq OWNER TO dvnapp;

--
-- Name: maplayermetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE maplayermetadata_id_seq OWNED BY maplayermetadata.id;


--
-- Name: metadatablock; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE metadatablock (
    id integer NOT NULL,
    displayname character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    owner_id bigint
);


ALTER TABLE public.metadatablock OWNER TO dvnapp;

--
-- Name: metadatablock_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE metadatablock_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.metadatablock_id_seq OWNER TO dvnapp;

--
-- Name: metadatablock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE metadatablock_id_seq OWNED BY metadatablock.id;


--
-- Name: oairecord; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE oairecord (
    id integer NOT NULL,
    globalid character varying(255),
    lastupdatetime timestamp without time zone,
    removed boolean,
    setname character varying(255)
);


ALTER TABLE public.oairecord OWNER TO dvnapp;

--
-- Name: oairecord_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE oairecord_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.oairecord_id_seq OWNER TO dvnapp;

--
-- Name: oairecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE oairecord_id_seq OWNED BY oairecord.id;


--
-- Name: oaiset; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE oaiset (
    id integer NOT NULL,
    definition text,
    deleted boolean,
    description text,
    name text,
    spec text,
    updateinprogress boolean,
    version bigint
);


ALTER TABLE public.oaiset OWNER TO dvnapp;

--
-- Name: oaiset_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE oaiset_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.oaiset_id_seq OWNER TO dvnapp;

--
-- Name: oaiset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE oaiset_id_seq OWNED BY oaiset.id;


--
-- Name: passwordresetdata; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE passwordresetdata (
    id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    expires timestamp without time zone NOT NULL,
    reason character varying(255),
    token character varying(255),
    builtinuser_id bigint NOT NULL
);


ALTER TABLE public.passwordresetdata OWNER TO dvnapp;

--
-- Name: passwordresetdata_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE passwordresetdata_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.passwordresetdata_id_seq OWNER TO dvnapp;

--
-- Name: passwordresetdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE passwordresetdata_id_seq OWNED BY passwordresetdata.id;


--
-- Name: persistedglobalgroup; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE persistedglobalgroup (
    id bigint NOT NULL,
    dtype character varying(31),
    description character varying(255),
    displayname character varying(255),
    persistedgroupalias character varying(255)
);


ALTER TABLE public.persistedglobalgroup OWNER TO dvnapp;

--
-- Name: roleassignment; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE roleassignment (
    id integer NOT NULL,
    assigneeidentifier character varying(255) NOT NULL,
    definitionpoint_id bigint NOT NULL,
    role_id bigint NOT NULL,
    privateurltoken character varying(255)
);


ALTER TABLE public.roleassignment OWNER TO dvnapp;

--
-- Name: roleassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE roleassignment_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.roleassignment_id_seq OWNER TO dvnapp;

--
-- Name: roleassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE roleassignment_id_seq OWNED BY roleassignment.id;


--
-- Name: savedsearch; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE savedsearch (
    id integer NOT NULL,
    query text,
    creator_id bigint NOT NULL,
    definitionpoint_id bigint NOT NULL
);


ALTER TABLE public.savedsearch OWNER TO dvnapp;

--
-- Name: savedsearch_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE savedsearch_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.savedsearch_id_seq OWNER TO dvnapp;

--
-- Name: savedsearch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE savedsearch_id_seq OWNED BY savedsearch.id;


--
-- Name: savedsearchfilterquery; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE savedsearchfilterquery (
    id integer NOT NULL,
    filterquery text,
    savedsearch_id bigint NOT NULL
);


ALTER TABLE public.savedsearchfilterquery OWNER TO dvnapp;

--
-- Name: savedsearchfilterquery_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE savedsearchfilterquery_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.savedsearchfilterquery_id_seq OWNER TO dvnapp;

--
-- Name: savedsearchfilterquery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE savedsearchfilterquery_id_seq OWNED BY savedsearchfilterquery.id;


--
-- Name: sequence; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE sequence (
    seq_name character varying(50) NOT NULL,
    seq_count numeric(38,0)
);


ALTER TABLE public.sequence OWNER TO dvnapp;

--
-- Name: setting; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE setting (
    name character varying(255) NOT NULL,
    content text
);


ALTER TABLE public.setting OWNER TO dvnapp;

--
-- Name: shibgroup; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE shibgroup (
    id integer NOT NULL,
    attribute character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    pattern character varying(255) NOT NULL
);


ALTER TABLE public.shibgroup OWNER TO dvnapp;

--
-- Name: shibgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE shibgroup_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.shibgroup_id_seq OWNER TO dvnapp;

--
-- Name: shibgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE shibgroup_id_seq OWNED BY shibgroup.id;


--
-- Name: summarystatistic; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE summarystatistic (
    id integer NOT NULL,
    type integer,
    value character varying(255),
    datavariable_id bigint NOT NULL
);


ALTER TABLE public.summarystatistic OWNER TO dvnapp;

--
-- Name: summarystatistic_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE summarystatistic_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.summarystatistic_id_seq OWNER TO dvnapp;

--
-- Name: summarystatistic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE summarystatistic_id_seq OWNED BY summarystatistic.id;


--
-- Name: template; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE template (
    id integer NOT NULL,
    createtime timestamp without time zone NOT NULL,
    name character varying(255) NOT NULL,
    usagecount bigint,
    dataverse_id bigint,
    termsofuseandaccess_id bigint
);


ALTER TABLE public.template OWNER TO dvnapp;

--
-- Name: template_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE template_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.template_id_seq OWNER TO dvnapp;

--
-- Name: template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE template_id_seq OWNED BY template.id;


--
-- Name: termsofuseandaccess; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE termsofuseandaccess (
    id integer NOT NULL,
    availabilitystatus text,
    citationrequirements text,
    conditions text,
    confidentialitydeclaration text,
    contactforaccess text,
    dataaccessplace text,
    depositorrequirements text,
    disclaimer text,
    fileaccessrequest boolean,
    license character varying(255),
    originalarchive text,
    restrictions text,
    sizeofcollection text,
    specialpermissions text,
    studycompletion text,
    termsofaccess text,
    termsofuse text
);


ALTER TABLE public.termsofuseandaccess OWNER TO dvnapp;

--
-- Name: termsofuseandaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE termsofuseandaccess_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.termsofuseandaccess_id_seq OWNER TO dvnapp;

--
-- Name: termsofuseandaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE termsofuseandaccess_id_seq OWNED BY termsofuseandaccess.id;


--
-- Name: usernotification; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE usernotification (
    id integer NOT NULL,
    emailed boolean,
    objectid bigint,
    readnotification boolean,
    senddate timestamp without time zone,
    type integer NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.usernotification OWNER TO dvnapp;

--
-- Name: usernotification_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE usernotification_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.usernotification_id_seq OWNER TO dvnapp;

--
-- Name: usernotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE usernotification_id_seq OWNED BY usernotification.id;


--
-- Name: variablecategory; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE variablecategory (
    id integer NOT NULL,
    catorder integer,
    frequency double precision,
    label character varying(255),
    missing boolean,
    value character varying(255),
    datavariable_id bigint NOT NULL
);


ALTER TABLE public.variablecategory OWNER TO dvnapp;

--
-- Name: variablecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE variablecategory_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.variablecategory_id_seq OWNER TO dvnapp;

--
-- Name: variablecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE variablecategory_id_seq OWNED BY variablecategory.id;


--
-- Name: variablerange; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE variablerange (
    id integer NOT NULL,
    beginvalue character varying(255),
    beginvaluetype integer,
    endvalue character varying(255),
    endvaluetype integer,
    datavariable_id bigint NOT NULL
);


ALTER TABLE public.variablerange OWNER TO dvnapp;

--
-- Name: variablerange_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE variablerange_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.variablerange_id_seq OWNER TO dvnapp;

--
-- Name: variablerange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE variablerange_id_seq OWNED BY variablerange.id;


--
-- Name: variablerangeitem; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE variablerangeitem (
    id integer NOT NULL,
    value numeric(38,0),
    datavariable_id bigint NOT NULL
);


ALTER TABLE public.variablerangeitem OWNER TO dvnapp;

--
-- Name: variablerangeitem_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE variablerangeitem_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.variablerangeitem_id_seq OWNER TO dvnapp;

--
-- Name: variablerangeitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE variablerangeitem_id_seq OWNED BY variablerangeitem.id;


--
-- Name: worldmapauth_token; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE worldmapauth_token (
    id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    hasexpired boolean NOT NULL,
    lastrefreshtime timestamp without time zone NOT NULL,
    modified timestamp without time zone NOT NULL,
    token character varying(255),
    application_id bigint NOT NULL,
    datafile_id bigint NOT NULL,
    dataverseuser_id bigint NOT NULL
);


ALTER TABLE public.worldmapauth_token OWNER TO dvnapp;

--
-- Name: worldmapauth_token_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE worldmapauth_token_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.worldmapauth_token_id_seq OWNER TO dvnapp;

--
-- Name: worldmapauth_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE worldmapauth_token_id_seq OWNED BY worldmapauth_token.id;


--
-- Name: worldmapauth_tokentype; Type: TABLE; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE TABLE worldmapauth_tokentype (
    id integer NOT NULL,
    contactemail character varying(255),
    created timestamp without time zone NOT NULL,
    hostname character varying(255),
    ipaddress character varying(255),
    mapitlink character varying(255) NOT NULL,
    md5 character varying(255) NOT NULL,
    modified timestamp without time zone NOT NULL,
    name character varying(255) NOT NULL,
    timelimitminutes integer DEFAULT 30,
    timelimitseconds bigint DEFAULT 1800
);


ALTER TABLE public.worldmapauth_tokentype OWNER TO dvnapp;

--
-- Name: worldmapauth_tokentype_id_seq; Type: SEQUENCE; Schema: public; Owner: dvnapp
--

CREATE SEQUENCE worldmapauth_tokentype_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE public.worldmapauth_tokentype_id_seq OWNER TO dvnapp;

--
-- Name: worldmapauth_tokentype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dvnapp
--

ALTER SEQUENCE worldmapauth_tokentype_id_seq OWNED BY worldmapauth_tokentype.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY apitoken ALTER COLUMN id SET DEFAULT nextval('apitoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY authenticateduser ALTER COLUMN id SET DEFAULT nextval('authenticateduser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY authenticateduserlookup ALTER COLUMN id SET DEFAULT nextval('authenticateduserlookup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY builtinuser ALTER COLUMN id SET DEFAULT nextval('builtinuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY clientharvestrun ALTER COLUMN id SET DEFAULT nextval('clientharvestrun_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY confirmemaildata ALTER COLUMN id SET DEFAULT nextval('confirmemaildata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY controlledvocabalternate ALTER COLUMN id SET DEFAULT nextval('controlledvocabalternate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY controlledvocabularyvalue ALTER COLUMN id SET DEFAULT nextval('controlledvocabularyvalue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customfieldmap ALTER COLUMN id SET DEFAULT nextval('customfieldmap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customquestion ALTER COLUMN id SET DEFAULT nextval('customquestion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customquestionresponse ALTER COLUMN id SET DEFAULT nextval('customquestionresponse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customquestionvalue ALTER COLUMN id SET DEFAULT nextval('customquestionvalue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datafilecategory ALTER COLUMN id SET DEFAULT nextval('datafilecategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datafiletag ALTER COLUMN id SET DEFAULT nextval('datafiletag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfield ALTER COLUMN id SET DEFAULT nextval('datasetfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfieldcompoundvalue ALTER COLUMN id SET DEFAULT nextval('datasetfieldcompoundvalue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfielddefaultvalue ALTER COLUMN id SET DEFAULT nextval('datasetfielddefaultvalue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfieldtype ALTER COLUMN id SET DEFAULT nextval('datasetfieldtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfieldvalue ALTER COLUMN id SET DEFAULT nextval('datasetfieldvalue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetlinkingdataverse ALTER COLUMN id SET DEFAULT nextval('datasetlinkingdataverse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetlock ALTER COLUMN id SET DEFAULT nextval('datasetlock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetversion ALTER COLUMN id SET DEFAULT nextval('datasetversion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetversionuser ALTER COLUMN id SET DEFAULT nextval('datasetversionuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datatable ALTER COLUMN id SET DEFAULT nextval('datatable_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datavariable ALTER COLUMN id SET DEFAULT nextval('datavariable_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversecontact ALTER COLUMN id SET DEFAULT nextval('dataversecontact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefacet ALTER COLUMN id SET DEFAULT nextval('dataversefacet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefeatureddataverse ALTER COLUMN id SET DEFAULT nextval('dataversefeatureddataverse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefieldtypeinputlevel ALTER COLUMN id SET DEFAULT nextval('dataversefieldtypeinputlevel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverselinkingdataverse ALTER COLUMN id SET DEFAULT nextval('dataverselinkingdataverse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverserole ALTER COLUMN id SET DEFAULT nextval('dataverserole_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversetheme ALTER COLUMN id SET DEFAULT nextval('dataversetheme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY defaultvalueset ALTER COLUMN id SET DEFAULT nextval('defaultvalueset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dvobject ALTER COLUMN id SET DEFAULT nextval('dvobject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY explicitgroup ALTER COLUMN id SET DEFAULT nextval('explicitgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY filemetadata ALTER COLUMN id SET DEFAULT nextval('filemetadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY foreignmetadatafieldmapping ALTER COLUMN id SET DEFAULT nextval('foreignmetadatafieldmapping_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY foreignmetadataformatmapping ALTER COLUMN id SET DEFAULT nextval('foreignmetadataformatmapping_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbook ALTER COLUMN id SET DEFAULT nextval('guestbook_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbookresponse ALTER COLUMN id SET DEFAULT nextval('guestbookresponse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY harvestingclient ALTER COLUMN id SET DEFAULT nextval('harvestingclient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY ingestreport ALTER COLUMN id SET DEFAULT nextval('ingestreport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY ingestrequest ALTER COLUMN id SET DEFAULT nextval('ingestrequest_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY maplayermetadata ALTER COLUMN id SET DEFAULT nextval('maplayermetadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY metadatablock ALTER COLUMN id SET DEFAULT nextval('metadatablock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY oairecord ALTER COLUMN id SET DEFAULT nextval('oairecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY oaiset ALTER COLUMN id SET DEFAULT nextval('oaiset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY passwordresetdata ALTER COLUMN id SET DEFAULT nextval('passwordresetdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY roleassignment ALTER COLUMN id SET DEFAULT nextval('roleassignment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY savedsearch ALTER COLUMN id SET DEFAULT nextval('savedsearch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY savedsearchfilterquery ALTER COLUMN id SET DEFAULT nextval('savedsearchfilterquery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY shibgroup ALTER COLUMN id SET DEFAULT nextval('shibgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY summarystatistic ALTER COLUMN id SET DEFAULT nextval('summarystatistic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY template ALTER COLUMN id SET DEFAULT nextval('template_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY termsofuseandaccess ALTER COLUMN id SET DEFAULT nextval('termsofuseandaccess_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY usernotification ALTER COLUMN id SET DEFAULT nextval('usernotification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY variablecategory ALTER COLUMN id SET DEFAULT nextval('variablecategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY variablerange ALTER COLUMN id SET DEFAULT nextval('variablerange_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY variablerangeitem ALTER COLUMN id SET DEFAULT nextval('variablerangeitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY worldmapauth_token ALTER COLUMN id SET DEFAULT nextval('worldmapauth_token_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY worldmapauth_tokentype ALTER COLUMN id SET DEFAULT nextval('worldmapauth_tokentype_id_seq'::regclass);


--
-- Data for Name: EJB__TIMER__TBL; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: actionlogrecord; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO actionlogrecord VALUES ('74d54e92-ef45-450a-8b4d-33c81ca01ad2', 'OK', 'registerProvider', 'Auth', '2016-09-27 19:37:22.734', 'builtin:Build-in Provider', '2016-09-27 19:37:22.732', NULL);
INSERT INTO actionlogrecord VALUES ('9f6e09a1-dd33-4300-8ef2-8d1fe2266542', 'OK', 'registerProvider', 'Auth', '2016-09-27 19:37:22.744', 'echo-simple:Echo provider', '2016-09-27 19:37:22.744', NULL);
INSERT INTO actionlogrecord VALUES ('6342eacf-2f37-4bce-bc00-022364242f73', 'OK', 'registerProvider', 'Auth', '2016-09-27 19:37:22.746', 'echo-dignified:Dignified Echo provider', '2016-09-27 19:37:22.746', NULL);
INSERT INTO actionlogrecord VALUES ('3c08f2b5-f88a-4c50-a3b2-d9d1244d8a98', 'OK', 'updateUser', 'Auth', '2016-09-27 19:38:05.763', '@dataverseAdmin', '2016-09-27 19:38:05.763', NULL);
INSERT INTO actionlogrecord VALUES ('e08fd1af-fba4-4036-a4c8-59cf045aebe4', 'OK', 'login', 'SessionManagement', '2016-09-27 19:38:05.778', NULL, '2016-09-27 19:38:05.778', '@dataverseAdmin');
INSERT INTO actionlogrecord VALUES ('46da0b6e-2be7-4492-b033-7c754bb427a7', 'OK', 'registerProvider', 'Auth', '2016-10-25 09:24:19.772', 'builtin:Build-in Provider', '2016-10-25 09:24:19.769', NULL);
INSERT INTO actionlogrecord VALUES ('80493882-1acc-433b-a41c-76c770a54310', 'OK', 'registerProvider', 'Auth', '2016-10-25 09:24:19.79', 'echo-simple:Echo provider', '2016-10-25 09:24:19.79', NULL);
INSERT INTO actionlogrecord VALUES ('a9c4a67d-b4bd-42f2-adcf-4dcacfee8872', 'OK', 'registerProvider', 'Auth', '2016-10-25 09:24:19.798', 'echo-dignified:Dignified Echo provider', '2016-10-25 09:24:19.798', NULL);
INSERT INTO actionlogrecord VALUES ('498858a2-5a02-4232-8333-1d9e8f10f955', 'OK', 'updateUser', 'Auth', '2016-10-25 09:25:06.95', '@dataverseAdmin', '2016-10-25 09:25:06.949', NULL);
INSERT INTO actionlogrecord VALUES ('5b685c68-4919-463c-a4a0-fe87e5f7ae66', 'OK', 'login', 'SessionManagement', '2016-10-25 09:25:06.96', NULL, '2016-10-25 09:25:06.96', '@dataverseAdmin');
INSERT INTO actionlogrecord VALUES ('3a2333eb-fdd8-47c7-9e08-1882ef49cb42', 'OK', 'registerProvider', 'Auth', '2016-10-25 09:37:55.576', 'builtin:Build-in Provider', '2016-10-25 09:37:55.573', NULL);
INSERT INTO actionlogrecord VALUES ('43051e40-4392-4ea8-b564-c7274af0eedd', 'OK', 'registerProvider', 'Auth', '2016-10-25 09:37:55.59', 'echo-simple:Echo provider', '2016-10-25 09:37:55.59', NULL);
INSERT INTO actionlogrecord VALUES ('24a6872d-4f70-4fa9-b7b7-9114de50ca23', 'OK', 'registerProvider', 'Auth', '2016-10-25 09:37:55.592', 'echo-dignified:Dignified Echo provider', '2016-10-25 09:37:55.592', NULL);
INSERT INTO actionlogrecord VALUES ('aa7fa540-22bf-4e4e-8d4f-3f4d4cf5519b', 'OK', 'updateUser', 'Auth', '2016-10-25 09:38:08.899', '@dataverseAdmin', '2016-10-25 09:38:08.899', NULL);
INSERT INTO actionlogrecord VALUES ('dc637410-37fa-414c-8c7c-f4723c6b444b', 'OK', 'login', 'SessionManagement', '2016-10-25 09:38:08.909', NULL, '2016-10-25 09:38:08.909', '@dataverseAdmin');
INSERT INTO actionlogrecord VALUES ('731eab97-848c-4fdc-b405-bf38d45b3348', 'OK', 'loadDatasetFields', 'Admin', '2016-10-25 09:43:54.119', 'rep3418087237302679591tmp', '2016-10-25 09:43:53.992', NULL);
INSERT INTO actionlogrecord VALUES ('30128a9f-b3c8-4b1f-b763-1806a881cf3d', 'OK', 'loadDatasetFields', 'Admin', '2016-10-25 09:44:26.123', 'rep6829011976025318207tmp', '2016-10-25 09:44:25.855', NULL);
INSERT INTO actionlogrecord VALUES ('72fb584d-95ed-491d-9ecc-f019f71d16c1', 'OK', 'loadDatasetFields', 'Admin', '2016-10-25 09:44:54.157', 'rep7328282697357954051tmp', '2016-10-25 09:44:53.74', NULL);
INSERT INTO actionlogrecord VALUES ('68d1b4de-c40c-4b2d-8e23-920055a79df8', 'OK', 'edu.harvard.iq.dataverse.engine.command.impl.UpdateDataverseMetadataBlocksCommand.SetRoot', 'Command', '2016-10-25 09:45:23.637', ':[1 Root] ', '2016-10-25 09:45:23.627', '@dataverseAdmin');
INSERT INTO actionlogrecord VALUES ('d2fa1221-a4ab-4e3f-8f1f-6b1f5d63d33b', 'OK', 'edu.harvard.iq.dataverse.engine.command.impl.UpdateDataverseMetadataBlocksCommand.SetBlocks', 'Command', '2016-10-25 09:45:23.638', ':[1 Root] ', '2016-10-25 09:45:23.618', '@dataverseAdmin');
INSERT INTO actionlogrecord VALUES ('f2788848-8bb8-4dde-94fe-d298ea497991', 'OK', 'registerProvider', 'Auth', '2016-11-17 18:26:11.767', 'builtin:Build-in Provider', '2016-11-17 18:26:11.764', NULL);
INSERT INTO actionlogrecord VALUES ('33d9cd90-32a1-4fc1-ae76-d8517d79d55b', 'OK', 'registerProvider', 'Auth', '2016-11-17 18:26:11.787', 'echo-simple:Echo provider', '2016-11-17 18:26:11.787', NULL);
INSERT INTO actionlogrecord VALUES ('a0eab252-df73-434b-94c7-2abf5306ba66', 'OK', 'registerProvider', 'Auth', '2016-11-17 18:26:11.795', 'echo-dignified:Dignified Echo provider', '2016-11-17 18:26:11.795', NULL);
INSERT INTO actionlogrecord VALUES ('072927f1-a003-45cf-a01b-2a463f85c6b8', 'OK', 'updateUser', 'Auth', '2016-11-17 18:26:26.286', '@dataverseAdmin', '2016-11-17 18:26:26.285', NULL);
INSERT INTO actionlogrecord VALUES ('6af8355b-a8fe-4447-8e11-481fe6590ae0', 'OK', 'login', 'SessionManagement', '2016-11-17 18:26:26.303', NULL, '2016-11-17 18:26:26.303', '@dataverseAdmin');
INSERT INTO actionlogrecord VALUES ('d99617f7-6f05-4b98-963f-8b57709018c8', 'OK', 'edu.harvard.iq.dataverse.engine.command.impl.PublishDataverseCommand', 'Command', '2016-11-17 18:26:33.08', ':[1 Root] ', '2016-11-17 18:26:32.889', '@dataverseAdmin');


--
-- Data for Name: apitoken; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO apitoken VALUES (1, '2016-03-03 15:34:02.469', false, '2017-03-03 15:34:02.469', 'ea244329-a0cf-4a36-a530-f173e3762d3c', 1);


--
-- Name: apitoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('apitoken_id_seq', 2, true);


--
-- Data for Name: authenticateduser; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO authenticateduser VALUES (1, 'Dataverse.org', 'dataverse@mailinator.com', 'Dataverse', 'Admin', '2016-11-17 18:26:26.29', 'Admin', true, 'dataverseAdmin', NULL);


--
-- Name: authenticateduser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('authenticateduser_id_seq', 2, true);


--
-- Data for Name: authenticateduserlookup; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO authenticateduserlookup VALUES (1, 'builtin', 'dataverseAdmin', 1);


--
-- Name: authenticateduserlookup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('authenticateduserlookup_id_seq', 2, true);


--
-- Data for Name: authenticationproviderrow; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO authenticationproviderrow VALUES ('builtin', true, 'BuiltinAuthenticationProvider', '', 'Datavers'' Internal Authentication provider', 'Dataverse Local');
INSERT INTO authenticationproviderrow VALUES ('echo-simple', true, 'Echo', ',', 'Approves everyone, based on their credentials', 'Echo provider');
INSERT INTO authenticationproviderrow VALUES ('echo-dignified', true, 'Echo', 'Sir,Esq.', 'Approves everyone, based on their credentials, and adds some flair', 'Dignified Echo provider');


--
-- Data for Name: builtinuser; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO builtinuser VALUES (1, 'Dataverse.org', 'dataverse@mailinator.com', '$2a$10$Ad3ceYkNTHFhsIcz22uKJeyW9luZJnWQToJVWf0uclrG84SXnEl2W', 'Dataverse', 'Admin', 1, 'Admin', 'dataverseAdmin');


--
-- Name: builtinuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('builtinuser_id_seq', 2, true);


--
-- Data for Name: clientharvestrun; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: clientharvestrun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('clientharvestrun_id_seq', 1, false);


--
-- Data for Name: confirmemaildata; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: confirmemaildata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('confirmemaildata_id_seq', 1, false);


--
-- Data for Name: controlledvocabalternate; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO controlledvocabalternate VALUES (1, 'arxiv', 17, 30);
INSERT INTO controlledvocabalternate VALUES (2, 'BOTSWANA', 266, 79);
INSERT INTO controlledvocabalternate VALUES (3, 'Brasil', 268, 79);
INSERT INTO controlledvocabalternate VALUES (4, 'Gambia, The', 317, 79);
INSERT INTO controlledvocabalternate VALUES (5, 'Germany (Federal Republic of)', 319, 79);
INSERT INTO controlledvocabalternate VALUES (6, 'GHANA', 320, 79);
INSERT INTO controlledvocabalternate VALUES (7, 'INDIA', 339, 79);
INSERT INTO controlledvocabalternate VALUES (8, 'Sumatra', 340, 79);
INSERT INTO controlledvocabalternate VALUES (9, 'Iran (Islamic Republic of)', 341, 79);
INSERT INTO controlledvocabalternate VALUES (10, 'Iran', 341, 79);
INSERT INTO controlledvocabalternate VALUES (11, 'IRAQ', 342, 79);
INSERT INTO controlledvocabalternate VALUES (12, 'Laos', 358, 79);
INSERT INTO controlledvocabalternate VALUES (13, 'LESOTHO', 361, 79);
INSERT INTO controlledvocabalternate VALUES (14, 'MOZAMBIQUE', 388, 79);
INSERT INTO controlledvocabalternate VALUES (15, 'NAMIBIA', 390, 79);
INSERT INTO controlledvocabalternate VALUES (16, 'SWAZILAND', 450, 79);
INSERT INTO controlledvocabalternate VALUES (17, 'Taiwan', 454, 79);
INSERT INTO controlledvocabalternate VALUES (18, 'Tanzania', 456, 79);
INSERT INTO controlledvocabalternate VALUES (19, 'UAE', 470, 79);
INSERT INTO controlledvocabalternate VALUES (20, 'U.S.A.', 472, 79);
INSERT INTO controlledvocabalternate VALUES (21, 'U.S.A', 472, 79);
INSERT INTO controlledvocabalternate VALUES (22, 'United States of America', 472, 79);
INSERT INTO controlledvocabalternate VALUES (23, 'USA', 472, 79);
INSERT INTO controlledvocabalternate VALUES (24, 'YEMEN', 483, 79);


--
-- Name: controlledvocabalternate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('controlledvocabalternate_id_seq', 24, true);


--
-- Data for Name: controlledvocabularyvalue; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO controlledvocabularyvalue VALUES (1, 0, NULL, 'N/A', NULL);
INSERT INTO controlledvocabularyvalue VALUES (2, 0, 'D01', 'Agricultural Sciences', 19);
INSERT INTO controlledvocabularyvalue VALUES (3, 1, 'D0', 'Arts and Humanities', 19);
INSERT INTO controlledvocabularyvalue VALUES (4, 2, 'D1', 'Astronomy and Astrophysics', 19);
INSERT INTO controlledvocabularyvalue VALUES (5, 3, 'D2', 'Business and Management', 19);
INSERT INTO controlledvocabularyvalue VALUES (6, 4, 'D3', 'Chemistry', 19);
INSERT INTO controlledvocabularyvalue VALUES (7, 5, 'D4', 'Earth and Environmental Sciences', 19);
INSERT INTO controlledvocabularyvalue VALUES (8, 6, 'D5', 'Engineering', 19);
INSERT INTO controlledvocabularyvalue VALUES (9, 7, 'D6', 'Medicine, Health and Life Sciences', 19);
INSERT INTO controlledvocabularyvalue VALUES (10, 8, 'D7', 'Computer and Information Science', 19);
INSERT INTO controlledvocabularyvalue VALUES (11, 9, 'D8', 'Law', 19);
INSERT INTO controlledvocabularyvalue VALUES (12, 10, 'D9', 'Mathematical Sciences', 19);
INSERT INTO controlledvocabularyvalue VALUES (13, 11, 'D10', 'Physics', 19);
INSERT INTO controlledvocabularyvalue VALUES (14, 12, 'D11', 'Social Sciences', 19);
INSERT INTO controlledvocabularyvalue VALUES (15, 13, 'D12', 'Other', 19);
INSERT INTO controlledvocabularyvalue VALUES (16, 0, '', 'ark', 30);
INSERT INTO controlledvocabularyvalue VALUES (17, 1, '', 'arXiv', 30);
INSERT INTO controlledvocabularyvalue VALUES (18, 2, '', 'bibcode', 30);
INSERT INTO controlledvocabularyvalue VALUES (19, 3, '', 'doi', 30);
INSERT INTO controlledvocabularyvalue VALUES (20, 4, '', 'ean13', 30);
INSERT INTO controlledvocabularyvalue VALUES (21, 5, '', 'eissn', 30);
INSERT INTO controlledvocabularyvalue VALUES (22, 6, '', 'handle', 30);
INSERT INTO controlledvocabularyvalue VALUES (23, 7, '', 'isbn', 30);
INSERT INTO controlledvocabularyvalue VALUES (24, 8, '', 'issn', 30);
INSERT INTO controlledvocabularyvalue VALUES (25, 9, '', 'istc', 30);
INSERT INTO controlledvocabularyvalue VALUES (26, 10, '', 'lissn', 30);
INSERT INTO controlledvocabularyvalue VALUES (27, 11, '', 'lsid', 30);
INSERT INTO controlledvocabularyvalue VALUES (28, 12, '', 'pmid', 30);
INSERT INTO controlledvocabularyvalue VALUES (29, 13, '', 'purl', 30);
INSERT INTO controlledvocabularyvalue VALUES (30, 14, '', 'upc', 30);
INSERT INTO controlledvocabularyvalue VALUES (31, 15, '', 'url', 30);
INSERT INTO controlledvocabularyvalue VALUES (32, 16, '', 'urn', 30);
INSERT INTO controlledvocabularyvalue VALUES (33, 0, '', 'Data Collector', 44);
INSERT INTO controlledvocabularyvalue VALUES (34, 1, '', 'Data Curator', 44);
INSERT INTO controlledvocabularyvalue VALUES (35, 2, '', 'Data Manager', 44);
INSERT INTO controlledvocabularyvalue VALUES (36, 3, '', 'Editor', 44);
INSERT INTO controlledvocabularyvalue VALUES (37, 4, '', 'Funder', 44);
INSERT INTO controlledvocabularyvalue VALUES (38, 5, '', 'Hosting Institution', 44);
INSERT INTO controlledvocabularyvalue VALUES (39, 6, '', 'Project Leader', 44);
INSERT INTO controlledvocabularyvalue VALUES (40, 7, '', 'Project Manager', 44);
INSERT INTO controlledvocabularyvalue VALUES (41, 8, '', 'Project Member', 44);
INSERT INTO controlledvocabularyvalue VALUES (42, 9, '', 'Related Person', 44);
INSERT INTO controlledvocabularyvalue VALUES (43, 10, '', 'Researcher', 44);
INSERT INTO controlledvocabularyvalue VALUES (44, 11, '', 'Research Group', 44);
INSERT INTO controlledvocabularyvalue VALUES (45, 12, '', 'Rights Holder', 44);
INSERT INTO controlledvocabularyvalue VALUES (46, 13, '', 'Sponsor', 44);
INSERT INTO controlledvocabularyvalue VALUES (47, 14, '', 'Supervisor', 44);
INSERT INTO controlledvocabularyvalue VALUES (48, 15, '', 'Work Package Leader', 44);
INSERT INTO controlledvocabularyvalue VALUES (49, 16, '', 'Other', 44);
INSERT INTO controlledvocabularyvalue VALUES (50, 0, '', 'ORCID', 10);
INSERT INTO controlledvocabularyvalue VALUES (51, 1, '', 'ISNI', 10);
INSERT INTO controlledvocabularyvalue VALUES (52, 2, '', 'LCNA', 10);
INSERT INTO controlledvocabularyvalue VALUES (53, 0, '', 'Abkhaz', 34);
INSERT INTO controlledvocabularyvalue VALUES (54, 1, '', 'Afar', 34);
INSERT INTO controlledvocabularyvalue VALUES (55, 2, '', 'Afrikaans', 34);
INSERT INTO controlledvocabularyvalue VALUES (56, 3, '', 'Akan', 34);
INSERT INTO controlledvocabularyvalue VALUES (57, 4, '', 'Albanian', 34);
INSERT INTO controlledvocabularyvalue VALUES (58, 5, '', 'Amharic', 34);
INSERT INTO controlledvocabularyvalue VALUES (59, 6, '', 'Arabic', 34);
INSERT INTO controlledvocabularyvalue VALUES (60, 7, '', 'Aragonese', 34);
INSERT INTO controlledvocabularyvalue VALUES (61, 8, '', 'Armenian', 34);
INSERT INTO controlledvocabularyvalue VALUES (62, 9, '', 'Assamese', 34);
INSERT INTO controlledvocabularyvalue VALUES (63, 10, '', 'Avaric', 34);
INSERT INTO controlledvocabularyvalue VALUES (64, 11, '', 'Avestan', 34);
INSERT INTO controlledvocabularyvalue VALUES (65, 12, '', 'Aymara', 34);
INSERT INTO controlledvocabularyvalue VALUES (66, 13, '', 'Azerbaijani', 34);
INSERT INTO controlledvocabularyvalue VALUES (67, 14, '', 'Bambara', 34);
INSERT INTO controlledvocabularyvalue VALUES (68, 15, '', 'Bashkir', 34);
INSERT INTO controlledvocabularyvalue VALUES (69, 16, '', 'Basque', 34);
INSERT INTO controlledvocabularyvalue VALUES (70, 17, '', 'Belarusian', 34);
INSERT INTO controlledvocabularyvalue VALUES (71, 18, '', 'Bengali, Bangla', 34);
INSERT INTO controlledvocabularyvalue VALUES (72, 19, '', 'Bihari', 34);
INSERT INTO controlledvocabularyvalue VALUES (73, 20, '', 'Bislama', 34);
INSERT INTO controlledvocabularyvalue VALUES (74, 21, '', 'Bosnian', 34);
INSERT INTO controlledvocabularyvalue VALUES (75, 22, '', 'Breton', 34);
INSERT INTO controlledvocabularyvalue VALUES (76, 23, '', 'Bulgarian', 34);
INSERT INTO controlledvocabularyvalue VALUES (77, 24, '', 'Burmese', 34);
INSERT INTO controlledvocabularyvalue VALUES (78, 25, '', 'Catalan,Valencian', 34);
INSERT INTO controlledvocabularyvalue VALUES (79, 26, '', 'Chamorro', 34);
INSERT INTO controlledvocabularyvalue VALUES (80, 27, '', 'Chechen', 34);
INSERT INTO controlledvocabularyvalue VALUES (81, 28, '', 'Chichewa, Chewa, Nyanja', 34);
INSERT INTO controlledvocabularyvalue VALUES (82, 29, '', 'Chinese', 34);
INSERT INTO controlledvocabularyvalue VALUES (83, 30, '', 'Chuvash', 34);
INSERT INTO controlledvocabularyvalue VALUES (84, 31, '', 'Cornish', 34);
INSERT INTO controlledvocabularyvalue VALUES (85, 32, '', 'Corsican', 34);
INSERT INTO controlledvocabularyvalue VALUES (86, 33, '', 'Cree', 34);
INSERT INTO controlledvocabularyvalue VALUES (87, 34, '', 'Croatian', 34);
INSERT INTO controlledvocabularyvalue VALUES (88, 35, '', 'Czech', 34);
INSERT INTO controlledvocabularyvalue VALUES (89, 36, '', 'Danish', 34);
INSERT INTO controlledvocabularyvalue VALUES (90, 37, '', 'Divehi, Dhivehi, Maldivian', 34);
INSERT INTO controlledvocabularyvalue VALUES (91, 38, '', 'Dutch', 34);
INSERT INTO controlledvocabularyvalue VALUES (92, 39, '', 'Dzongkha', 34);
INSERT INTO controlledvocabularyvalue VALUES (93, 40, '', 'English', 34);
INSERT INTO controlledvocabularyvalue VALUES (94, 41, '', 'Esperanto', 34);
INSERT INTO controlledvocabularyvalue VALUES (95, 42, '', 'Estonian', 34);
INSERT INTO controlledvocabularyvalue VALUES (96, 43, '', 'Ewe', 34);
INSERT INTO controlledvocabularyvalue VALUES (97, 44, '', 'Faroese', 34);
INSERT INTO controlledvocabularyvalue VALUES (98, 45, '', 'Fijian', 34);
INSERT INTO controlledvocabularyvalue VALUES (99, 46, '', 'Finnish', 34);
INSERT INTO controlledvocabularyvalue VALUES (100, 47, '', 'French', 34);
INSERT INTO controlledvocabularyvalue VALUES (101, 48, '', 'Fula, Fulah, Pulaar, Pular', 34);
INSERT INTO controlledvocabularyvalue VALUES (102, 49, '', 'Galician', 34);
INSERT INTO controlledvocabularyvalue VALUES (103, 50, '', 'Georgian', 34);
INSERT INTO controlledvocabularyvalue VALUES (104, 51, '', 'German', 34);
INSERT INTO controlledvocabularyvalue VALUES (105, 52, '', 'Greek (modern)', 34);
INSERT INTO controlledvocabularyvalue VALUES (106, 53, '', 'Guaraní', 34);
INSERT INTO controlledvocabularyvalue VALUES (107, 54, '', 'Gujarati', 34);
INSERT INTO controlledvocabularyvalue VALUES (108, 55, '', 'Haitian, Haitian Creole', 34);
INSERT INTO controlledvocabularyvalue VALUES (109, 56, '', 'Hausa', 34);
INSERT INTO controlledvocabularyvalue VALUES (110, 57, '', 'Hebrew (modern)', 34);
INSERT INTO controlledvocabularyvalue VALUES (111, 58, '', 'Herero', 34);
INSERT INTO controlledvocabularyvalue VALUES (112, 59, '', 'Hindi', 34);
INSERT INTO controlledvocabularyvalue VALUES (113, 60, '', 'Hiri Motu', 34);
INSERT INTO controlledvocabularyvalue VALUES (114, 61, '', 'Hungarian', 34);
INSERT INTO controlledvocabularyvalue VALUES (115, 62, '', 'Interlingua', 34);
INSERT INTO controlledvocabularyvalue VALUES (116, 63, '', 'Indonesian', 34);
INSERT INTO controlledvocabularyvalue VALUES (117, 64, '', 'Interlingue', 34);
INSERT INTO controlledvocabularyvalue VALUES (118, 65, '', 'Irish', 34);
INSERT INTO controlledvocabularyvalue VALUES (119, 66, '', 'Igbo', 34);
INSERT INTO controlledvocabularyvalue VALUES (120, 67, '', 'Inupiaq', 34);
INSERT INTO controlledvocabularyvalue VALUES (121, 68, '', 'Ido', 34);
INSERT INTO controlledvocabularyvalue VALUES (122, 69, '', 'Icelandic', 34);
INSERT INTO controlledvocabularyvalue VALUES (123, 70, '', 'Italian', 34);
INSERT INTO controlledvocabularyvalue VALUES (124, 71, '', 'Inuktitut', 34);
INSERT INTO controlledvocabularyvalue VALUES (125, 72, '', 'Japanese', 34);
INSERT INTO controlledvocabularyvalue VALUES (126, 73, '', 'Javanese', 34);
INSERT INTO controlledvocabularyvalue VALUES (127, 74, '', 'Kalaallisut, Greenlandic', 34);
INSERT INTO controlledvocabularyvalue VALUES (128, 75, '', 'Kannada', 34);
INSERT INTO controlledvocabularyvalue VALUES (129, 76, '', 'Kanuri', 34);
INSERT INTO controlledvocabularyvalue VALUES (130, 77, '', 'Kashmiri', 34);
INSERT INTO controlledvocabularyvalue VALUES (131, 78, '', 'Kazakh', 34);
INSERT INTO controlledvocabularyvalue VALUES (132, 79, '', 'Khmer', 34);
INSERT INTO controlledvocabularyvalue VALUES (133, 80, '', 'Kikuyu, Gikuyu', 34);
INSERT INTO controlledvocabularyvalue VALUES (134, 81, '', 'Kinyarwanda', 34);
INSERT INTO controlledvocabularyvalue VALUES (135, 82, '', 'Kyrgyz', 34);
INSERT INTO controlledvocabularyvalue VALUES (136, 83, '', 'Komi', 34);
INSERT INTO controlledvocabularyvalue VALUES (137, 84, '', 'Kongo', 34);
INSERT INTO controlledvocabularyvalue VALUES (138, 85, '', 'Korean', 34);
INSERT INTO controlledvocabularyvalue VALUES (139, 86, '', 'Kurdish', 34);
INSERT INTO controlledvocabularyvalue VALUES (140, 87, '', 'Kwanyama, Kuanyama', 34);
INSERT INTO controlledvocabularyvalue VALUES (141, 88, '', 'Latin', 34);
INSERT INTO controlledvocabularyvalue VALUES (142, 89, '', 'Luxembourgish, Letzeburgesch', 34);
INSERT INTO controlledvocabularyvalue VALUES (143, 90, '', 'Ganda', 34);
INSERT INTO controlledvocabularyvalue VALUES (144, 91, '', 'Limburgish, Limburgan, Limburger', 34);
INSERT INTO controlledvocabularyvalue VALUES (145, 92, '', 'Lingala', 34);
INSERT INTO controlledvocabularyvalue VALUES (146, 93, '', 'Lao', 34);
INSERT INTO controlledvocabularyvalue VALUES (147, 94, '', 'Lithuanian', 34);
INSERT INTO controlledvocabularyvalue VALUES (148, 95, '', 'Luba-Katanga', 34);
INSERT INTO controlledvocabularyvalue VALUES (149, 96, '', 'Latvian', 34);
INSERT INTO controlledvocabularyvalue VALUES (150, 97, '', 'Manx', 34);
INSERT INTO controlledvocabularyvalue VALUES (151, 98, '', 'Macedonian', 34);
INSERT INTO controlledvocabularyvalue VALUES (152, 99, '', 'Malagasy', 34);
INSERT INTO controlledvocabularyvalue VALUES (153, 100, '', 'Malay', 34);
INSERT INTO controlledvocabularyvalue VALUES (154, 101, '', 'Malayalam', 34);
INSERT INTO controlledvocabularyvalue VALUES (155, 102, '', 'Maltese', 34);
INSERT INTO controlledvocabularyvalue VALUES (156, 103, '', 'Māori', 34);
INSERT INTO controlledvocabularyvalue VALUES (157, 104, '', 'Marathi (Marāṭhī)', 34);
INSERT INTO controlledvocabularyvalue VALUES (158, 105, '', 'Marshallese', 34);
INSERT INTO controlledvocabularyvalue VALUES (159, 106, '', 'Mongolian', 34);
INSERT INTO controlledvocabularyvalue VALUES (160, 107, '', 'Nauru', 34);
INSERT INTO controlledvocabularyvalue VALUES (161, 108, '', 'Navajo, Navaho', 34);
INSERT INTO controlledvocabularyvalue VALUES (162, 109, '', 'Northern Ndebele', 34);
INSERT INTO controlledvocabularyvalue VALUES (163, 110, '', 'Nepali', 34);
INSERT INTO controlledvocabularyvalue VALUES (164, 111, '', 'Ndonga', 34);
INSERT INTO controlledvocabularyvalue VALUES (165, 112, '', 'Norwegian Bokmål', 34);
INSERT INTO controlledvocabularyvalue VALUES (166, 113, '', 'Norwegian Nynorsk', 34);
INSERT INTO controlledvocabularyvalue VALUES (167, 114, '', 'Norwegian', 34);
INSERT INTO controlledvocabularyvalue VALUES (168, 115, '', 'Nuosu', 34);
INSERT INTO controlledvocabularyvalue VALUES (169, 116, '', 'Southern Ndebele', 34);
INSERT INTO controlledvocabularyvalue VALUES (170, 117, '', 'Occitan', 34);
INSERT INTO controlledvocabularyvalue VALUES (171, 118, '', 'Ojibwe, Ojibwa', 34);
INSERT INTO controlledvocabularyvalue VALUES (172, 119, '', 'Old Church Slavonic,Church Slavonic,Old Bulgarian', 34);
INSERT INTO controlledvocabularyvalue VALUES (173, 120, '', 'Oromo', 34);
INSERT INTO controlledvocabularyvalue VALUES (174, 121, '', 'Oriya', 34);
INSERT INTO controlledvocabularyvalue VALUES (175, 122, '', 'Ossetian, Ossetic', 34);
INSERT INTO controlledvocabularyvalue VALUES (176, 123, '', 'Panjabi, Punjabi', 34);
INSERT INTO controlledvocabularyvalue VALUES (177, 124, '', 'Pāli', 34);
INSERT INTO controlledvocabularyvalue VALUES (178, 125, '', 'Persian (Farsi)', 34);
INSERT INTO controlledvocabularyvalue VALUES (179, 126, '', 'Polish', 34);
INSERT INTO controlledvocabularyvalue VALUES (180, 127, '', 'Pashto, Pushto', 34);
INSERT INTO controlledvocabularyvalue VALUES (181, 128, '', 'Portuguese', 34);
INSERT INTO controlledvocabularyvalue VALUES (182, 129, '', 'Quechua', 34);
INSERT INTO controlledvocabularyvalue VALUES (183, 130, '', 'Romansh', 34);
INSERT INTO controlledvocabularyvalue VALUES (184, 131, '', 'Kirundi', 34);
INSERT INTO controlledvocabularyvalue VALUES (185, 132, '', 'Romanian', 34);
INSERT INTO controlledvocabularyvalue VALUES (186, 133, '', 'Russian', 34);
INSERT INTO controlledvocabularyvalue VALUES (187, 134, '', 'Sanskrit (Saṁskṛta)', 34);
INSERT INTO controlledvocabularyvalue VALUES (188, 135, '', 'Sardinian', 34);
INSERT INTO controlledvocabularyvalue VALUES (189, 136, '', 'Sindhi', 34);
INSERT INTO controlledvocabularyvalue VALUES (190, 137, '', 'Northern Sami', 34);
INSERT INTO controlledvocabularyvalue VALUES (191, 138, '', 'Samoan', 34);
INSERT INTO controlledvocabularyvalue VALUES (192, 139, '', 'Sango', 34);
INSERT INTO controlledvocabularyvalue VALUES (193, 140, '', 'Serbian', 34);
INSERT INTO controlledvocabularyvalue VALUES (194, 141, '', 'Scottish Gaelic, Gaelic', 34);
INSERT INTO controlledvocabularyvalue VALUES (195, 142, '', 'Shona', 34);
INSERT INTO controlledvocabularyvalue VALUES (196, 143, '', 'Sinhala, Sinhalese', 34);
INSERT INTO controlledvocabularyvalue VALUES (197, 144, '', 'Slovak', 34);
INSERT INTO controlledvocabularyvalue VALUES (198, 145, '', 'Slovene', 34);
INSERT INTO controlledvocabularyvalue VALUES (199, 146, '', 'Somali', 34);
INSERT INTO controlledvocabularyvalue VALUES (200, 147, '', 'Southern Sotho', 34);
INSERT INTO controlledvocabularyvalue VALUES (201, 148, '', 'Spanish, Castilian', 34);
INSERT INTO controlledvocabularyvalue VALUES (202, 149, '', 'Sundanese', 34);
INSERT INTO controlledvocabularyvalue VALUES (203, 150, '', 'Swahili', 34);
INSERT INTO controlledvocabularyvalue VALUES (204, 151, '', 'Swati', 34);
INSERT INTO controlledvocabularyvalue VALUES (205, 152, '', 'Swedish', 34);
INSERT INTO controlledvocabularyvalue VALUES (206, 153, '', 'Tamil', 34);
INSERT INTO controlledvocabularyvalue VALUES (207, 154, '', 'Telugu', 34);
INSERT INTO controlledvocabularyvalue VALUES (208, 155, '', 'Tajik', 34);
INSERT INTO controlledvocabularyvalue VALUES (209, 156, '', 'Thai', 34);
INSERT INTO controlledvocabularyvalue VALUES (210, 157, '', 'Tigrinya', 34);
INSERT INTO controlledvocabularyvalue VALUES (211, 158, '', 'Tibetan Standard, Tibetan, Central', 34);
INSERT INTO controlledvocabularyvalue VALUES (212, 159, '', 'Turkmen', 34);
INSERT INTO controlledvocabularyvalue VALUES (213, 160, '', 'Tagalog', 34);
INSERT INTO controlledvocabularyvalue VALUES (214, 161, '', 'Tswana', 34);
INSERT INTO controlledvocabularyvalue VALUES (215, 162, '', 'Tonga (Tonga Islands)', 34);
INSERT INTO controlledvocabularyvalue VALUES (216, 163, '', 'Turkish', 34);
INSERT INTO controlledvocabularyvalue VALUES (217, 164, '', 'Tsonga', 34);
INSERT INTO controlledvocabularyvalue VALUES (218, 165, '', 'Tatar', 34);
INSERT INTO controlledvocabularyvalue VALUES (219, 166, '', 'Twi', 34);
INSERT INTO controlledvocabularyvalue VALUES (220, 167, '', 'Tahitian', 34);
INSERT INTO controlledvocabularyvalue VALUES (221, 168, '', 'Uyghur, Uighur', 34);
INSERT INTO controlledvocabularyvalue VALUES (222, 169, '', 'Ukrainian', 34);
INSERT INTO controlledvocabularyvalue VALUES (223, 170, '', 'Urdu', 34);
INSERT INTO controlledvocabularyvalue VALUES (224, 171, '', 'Uzbek', 34);
INSERT INTO controlledvocabularyvalue VALUES (225, 172, '', 'Venda', 34);
INSERT INTO controlledvocabularyvalue VALUES (226, 173, '', 'Vietnamese', 34);
INSERT INTO controlledvocabularyvalue VALUES (227, 174, '', 'Volapük', 34);
INSERT INTO controlledvocabularyvalue VALUES (228, 175, '', 'Walloon', 34);
INSERT INTO controlledvocabularyvalue VALUES (229, 176, '', 'Welsh', 34);
INSERT INTO controlledvocabularyvalue VALUES (230, 177, '', 'Wolof', 34);
INSERT INTO controlledvocabularyvalue VALUES (231, 178, '', 'Western Frisian', 34);
INSERT INTO controlledvocabularyvalue VALUES (232, 179, '', 'Xhosa', 34);
INSERT INTO controlledvocabularyvalue VALUES (233, 180, '', 'Yiddish', 34);
INSERT INTO controlledvocabularyvalue VALUES (234, 181, '', 'Yoruba', 34);
INSERT INTO controlledvocabularyvalue VALUES (235, 182, '', 'Zhuang, Chuang', 34);
INSERT INTO controlledvocabularyvalue VALUES (236, 183, '', 'Zulu', 34);
INSERT INTO controlledvocabularyvalue VALUES (237, 184, '', 'Not applicable', 34);
INSERT INTO controlledvocabularyvalue VALUES (238, 0, '', 'Afghanistan', 79);
INSERT INTO controlledvocabularyvalue VALUES (239, 1, '', 'Albania', 79);
INSERT INTO controlledvocabularyvalue VALUES (240, 2, '', 'Algeria', 79);
INSERT INTO controlledvocabularyvalue VALUES (241, 3, '', 'American Samoa', 79);
INSERT INTO controlledvocabularyvalue VALUES (242, 4, '', 'Andorra', 79);
INSERT INTO controlledvocabularyvalue VALUES (243, 5, '', 'Angola', 79);
INSERT INTO controlledvocabularyvalue VALUES (244, 6, '', 'Anguilla', 79);
INSERT INTO controlledvocabularyvalue VALUES (245, 7, '', 'Antarctica', 79);
INSERT INTO controlledvocabularyvalue VALUES (246, 8, '', 'Antigua and Barbuda', 79);
INSERT INTO controlledvocabularyvalue VALUES (247, 9, '', 'Argentina', 79);
INSERT INTO controlledvocabularyvalue VALUES (248, 10, '', 'Armenia', 79);
INSERT INTO controlledvocabularyvalue VALUES (249, 11, '', 'Aruba', 79);
INSERT INTO controlledvocabularyvalue VALUES (250, 12, '', 'Australia', 79);
INSERT INTO controlledvocabularyvalue VALUES (251, 13, '', 'Austria', 79);
INSERT INTO controlledvocabularyvalue VALUES (252, 14, '', 'Azerbaijan', 79);
INSERT INTO controlledvocabularyvalue VALUES (253, 15, '', 'Bahamas', 79);
INSERT INTO controlledvocabularyvalue VALUES (254, 16, '', 'Bahrain', 79);
INSERT INTO controlledvocabularyvalue VALUES (255, 17, '', 'Bangladesh', 79);
INSERT INTO controlledvocabularyvalue VALUES (256, 18, '', 'Barbados', 79);
INSERT INTO controlledvocabularyvalue VALUES (257, 19, '', 'Belarus', 79);
INSERT INTO controlledvocabularyvalue VALUES (258, 20, '', 'Belgium', 79);
INSERT INTO controlledvocabularyvalue VALUES (259, 21, '', 'Belize', 79);
INSERT INTO controlledvocabularyvalue VALUES (260, 22, '', 'Benin', 79);
INSERT INTO controlledvocabularyvalue VALUES (261, 23, '', 'Bermuda', 79);
INSERT INTO controlledvocabularyvalue VALUES (262, 24, '', 'Bhutan', 79);
INSERT INTO controlledvocabularyvalue VALUES (263, 25, '', 'Bolivia, Plurinational State of', 79);
INSERT INTO controlledvocabularyvalue VALUES (264, 26, '', 'Bonaire, Sint Eustatius and Saba', 79);
INSERT INTO controlledvocabularyvalue VALUES (265, 27, '', 'Bosnia and Herzegovina', 79);
INSERT INTO controlledvocabularyvalue VALUES (266, 28, '', 'Botswana', 79);
INSERT INTO controlledvocabularyvalue VALUES (267, 29, '', 'Bouvet Island', 79);
INSERT INTO controlledvocabularyvalue VALUES (268, 30, '', 'Brazil', 79);
INSERT INTO controlledvocabularyvalue VALUES (269, 31, '', 'British Indian Ocean Territory', 79);
INSERT INTO controlledvocabularyvalue VALUES (270, 32, '', 'Brunei Darussalam', 79);
INSERT INTO controlledvocabularyvalue VALUES (271, 33, '', 'Bulgaria', 79);
INSERT INTO controlledvocabularyvalue VALUES (272, 34, '', 'Burkina Faso', 79);
INSERT INTO controlledvocabularyvalue VALUES (273, 35, '', 'Burundi', 79);
INSERT INTO controlledvocabularyvalue VALUES (274, 36, '', 'Cambodia', 79);
INSERT INTO controlledvocabularyvalue VALUES (275, 37, '', 'Cameroon', 79);
INSERT INTO controlledvocabularyvalue VALUES (276, 38, '', 'Canada', 79);
INSERT INTO controlledvocabularyvalue VALUES (277, 39, '', 'Cape Verde', 79);
INSERT INTO controlledvocabularyvalue VALUES (278, 40, '', 'Cayman Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (279, 41, '', 'Central African Republic', 79);
INSERT INTO controlledvocabularyvalue VALUES (280, 42, '', 'Chad', 79);
INSERT INTO controlledvocabularyvalue VALUES (281, 43, '', 'Chile', 79);
INSERT INTO controlledvocabularyvalue VALUES (282, 44, '', 'China', 79);
INSERT INTO controlledvocabularyvalue VALUES (283, 45, '', 'Christmas Island', 79);
INSERT INTO controlledvocabularyvalue VALUES (284, 46, '', 'Cocos (Keeling) Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (285, 47, '', 'Colombia', 79);
INSERT INTO controlledvocabularyvalue VALUES (286, 48, '', 'Comoros', 79);
INSERT INTO controlledvocabularyvalue VALUES (287, 49, '', 'Congo', 79);
INSERT INTO controlledvocabularyvalue VALUES (288, 50, '', 'Congo, the Democratic Republic of the', 79);
INSERT INTO controlledvocabularyvalue VALUES (289, 51, '', 'Cook Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (290, 52, '', 'Costa Rica', 79);
INSERT INTO controlledvocabularyvalue VALUES (291, 53, '', 'Croatia', 79);
INSERT INTO controlledvocabularyvalue VALUES (292, 54, '', 'Cuba', 79);
INSERT INTO controlledvocabularyvalue VALUES (293, 55, '', 'Curaçao', 79);
INSERT INTO controlledvocabularyvalue VALUES (294, 56, '', 'Cyprus', 79);
INSERT INTO controlledvocabularyvalue VALUES (295, 57, '', 'Czech Republic', 79);
INSERT INTO controlledvocabularyvalue VALUES (296, 58, '', 'Côte d''Ivoire', 79);
INSERT INTO controlledvocabularyvalue VALUES (297, 59, '', 'Denmark', 79);
INSERT INTO controlledvocabularyvalue VALUES (298, 60, '', 'Djibouti', 79);
INSERT INTO controlledvocabularyvalue VALUES (299, 61, '', 'Dominica', 79);
INSERT INTO controlledvocabularyvalue VALUES (300, 62, '', 'Dominican Republic', 79);
INSERT INTO controlledvocabularyvalue VALUES (301, 63, '', 'Ecuador', 79);
INSERT INTO controlledvocabularyvalue VALUES (302, 64, '', 'Egypt', 79);
INSERT INTO controlledvocabularyvalue VALUES (303, 65, '', 'El Salvador', 79);
INSERT INTO controlledvocabularyvalue VALUES (304, 66, '', 'Equatorial Guinea', 79);
INSERT INTO controlledvocabularyvalue VALUES (305, 67, '', 'Eritrea', 79);
INSERT INTO controlledvocabularyvalue VALUES (306, 68, '', 'Estonia', 79);
INSERT INTO controlledvocabularyvalue VALUES (307, 69, '', 'Ethiopia', 79);
INSERT INTO controlledvocabularyvalue VALUES (308, 70, '', 'Falkland Islands (Malvinas)', 79);
INSERT INTO controlledvocabularyvalue VALUES (309, 71, '', 'Faroe Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (310, 72, '', 'Fiji', 79);
INSERT INTO controlledvocabularyvalue VALUES (311, 73, '', 'Finland', 79);
INSERT INTO controlledvocabularyvalue VALUES (312, 74, '', 'France', 79);
INSERT INTO controlledvocabularyvalue VALUES (313, 75, '', 'French Guiana', 79);
INSERT INTO controlledvocabularyvalue VALUES (314, 76, '', 'French Polynesia', 79);
INSERT INTO controlledvocabularyvalue VALUES (315, 77, '', 'French Southern Territories', 79);
INSERT INTO controlledvocabularyvalue VALUES (316, 78, '', 'Gabon', 79);
INSERT INTO controlledvocabularyvalue VALUES (317, 79, '', 'Gambia', 79);
INSERT INTO controlledvocabularyvalue VALUES (318, 80, '', 'Georgia', 79);
INSERT INTO controlledvocabularyvalue VALUES (319, 81, '', 'Germany', 79);
INSERT INTO controlledvocabularyvalue VALUES (320, 82, '', 'Ghana', 79);
INSERT INTO controlledvocabularyvalue VALUES (321, 83, '', 'Gibraltar', 79);
INSERT INTO controlledvocabularyvalue VALUES (322, 84, '', 'Greece', 79);
INSERT INTO controlledvocabularyvalue VALUES (323, 85, '', 'Greenland', 79);
INSERT INTO controlledvocabularyvalue VALUES (324, 86, '', 'Grenada', 79);
INSERT INTO controlledvocabularyvalue VALUES (325, 87, '', 'Guadeloupe', 79);
INSERT INTO controlledvocabularyvalue VALUES (326, 88, '', 'Guam', 79);
INSERT INTO controlledvocabularyvalue VALUES (327, 89, '', 'Guatemala', 79);
INSERT INTO controlledvocabularyvalue VALUES (328, 90, '', 'Guernsey', 79);
INSERT INTO controlledvocabularyvalue VALUES (329, 91, '', 'Guinea', 79);
INSERT INTO controlledvocabularyvalue VALUES (330, 92, '', 'Guinea-Bissau', 79);
INSERT INTO controlledvocabularyvalue VALUES (331, 93, '', 'Guyana', 79);
INSERT INTO controlledvocabularyvalue VALUES (332, 94, '', 'Haiti', 79);
INSERT INTO controlledvocabularyvalue VALUES (333, 95, '', 'Heard Island and Mcdonald Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (334, 96, '', 'Holy See (Vatican City State)', 79);
INSERT INTO controlledvocabularyvalue VALUES (335, 97, '', 'Honduras', 79);
INSERT INTO controlledvocabularyvalue VALUES (336, 98, '', 'Hong Kong', 79);
INSERT INTO controlledvocabularyvalue VALUES (337, 99, '', 'Hungary', 79);
INSERT INTO controlledvocabularyvalue VALUES (338, 100, '', 'Iceland', 79);
INSERT INTO controlledvocabularyvalue VALUES (339, 101, '', 'India', 79);
INSERT INTO controlledvocabularyvalue VALUES (340, 102, '', 'Indonesia', 79);
INSERT INTO controlledvocabularyvalue VALUES (341, 103, '', 'Iran, Islamic Republic of', 79);
INSERT INTO controlledvocabularyvalue VALUES (342, 104, '', 'Iraq', 79);
INSERT INTO controlledvocabularyvalue VALUES (343, 105, '', 'Ireland', 79);
INSERT INTO controlledvocabularyvalue VALUES (344, 106, '', 'Isle of Man', 79);
INSERT INTO controlledvocabularyvalue VALUES (345, 107, '', 'Israel', 79);
INSERT INTO controlledvocabularyvalue VALUES (346, 108, '', 'Italy', 79);
INSERT INTO controlledvocabularyvalue VALUES (347, 109, '', 'Jamaica', 79);
INSERT INTO controlledvocabularyvalue VALUES (348, 110, '', 'Japan', 79);
INSERT INTO controlledvocabularyvalue VALUES (349, 111, '', 'Jersey', 79);
INSERT INTO controlledvocabularyvalue VALUES (350, 112, '', 'Jordan', 79);
INSERT INTO controlledvocabularyvalue VALUES (351, 113, '', 'Kazakhstan', 79);
INSERT INTO controlledvocabularyvalue VALUES (352, 114, '', 'Kenya', 79);
INSERT INTO controlledvocabularyvalue VALUES (353, 115, '', 'Kiribati', 79);
INSERT INTO controlledvocabularyvalue VALUES (354, 116, '', 'Korea, Democratic People''s Republic of', 79);
INSERT INTO controlledvocabularyvalue VALUES (355, 117, '', 'Korea, Republic of', 79);
INSERT INTO controlledvocabularyvalue VALUES (356, 118, '', 'Kuwait', 79);
INSERT INTO controlledvocabularyvalue VALUES (357, 119, '', 'Kyrgyzstan', 79);
INSERT INTO controlledvocabularyvalue VALUES (358, 120, '', 'Lao People''s Democratic Republic', 79);
INSERT INTO controlledvocabularyvalue VALUES (359, 121, '', 'Latvia', 79);
INSERT INTO controlledvocabularyvalue VALUES (360, 122, '', 'Lebanon', 79);
INSERT INTO controlledvocabularyvalue VALUES (361, 123, '', 'Lesotho', 79);
INSERT INTO controlledvocabularyvalue VALUES (362, 124, '', 'Liberia', 79);
INSERT INTO controlledvocabularyvalue VALUES (363, 125, '', 'Libya', 79);
INSERT INTO controlledvocabularyvalue VALUES (364, 126, '', 'Liechtenstein', 79);
INSERT INTO controlledvocabularyvalue VALUES (365, 127, '', 'Lithuania', 79);
INSERT INTO controlledvocabularyvalue VALUES (366, 128, '', 'Luxembourg', 79);
INSERT INTO controlledvocabularyvalue VALUES (367, 129, '', 'Macao', 79);
INSERT INTO controlledvocabularyvalue VALUES (368, 130, '', 'Macedonia, the Former Yugoslav Republic of', 79);
INSERT INTO controlledvocabularyvalue VALUES (369, 131, '', 'Madagascar', 79);
INSERT INTO controlledvocabularyvalue VALUES (370, 132, '', 'Malawi', 79);
INSERT INTO controlledvocabularyvalue VALUES (371, 133, '', 'Malaysia', 79);
INSERT INTO controlledvocabularyvalue VALUES (372, 134, '', 'Maldives', 79);
INSERT INTO controlledvocabularyvalue VALUES (373, 135, '', 'Mali', 79);
INSERT INTO controlledvocabularyvalue VALUES (374, 136, '', 'Malta', 79);
INSERT INTO controlledvocabularyvalue VALUES (375, 137, '', 'Marshall Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (376, 138, '', 'Martinique', 79);
INSERT INTO controlledvocabularyvalue VALUES (377, 139, '', 'Mauritania', 79);
INSERT INTO controlledvocabularyvalue VALUES (378, 140, '', 'Mauritius', 79);
INSERT INTO controlledvocabularyvalue VALUES (379, 141, '', 'Mayotte', 79);
INSERT INTO controlledvocabularyvalue VALUES (380, 142, '', 'Mexico', 79);
INSERT INTO controlledvocabularyvalue VALUES (381, 143, '', 'Micronesia, Federated States of', 79);
INSERT INTO controlledvocabularyvalue VALUES (382, 144, '', 'Moldova, Republic of', 79);
INSERT INTO controlledvocabularyvalue VALUES (383, 145, '', 'Monaco', 79);
INSERT INTO controlledvocabularyvalue VALUES (384, 146, '', 'Mongolia', 79);
INSERT INTO controlledvocabularyvalue VALUES (385, 147, '', 'Montenegro', 79);
INSERT INTO controlledvocabularyvalue VALUES (386, 148, '', 'Montserrat', 79);
INSERT INTO controlledvocabularyvalue VALUES (387, 149, '', 'Morocco', 79);
INSERT INTO controlledvocabularyvalue VALUES (388, 150, '', 'Mozambique', 79);
INSERT INTO controlledvocabularyvalue VALUES (389, 151, '', 'Myanmar', 79);
INSERT INTO controlledvocabularyvalue VALUES (390, 152, '', 'Namibia', 79);
INSERT INTO controlledvocabularyvalue VALUES (391, 153, '', 'Nauru', 79);
INSERT INTO controlledvocabularyvalue VALUES (392, 154, '', 'Nepal', 79);
INSERT INTO controlledvocabularyvalue VALUES (393, 155, '', 'Netherlands', 79);
INSERT INTO controlledvocabularyvalue VALUES (394, 156, '', 'New Caledonia', 79);
INSERT INTO controlledvocabularyvalue VALUES (395, 157, '', 'New Zealand', 79);
INSERT INTO controlledvocabularyvalue VALUES (396, 158, '', 'Nicaragua', 79);
INSERT INTO controlledvocabularyvalue VALUES (397, 159, '', 'Niger', 79);
INSERT INTO controlledvocabularyvalue VALUES (398, 160, '', 'Nigeria', 79);
INSERT INTO controlledvocabularyvalue VALUES (399, 161, '', 'Niue', 79);
INSERT INTO controlledvocabularyvalue VALUES (400, 162, '', 'Norfolk Island', 79);
INSERT INTO controlledvocabularyvalue VALUES (401, 163, '', 'Northern Mariana Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (402, 164, '', 'Norway', 79);
INSERT INTO controlledvocabularyvalue VALUES (403, 165, '', 'Oman', 79);
INSERT INTO controlledvocabularyvalue VALUES (404, 166, '', 'Pakistan', 79);
INSERT INTO controlledvocabularyvalue VALUES (405, 167, '', 'Palau', 79);
INSERT INTO controlledvocabularyvalue VALUES (406, 168, '', 'Palestine, State of', 79);
INSERT INTO controlledvocabularyvalue VALUES (407, 169, '', 'Panama', 79);
INSERT INTO controlledvocabularyvalue VALUES (408, 170, '', 'Papua New Guinea', 79);
INSERT INTO controlledvocabularyvalue VALUES (409, 171, '', 'Paraguay', 79);
INSERT INTO controlledvocabularyvalue VALUES (410, 172, '', 'Peru', 79);
INSERT INTO controlledvocabularyvalue VALUES (411, 173, '', 'Philippines', 79);
INSERT INTO controlledvocabularyvalue VALUES (412, 174, '', 'Pitcairn', 79);
INSERT INTO controlledvocabularyvalue VALUES (413, 175, '', 'Poland', 79);
INSERT INTO controlledvocabularyvalue VALUES (414, 176, '', 'Portugal', 79);
INSERT INTO controlledvocabularyvalue VALUES (415, 177, '', 'Puerto Rico', 79);
INSERT INTO controlledvocabularyvalue VALUES (416, 178, '', 'Qatar', 79);
INSERT INTO controlledvocabularyvalue VALUES (417, 179, '', 'Romania', 79);
INSERT INTO controlledvocabularyvalue VALUES (418, 180, '', 'Russian Federation', 79);
INSERT INTO controlledvocabularyvalue VALUES (419, 181, '', 'Rwanda', 79);
INSERT INTO controlledvocabularyvalue VALUES (420, 182, '', 'Réunion', 79);
INSERT INTO controlledvocabularyvalue VALUES (421, 183, '', 'Saint Barthélemy', 79);
INSERT INTO controlledvocabularyvalue VALUES (422, 184, '', 'Saint Helena, Ascension and Tristan da Cunha', 79);
INSERT INTO controlledvocabularyvalue VALUES (423, 185, '', 'Saint Kitts and Nevis', 79);
INSERT INTO controlledvocabularyvalue VALUES (424, 186, '', 'Saint Lucia', 79);
INSERT INTO controlledvocabularyvalue VALUES (425, 187, '', 'Saint Martin (French part)', 79);
INSERT INTO controlledvocabularyvalue VALUES (426, 188, '', 'Saint Pierre and Miquelon', 79);
INSERT INTO controlledvocabularyvalue VALUES (427, 189, '', 'Saint Vincent and the Grenadines', 79);
INSERT INTO controlledvocabularyvalue VALUES (428, 190, '', 'Samoa', 79);
INSERT INTO controlledvocabularyvalue VALUES (429, 191, '', 'San Marino', 79);
INSERT INTO controlledvocabularyvalue VALUES (430, 192, '', 'Sao Tome and Principe', 79);
INSERT INTO controlledvocabularyvalue VALUES (431, 193, '', 'Saudi Arabia', 79);
INSERT INTO controlledvocabularyvalue VALUES (432, 194, '', 'Senegal', 79);
INSERT INTO controlledvocabularyvalue VALUES (433, 195, '', 'Serbia', 79);
INSERT INTO controlledvocabularyvalue VALUES (434, 196, '', 'Seychelles', 79);
INSERT INTO controlledvocabularyvalue VALUES (435, 197, '', 'Sierra Leone', 79);
INSERT INTO controlledvocabularyvalue VALUES (436, 198, '', 'Singapore', 79);
INSERT INTO controlledvocabularyvalue VALUES (437, 199, '', 'Sint Maarten (Dutch part)', 79);
INSERT INTO controlledvocabularyvalue VALUES (438, 200, '', 'Slovakia', 79);
INSERT INTO controlledvocabularyvalue VALUES (439, 201, '', 'Slovenia', 79);
INSERT INTO controlledvocabularyvalue VALUES (440, 202, '', 'Solomon Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (441, 203, '', 'Somalia', 79);
INSERT INTO controlledvocabularyvalue VALUES (442, 204, '', 'South Africa', 79);
INSERT INTO controlledvocabularyvalue VALUES (443, 205, '', 'South Georgia and the South Sandwich Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (444, 206, '', 'South Sudan', 79);
INSERT INTO controlledvocabularyvalue VALUES (445, 207, '', 'Spain', 79);
INSERT INTO controlledvocabularyvalue VALUES (446, 208, '', 'Sri Lanka', 79);
INSERT INTO controlledvocabularyvalue VALUES (447, 209, '', 'Sudan', 79);
INSERT INTO controlledvocabularyvalue VALUES (448, 210, '', 'Suriname', 79);
INSERT INTO controlledvocabularyvalue VALUES (449, 211, '', 'Svalbard and Jan Mayen', 79);
INSERT INTO controlledvocabularyvalue VALUES (450, 212, '', 'Swaziland', 79);
INSERT INTO controlledvocabularyvalue VALUES (451, 213, '', 'Sweden', 79);
INSERT INTO controlledvocabularyvalue VALUES (452, 214, '', 'Switzerland', 79);
INSERT INTO controlledvocabularyvalue VALUES (453, 215, '', 'Syrian Arab Republic', 79);
INSERT INTO controlledvocabularyvalue VALUES (454, 216, '', 'Taiwan, Province of China', 79);
INSERT INTO controlledvocabularyvalue VALUES (455, 217, '', 'Tajikistan', 79);
INSERT INTO controlledvocabularyvalue VALUES (456, 218, '', 'Tanzania, United Republic of', 79);
INSERT INTO controlledvocabularyvalue VALUES (457, 219, '', 'Thailand', 79);
INSERT INTO controlledvocabularyvalue VALUES (458, 220, '', 'Timor-Leste', 79);
INSERT INTO controlledvocabularyvalue VALUES (459, 221, '', 'Togo', 79);
INSERT INTO controlledvocabularyvalue VALUES (460, 222, '', 'Tokelau', 79);
INSERT INTO controlledvocabularyvalue VALUES (461, 223, '', 'Tonga', 79);
INSERT INTO controlledvocabularyvalue VALUES (462, 224, '', 'Trinidad and Tobago', 79);
INSERT INTO controlledvocabularyvalue VALUES (463, 225, '', 'Tunisia', 79);
INSERT INTO controlledvocabularyvalue VALUES (464, 226, '', 'Turkey', 79);
INSERT INTO controlledvocabularyvalue VALUES (465, 227, '', 'Turkmenistan', 79);
INSERT INTO controlledvocabularyvalue VALUES (466, 228, '', 'Turks and Caicos Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (467, 229, '', 'Tuvalu', 79);
INSERT INTO controlledvocabularyvalue VALUES (468, 230, '', 'Uganda', 79);
INSERT INTO controlledvocabularyvalue VALUES (469, 231, '', 'Ukraine', 79);
INSERT INTO controlledvocabularyvalue VALUES (470, 232, '', 'United Arab Emirates', 79);
INSERT INTO controlledvocabularyvalue VALUES (471, 233, '', 'United Kingdom', 79);
INSERT INTO controlledvocabularyvalue VALUES (472, 234, '', 'United States', 79);
INSERT INTO controlledvocabularyvalue VALUES (473, 235, '', 'United States Minor Outlying Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (474, 236, '', 'Uruguay', 79);
INSERT INTO controlledvocabularyvalue VALUES (475, 237, '', 'Uzbekistan', 79);
INSERT INTO controlledvocabularyvalue VALUES (476, 238, '', 'Vanuatu', 79);
INSERT INTO controlledvocabularyvalue VALUES (477, 239, '', 'Venezuela, Bolivarian Republic of', 79);
INSERT INTO controlledvocabularyvalue VALUES (478, 240, '', 'Viet Nam', 79);
INSERT INTO controlledvocabularyvalue VALUES (479, 241, '', 'Virgin Islands, British', 79);
INSERT INTO controlledvocabularyvalue VALUES (480, 242, '', 'Virgin Islands, U.S.', 79);
INSERT INTO controlledvocabularyvalue VALUES (481, 243, '', 'Wallis and Futuna', 79);
INSERT INTO controlledvocabularyvalue VALUES (482, 244, '', 'Western Sahara', 79);
INSERT INTO controlledvocabularyvalue VALUES (483, 245, '', 'Yemen', 79);
INSERT INTO controlledvocabularyvalue VALUES (484, 246, '', 'Zambia', 79);
INSERT INTO controlledvocabularyvalue VALUES (485, 247, '', 'Zimbabwe', 79);
INSERT INTO controlledvocabularyvalue VALUES (486, 248, '', 'Åland Islands', 79);
INSERT INTO controlledvocabularyvalue VALUES (487, 0, '', 'Image', 115);
INSERT INTO controlledvocabularyvalue VALUES (488, 1, '', 'Mosaic', 115);
INSERT INTO controlledvocabularyvalue VALUES (489, 2, '', 'EventList', 115);
INSERT INTO controlledvocabularyvalue VALUES (490, 3, '', 'Spectrum', 115);
INSERT INTO controlledvocabularyvalue VALUES (491, 4, '', 'Cube', 115);
INSERT INTO controlledvocabularyvalue VALUES (492, 5, '', 'Table', 115);
INSERT INTO controlledvocabularyvalue VALUES (493, 6, '', 'Catalog', 115);
INSERT INTO controlledvocabularyvalue VALUES (494, 7, '', 'LightCurve', 115);
INSERT INTO controlledvocabularyvalue VALUES (495, 8, '', 'Simulation', 115);
INSERT INTO controlledvocabularyvalue VALUES (496, 9, '', 'Figure', 115);
INSERT INTO controlledvocabularyvalue VALUES (497, 10, '', 'Artwork', 115);
INSERT INTO controlledvocabularyvalue VALUES (498, 11, '', 'Animation', 115);
INSERT INTO controlledvocabularyvalue VALUES (499, 12, '', 'PrettyPicture', 115);
INSERT INTO controlledvocabularyvalue VALUES (500, 13, '', 'Documentation', 115);
INSERT INTO controlledvocabularyvalue VALUES (501, 14, '', 'Other', 115);
INSERT INTO controlledvocabularyvalue VALUES (502, 15, '', 'Library', 115);
INSERT INTO controlledvocabularyvalue VALUES (503, 16, '', 'Press Release', 115);
INSERT INTO controlledvocabularyvalue VALUES (504, 17, '', 'Facsimile', 115);
INSERT INTO controlledvocabularyvalue VALUES (505, 18, '', 'Historical', 115);
INSERT INTO controlledvocabularyvalue VALUES (506, 19, '', 'Observation', 115);
INSERT INTO controlledvocabularyvalue VALUES (507, 20, '', 'Object', 115);
INSERT INTO controlledvocabularyvalue VALUES (508, 21, '', 'Value', 115);
INSERT INTO controlledvocabularyvalue VALUES (509, 22, '', 'ValuePair', 115);
INSERT INTO controlledvocabularyvalue VALUES (510, 23, '', 'Survey', 115);
INSERT INTO controlledvocabularyvalue VALUES (511, 0, 'EFO_0001427', 'Case Control', 141);
INSERT INTO controlledvocabularyvalue VALUES (512, 1, 'EFO_0001428', 'Cross Sectional', 141);
INSERT INTO controlledvocabularyvalue VALUES (513, 2, 'OCRE100078', 'Cohort Study', 141);
INSERT INTO controlledvocabularyvalue VALUES (514, 3, 'NCI_C48202', 'Nested Case Control Design', 141);
INSERT INTO controlledvocabularyvalue VALUES (515, 4, 'OTHER_DESIGN', 'Not Specified', 141);
INSERT INTO controlledvocabularyvalue VALUES (516, 5, 'OBI_0500006', 'Parallel Group Design', 141);
INSERT INTO controlledvocabularyvalue VALUES (517, 6, 'OBI_0001033', 'Perturbation Design', 141);
INSERT INTO controlledvocabularyvalue VALUES (518, 7, 'MESH_D016449', 'Randomized Controlled Trial', 141);
INSERT INTO controlledvocabularyvalue VALUES (519, 8, 'TECH_DESIGN', 'Technological Design', 141);
INSERT INTO controlledvocabularyvalue VALUES (520, 0, 'EFO_0000246', 'Age', 142);
INSERT INTO controlledvocabularyvalue VALUES (521, 1, 'BIOMARKERS', 'Biomarkers', 142);
INSERT INTO controlledvocabularyvalue VALUES (522, 2, 'CELL_SURFACE_M', 'Cell Surface Markers', 142);
INSERT INTO controlledvocabularyvalue VALUES (523, 3, 'EFO_0000324;EFO_0000322', 'Cell Type/Cell Line', 142);
INSERT INTO controlledvocabularyvalue VALUES (524, 4, 'EFO_0000399', 'Developmental Stage', 142);
INSERT INTO controlledvocabularyvalue VALUES (525, 5, 'OBI_0001293', 'Disease State', 142);
INSERT INTO controlledvocabularyvalue VALUES (526, 6, 'IDO_0000469', 'Drug Susceptibility', 142);
INSERT INTO controlledvocabularyvalue VALUES (527, 7, 'FBcv_0010001', 'Extract Molecule', 142);
INSERT INTO controlledvocabularyvalue VALUES (528, 8, 'OBI_0001404', 'Genetic Characteristics', 142);
INSERT INTO controlledvocabularyvalue VALUES (529, 9, 'OBI_0000690', 'Immunoprecipitation Antibody', 142);
INSERT INTO controlledvocabularyvalue VALUES (530, 10, 'OBI_0100026', 'Organism', 142);
INSERT INTO controlledvocabularyvalue VALUES (531, 11, 'OTHER_FACTOR', 'Other', 142);
INSERT INTO controlledvocabularyvalue VALUES (532, 12, 'PASSAGES_FACTOR', 'Passages', 142);
INSERT INTO controlledvocabularyvalue VALUES (533, 13, 'OBI_0000050', 'Platform', 142);
INSERT INTO controlledvocabularyvalue VALUES (534, 14, 'EFO_0000695', 'Sex', 142);
INSERT INTO controlledvocabularyvalue VALUES (535, 15, 'EFO_0005135', 'Strain', 142);
INSERT INTO controlledvocabularyvalue VALUES (536, 16, 'EFO_0000724', 'Time Point', 142);
INSERT INTO controlledvocabularyvalue VALUES (537, 17, 'BTO_0001384', 'Tissue Type', 142);
INSERT INTO controlledvocabularyvalue VALUES (538, 18, 'EFO_0000369', 'Treatment Compound', 142);
INSERT INTO controlledvocabularyvalue VALUES (539, 19, 'EFO_0000727', 'Treatment Type', 142);
INSERT INTO controlledvocabularyvalue VALUES (540, 0, 'ERO_0001899', 'cell counting', 145);
INSERT INTO controlledvocabularyvalue VALUES (541, 1, 'CHMO_0001085', 'cell sorting', 145);
INSERT INTO controlledvocabularyvalue VALUES (542, 2, 'OBI_0000520', 'clinical chemistry analysis', 145);
INSERT INTO controlledvocabularyvalue VALUES (543, 3, 'OBI_0000537', 'copy number variation profiling', 145);
INSERT INTO controlledvocabularyvalue VALUES (544, 4, 'OBI_0000634', 'DNA methylation profiling', 145);
INSERT INTO controlledvocabularyvalue VALUES (545, 5, 'OBI_0000748', 'DNA methylation profiling (Bisulfite-Seq)', 145);
INSERT INTO controlledvocabularyvalue VALUES (546, 6, '_OBI_0000634', 'DNA methylation profiling (MeDIP-Seq)', 145);
INSERT INTO controlledvocabularyvalue VALUES (547, 7, '_IDO_0000469', 'drug susceptibility', 145);
INSERT INTO controlledvocabularyvalue VALUES (548, 8, 'ENV_GENE_SURVEY', 'environmental gene survey', 145);
INSERT INTO controlledvocabularyvalue VALUES (549, 9, 'ERO_0001183', 'genome sequencing', 145);
INSERT INTO controlledvocabularyvalue VALUES (550, 10, 'OBI_0000630', 'hematology', 145);
INSERT INTO controlledvocabularyvalue VALUES (551, 11, 'OBI_0600020', 'histology', 145);
INSERT INTO controlledvocabularyvalue VALUES (552, 12, 'OBI_0002017', 'Histone Modification (ChIP-Seq)', 145);
INSERT INTO controlledvocabularyvalue VALUES (553, 13, 'SO_0001786', 'loss of heterozygosity profiling', 145);
INSERT INTO controlledvocabularyvalue VALUES (554, 14, 'OBI_0000366', 'metabolite profiling', 145);
INSERT INTO controlledvocabularyvalue VALUES (555, 15, 'METAGENOME_SEQ', 'metagenome sequencing', 145);
INSERT INTO controlledvocabularyvalue VALUES (556, 16, 'OBI_0000615', 'protein expression profiling', 145);
INSERT INTO controlledvocabularyvalue VALUES (557, 17, 'ERO_0000346', 'protein identification', 145);
INSERT INTO controlledvocabularyvalue VALUES (558, 18, 'PROTEIN_DNA_BINDING', 'protein-DNA binding site identification', 145);
INSERT INTO controlledvocabularyvalue VALUES (559, 19, 'OBI_0000288', 'protein-protein interaction detection', 145);
INSERT INTO controlledvocabularyvalue VALUES (560, 20, 'PROTEIN_RNA_BINDING', 'protein-RNA binding (RIP-Seq)', 145);
INSERT INTO controlledvocabularyvalue VALUES (561, 21, 'OBI_0000435', 'SNP analysis', 145);
INSERT INTO controlledvocabularyvalue VALUES (562, 22, 'TARGETED_SEQ', 'targeted sequencing', 145);
INSERT INTO controlledvocabularyvalue VALUES (563, 23, 'OBI_0002018', 'transcription factor binding (ChIP-Seq)', 145);
INSERT INTO controlledvocabularyvalue VALUES (564, 24, 'OBI_0000291', 'transcription factor binding site identification', 145);
INSERT INTO controlledvocabularyvalue VALUES (565, 26, 'EFO_0001032', 'transcription profiling', 145);
INSERT INTO controlledvocabularyvalue VALUES (566, 27, 'TRANSCRIPTION_PROF', 'transcription profiling (Microarray)', 145);
INSERT INTO controlledvocabularyvalue VALUES (567, 28, 'OBI_0001271', 'transcription profiling (RNA-Seq)', 145);
INSERT INTO controlledvocabularyvalue VALUES (568, 29, 'TRAP_TRANS_PROF', 'TRAP translational profiling', 145);
INSERT INTO controlledvocabularyvalue VALUES (569, 30, 'OTHER_MEASUREMENT', 'Other', 145);
INSERT INTO controlledvocabularyvalue VALUES (570, 0, 'NCBITaxon_3702', 'Arabidopsis thaliana', 143);
INSERT INTO controlledvocabularyvalue VALUES (571, 1, 'NCBITaxon_9913', 'Bos taurus', 143);
INSERT INTO controlledvocabularyvalue VALUES (572, 2, 'NCBITaxon_6239', 'Caenorhabditis elegans', 143);
INSERT INTO controlledvocabularyvalue VALUES (573, 3, 'NCBITaxon_3055', 'Chlamydomonas reinhardtii', 143);
INSERT INTO controlledvocabularyvalue VALUES (574, 4, 'NCBITaxon_7955', 'Danio rerio (zebrafish)', 143);
INSERT INTO controlledvocabularyvalue VALUES (575, 5, 'NCBITaxon_44689', 'Dictyostelium discoideum', 143);
INSERT INTO controlledvocabularyvalue VALUES (576, 6, 'NCBITaxon_7227', 'Drosophila melanogaster', 143);
INSERT INTO controlledvocabularyvalue VALUES (577, 7, 'NCBITaxon_562', 'Escherichia coli', 143);
INSERT INTO controlledvocabularyvalue VALUES (578, 8, 'NCBITaxon_11103', 'Hepatitis C virus', 143);
INSERT INTO controlledvocabularyvalue VALUES (579, 9, 'NCBITaxon_9606', 'Homo sapiens', 143);
INSERT INTO controlledvocabularyvalue VALUES (580, 10, 'NCBITaxon_10090', 'Mus musculus', 143);
INSERT INTO controlledvocabularyvalue VALUES (581, 11, 'NCBITaxon_33894', 'Mycobacterium africanum', 143);
INSERT INTO controlledvocabularyvalue VALUES (582, 12, 'NCBITaxon_78331', 'Mycobacterium canetti', 143);
INSERT INTO controlledvocabularyvalue VALUES (583, 13, 'NCBITaxon_1773', 'Mycobacterium tuberculosis', 143);
INSERT INTO controlledvocabularyvalue VALUES (584, 14, 'NCBITaxon_2104', 'Mycoplasma pneumoniae', 143);
INSERT INTO controlledvocabularyvalue VALUES (585, 15, 'NCBITaxon_4530', 'Oryza sativa', 143);
INSERT INTO controlledvocabularyvalue VALUES (586, 16, 'NCBITaxon_5833', 'Plasmodium falciparum', 143);
INSERT INTO controlledvocabularyvalue VALUES (587, 17, 'NCBITaxon_4754', 'Pneumocystis carinii', 143);
INSERT INTO controlledvocabularyvalue VALUES (588, 18, 'NCBITaxon_10116', 'Rattus norvegicus', 143);
INSERT INTO controlledvocabularyvalue VALUES (589, 19, 'NCBITaxon_4932', 'Saccharomyces cerevisiae (brewer''s yeast)', 143);
INSERT INTO controlledvocabularyvalue VALUES (590, 20, 'NCBITaxon_4896', 'Schizosaccharomyces pombe', 143);
INSERT INTO controlledvocabularyvalue VALUES (591, 21, 'NCBITaxon_31033', 'Takifugu rubripes', 143);
INSERT INTO controlledvocabularyvalue VALUES (592, 22, 'NCBITaxon_8355', 'Xenopus laevis', 143);
INSERT INTO controlledvocabularyvalue VALUES (593, 23, 'NCBITaxon_4577', 'Zea mays', 143);
INSERT INTO controlledvocabularyvalue VALUES (594, 24, 'OTHER_TAXONOMY', 'Other', 143);
INSERT INTO controlledvocabularyvalue VALUES (595, 0, 'CULTURE_DRUG_TEST_SINGLE', 'culture based drug susceptibility testing, single concentration', 147);
INSERT INTO controlledvocabularyvalue VALUES (596, 1, 'CULTURE_DRUG_TEST_TWO', 'culture based drug susceptibility testing, two concentrations', 147);
INSERT INTO controlledvocabularyvalue VALUES (597, 2, 'CULTURE_DRUG_TEST_THREE', 'culture based drug susceptibility testing, three or more concentrations (minimium inhibitory concentration measurement)', 147);
INSERT INTO controlledvocabularyvalue VALUES (598, 3, 'OBI_0400148', 'DNA microarray', 147);
INSERT INTO controlledvocabularyvalue VALUES (599, 4, 'OBI_0000916', 'flow cytometry', 147);
INSERT INTO controlledvocabularyvalue VALUES (600, 5, 'OBI_0600053', 'gel electrophoresis', 147);
INSERT INTO controlledvocabularyvalue VALUES (601, 6, 'OBI_0000470', 'mass spectrometry', 147);
INSERT INTO controlledvocabularyvalue VALUES (602, 7, 'OBI_0000623', 'NMR spectroscopy', 147);
INSERT INTO controlledvocabularyvalue VALUES (603, 8, 'OBI_0000626', 'nucleotide sequencing', 147);
INSERT INTO controlledvocabularyvalue VALUES (604, 9, 'OBI_0400149', 'protein microarray', 147);
INSERT INTO controlledvocabularyvalue VALUES (605, 10, 'OBI_0000893', 'real time PCR', 147);
INSERT INTO controlledvocabularyvalue VALUES (606, 11, 'NO_TECHNOLOGY', 'no technology required', 147);
INSERT INTO controlledvocabularyvalue VALUES (607, 12, 'OTHER_TECHNOLOGY', 'Other', 147);
INSERT INTO controlledvocabularyvalue VALUES (608, 0, '210_MS_GC', '210-MS GC Ion Trap (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (609, 1, '220_MS_GC', '220-MS GC Ion Trap (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (610, 2, '225_MS_GC', '225-MS GC Ion Trap (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (611, 3, '240_MS_GC', '240-MS GC Ion Trap (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (612, 4, '300_MS_GCMS', '300-MS quadrupole GC/MS (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (613, 5, '320_MS_LCMS', '320-MS LC/MS (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (614, 6, '325_MS_LCMS', '325-MS LC/MS (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (615, 7, '500_MS_GCMS', '320-MS GC/MS (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (616, 8, '500_MS_LCMS', '500-MS LC/MS (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (617, 9, '800D', '800D (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (618, 10, '910_MS_TQFT', '910-MS TQ-FT (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (619, 11, '920_MS_TQFT', '920-MS TQ-FT (Varian)', 148);
INSERT INTO controlledvocabularyvalue VALUES (620, 12, '3100_MASS_D', '3100 Mass Detector (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (621, 13, '6110_QUAD_LCMS', '6110 Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (622, 14, '6120_QUAD_LCMS', '6120 Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (623, 15, '6130_QUAD_LCMS', '6130 Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (624, 16, '6140_QUAD_LCMS', '6140 Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (625, 17, '6310_ION_LCMS', '6310 Ion Trap LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (626, 18, '6320_ION_LCMS', '6320 Ion Trap LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (627, 19, '6330_ION_LCMS', '6330 Ion Trap LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (628, 20, '6340_ION_LCMS', '6340 Ion Trap LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (629, 21, '6410_TRIPLE_LCMS', '6410 Triple Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (723, 115, 'LI_COR', 'Li-Cor', 148);
INSERT INTO controlledvocabularyvalue VALUES (630, 22, '6430_TRIPLE_LCMS', '6430 Triple Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (631, 23, '6460_TRIPLE_LCMS', '6460 Triple Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (632, 24, '6490_TRIPLE_LCMS', '6490 Triple Quadrupole LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (633, 25, '6530_Q_TOF_LCMS', '6530 Q-TOF LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (634, 26, '6540_Q_TOF_LCMS', '6540 Q-TOF LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (635, 27, '6210_Q_TOF_LCMS', '6210 TOF LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (636, 28, '6220_Q_TOF_LCMS', '6220 TOF LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (637, 29, '6230_Q_TOF_LCMS', '6230 TOF LC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (638, 30, '700B_TRIPLE_GCMS', '7000B Triple Quadrupole GC/MS (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (639, 31, 'ACCUTO_DART', 'AccuTO DART (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (640, 32, 'ACCUTOF_GC', 'AccuTOF GC (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (641, 33, 'ACCUTOF_LC', 'AccuTOF LC (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (642, 34, 'ACQUITY_SQD', 'ACQUITY SQD (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (643, 35, 'ACQUITY_TQD', 'ACQUITY TQD (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (644, 36, 'AGILENT', 'Agilent', 148);
INSERT INTO controlledvocabularyvalue VALUES (645, 37, 'AGILENT_ 5975E_GCMSD', 'Agilent 5975E GC/MSD (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (646, 38, 'AGILENT_5975T_LTM_GCMSD', 'Agilent 5975T LTM GC/MSD (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (647, 39, '5975C_GCMSD', '5975C Series GC/MSD (Agilent)', 148);
INSERT INTO controlledvocabularyvalue VALUES (648, 40, 'AFFYMETRIX', 'Affymetrix', 148);
INSERT INTO controlledvocabularyvalue VALUES (649, 41, 'AMAZON_ETD_ESI', 'amaZon ETD ESI Ion Trap (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (650, 42, 'AMAZON_X_ESI', 'amaZon X ESI Ion Trap (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (651, 43, 'APEX_ULTRA_QQ_FTMS', 'apex-ultra hybrid Qq-FTMS (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (652, 44, 'API_2000', 'API 2000 (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (653, 45, 'API_3200', 'API 3200 (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (654, 46, 'API_3200_QTRAP', 'API 3200 QTRAP (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (655, 47, 'API_4000', 'API 4000 (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (656, 48, 'API_4000_QTRAP', 'API 4000 QTRAP (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (657, 49, 'API_5000', 'API 5000 (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (658, 50, 'API_5500', 'API 5500 (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (659, 51, 'API_5500_QTRAP', 'API 5500 QTRAP (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (660, 52, 'APPLIED_BIOSYSTEMS', 'Applied Biosystems Group (ABI)', 148);
INSERT INTO controlledvocabularyvalue VALUES (661, 53, 'AQI_BIOSCIENCES', 'AQI Biosciences', 148);
INSERT INTO controlledvocabularyvalue VALUES (662, 54, 'ATMOS_GC', 'Atmospheric Pressure GC (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (663, 55, 'AUTOFLEX_III_MALDI_TOF_MS', 'autoflex III MALDI-TOF MS (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (664, 56, 'AUTOFLEX_SPEED', 'autoflex speed(Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (665, 57, 'AUTOSPEC_PREMIER', 'AutoSpec Premier (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (666, 58, 'AXIMA_MEGA_TOF', 'AXIMA Mega TOF (Shimadzu)', 148);
INSERT INTO controlledvocabularyvalue VALUES (667, 59, 'AXIMA_PERF_MALDI_TOF', 'AXIMA Performance MALDI TOF/TOF (Shimadzu)', 148);
INSERT INTO controlledvocabularyvalue VALUES (668, 60, 'A_10_ANALYZER', 'A-10 Analyzer (Apogee)', 148);
INSERT INTO controlledvocabularyvalue VALUES (669, 61, 'A_40_MINIFCM', 'A-40-MiniFCM (Apogee)', 148);
INSERT INTO controlledvocabularyvalue VALUES (670, 62, 'BACTIFLOW', 'Bactiflow (Chemunex SA)', 148);
INSERT INTO controlledvocabularyvalue VALUES (671, 63, 'BASE4INNOVATION', 'Base4innovation', 148);
INSERT INTO controlledvocabularyvalue VALUES (672, 64, 'BD_BACTEC_MGIT_320', 'BD BACTEC MGIT 320', 148);
INSERT INTO controlledvocabularyvalue VALUES (673, 65, 'BD_BACTEC_MGIT_960', 'BD BACTEC MGIT 960', 148);
INSERT INTO controlledvocabularyvalue VALUES (674, 66, 'BD_RADIO_BACTEC_460TB', 'BD Radiometric BACTEC 460TB', 148);
INSERT INTO controlledvocabularyvalue VALUES (675, 67, 'BIONANOMATRIX', 'BioNanomatrix', 148);
INSERT INTO controlledvocabularyvalue VALUES (676, 68, 'CELL_LAB_QUANTA_SC', 'Cell Lab Quanta SC (Becman Coulter)', 148);
INSERT INTO controlledvocabularyvalue VALUES (677, 69, 'CLARUS_560_D_GCMS', 'Clarus 560 D GC/MS (PerkinElmer)', 148);
INSERT INTO controlledvocabularyvalue VALUES (678, 70, 'CLARUS_560_S_GCMS', 'Clarus 560 S GC/MS (PerkinElmer)', 148);
INSERT INTO controlledvocabularyvalue VALUES (679, 71, 'CLARUS_600_GCMS', 'Clarus 600 GC/MS (PerkinElmer)', 148);
INSERT INTO controlledvocabularyvalue VALUES (680, 72, 'COMPLETE_GENOMICS', 'Complete Genomics', 148);
INSERT INTO controlledvocabularyvalue VALUES (681, 73, 'CYAN', 'Cyan (Dako Cytomation)', 148);
INSERT INTO controlledvocabularyvalue VALUES (682, 74, 'CYFLOW_ML', 'CyFlow ML (Partec)', 148);
INSERT INTO controlledvocabularyvalue VALUES (683, 75, 'CYFLOW_SL', 'Cyow SL (Partec)', 148);
INSERT INTO controlledvocabularyvalue VALUES (684, 76, 'CYFLOW_SL3', 'CyFlow SL3 (Partec)', 148);
INSERT INTO controlledvocabularyvalue VALUES (685, 77, 'CYTOBUOY', 'CytoBuoy (Cyto Buoy Inc)', 148);
INSERT INTO controlledvocabularyvalue VALUES (686, 78, 'CYTOSENCE', 'CytoSence (Cyto Buoy Inc)', 148);
INSERT INTO controlledvocabularyvalue VALUES (687, 79, 'CYTOSUB', 'CytoSub (Cyto Buoy Inc)', 148);
INSERT INTO controlledvocabularyvalue VALUES (688, 80, 'DANAHER', 'Danaher', 148);
INSERT INTO controlledvocabularyvalue VALUES (689, 81, 'DFS', 'DFS (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (690, 82, 'EXACTIVE', 'Exactive(Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (691, 83, 'FACS_CANTO', 'FACS Canto (Becton Dickinson)', 148);
INSERT INTO controlledvocabularyvalue VALUES (692, 84, 'FACS_CANTO2', 'FACS Canto2 (Becton Dickinson)', 148);
INSERT INTO controlledvocabularyvalue VALUES (693, 85, 'FACS_SCAN', 'FACS Scan (Becton Dickinson)', 148);
INSERT INTO controlledvocabularyvalue VALUES (694, 86, 'FC_500', 'FC 500 (Becman Coulter)', 148);
INSERT INTO controlledvocabularyvalue VALUES (695, 87, 'GCMATE_II', 'GCmate II GC/MS (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (696, 88, 'GCMS_QP2010_PLUS', 'GCMS-QP2010 Plus (Shimadzu)', 148);
INSERT INTO controlledvocabularyvalue VALUES (697, 89, 'GCMS_QP2010S_PLUS', 'GCMS-QP2010S Plus (Shimadzu)', 148);
INSERT INTO controlledvocabularyvalue VALUES (698, 90, 'GCT_PREMIER', 'GCT Premier (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (699, 91, 'GENEQ', 'GENEQ', 148);
INSERT INTO controlledvocabularyvalue VALUES (700, 92, 'GENOME_CORP', 'Genome Corp.', 148);
INSERT INTO controlledvocabularyvalue VALUES (701, 93, 'GENOVOXX', 'GenoVoxx', 148);
INSERT INTO controlledvocabularyvalue VALUES (702, 94, 'GNUBIO', 'GnuBio', 148);
INSERT INTO controlledvocabularyvalue VALUES (703, 95, 'GUAVA_EASYCYTE_MINI', 'Guava EasyCyte Mini (Millipore)', 148);
INSERT INTO controlledvocabularyvalue VALUES (704, 96, 'GUAVA_EASYCYTE_PLUS', 'Guava EasyCyte Plus (Millipore)', 148);
INSERT INTO controlledvocabularyvalue VALUES (705, 97, 'GUAVA_PERSONAL_CELL', 'Guava Personal Cell Analysis (Millipore)', 148);
INSERT INTO controlledvocabularyvalue VALUES (706, 98, 'GUAVA_PERSONAL_CELL_96', 'Guava Personal Cell Analysis-96 (Millipore)', 148);
INSERT INTO controlledvocabularyvalue VALUES (707, 99, 'HELICOS_BIO', 'Helicos BioSciences', 148);
INSERT INTO controlledvocabularyvalue VALUES (708, 100, 'ILLUMINA', 'Illumina', 148);
INSERT INTO controlledvocabularyvalue VALUES (709, 101, 'INDIRECT_LJ_MEDIUM', 'Indirect proportion method on LJ medium', 148);
INSERT INTO controlledvocabularyvalue VALUES (710, 102, 'INDIRECT_AGAR_7H9', 'Indirect proportion method on Middlebrook Agar 7H9', 148);
INSERT INTO controlledvocabularyvalue VALUES (711, 103, 'INDIRECT_AGAR_7H10', 'Indirect proportion method on Middlebrook Agar 7H10', 148);
INSERT INTO controlledvocabularyvalue VALUES (712, 104, 'INDIRECT_AGAR_7H11', 'Indirect proportion method on Middlebrook Agar 7H11', 148);
INSERT INTO controlledvocabularyvalue VALUES (713, 105, 'INFLUX_ANALYZER', 'inFlux Analyzer (Cytopeia)', 148);
INSERT INTO controlledvocabularyvalue VALUES (714, 106, 'INTELLIGENT_BIOSYSTEMS', 'Intelligent Bio-Systems', 148);
INSERT INTO controlledvocabularyvalue VALUES (715, 107, 'ITQ_700', 'ITQ 700 (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (716, 108, 'ITQ_900', 'ITQ 900 (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (717, 109, 'ITQ_1100', 'ITQ 1100 (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (718, 110, 'JMS_53000_SPIRAL', 'JMS-53000 SpiralTOF (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (719, 111, 'LASERGEN', 'LaserGen', 148);
INSERT INTO controlledvocabularyvalue VALUES (720, 112, 'LCMS_2020', 'LCMS-2020 (Shimadzu)', 148);
INSERT INTO controlledvocabularyvalue VALUES (721, 113, 'LCMS_2010EV', 'LCMS-2010EV (Shimadzu)', 148);
INSERT INTO controlledvocabularyvalue VALUES (722, 114, 'LCMS_IT_TOF', 'LCMS-IT-TOF (Shimadzu)', 148);
INSERT INTO controlledvocabularyvalue VALUES (724, 116, 'LIFE_TECH', 'Life Tech', 148);
INSERT INTO controlledvocabularyvalue VALUES (725, 117, 'LIGHTSPEED_GENOMICS', 'LightSpeed Genomics', 148);
INSERT INTO controlledvocabularyvalue VALUES (726, 118, 'LCT_PREMIER_XE', 'LCT Premier XE (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (727, 119, 'LCQ_DECA_XP_MAX', 'LCQ Deca XP MAX (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (728, 120, 'LCQ_FLEET', 'LCQ Fleet (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (729, 121, 'LXQ_THERMO', 'LXQ (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (730, 122, 'LTQ_CLASSIC', 'LTQ Classic (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (731, 123, 'LTQ_XL', 'LTQ XL (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (732, 124, 'LTQ_VELOS', 'LTQ Velos (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (733, 125, 'LTQ_ORBITRAP_CLASSIC', 'LTQ Orbitrap Classic (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (734, 126, 'LTQ_ORBITRAP_XL', 'LTQ Orbitrap XL (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (735, 127, 'LTQ_ORBITRAP_DISCOVERY', 'LTQ Orbitrap Discovery (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (736, 128, 'LTQ_ORBITRAP_VELOS', 'LTQ Orbitrap Velos (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (737, 129, 'LUMINEX_100', 'Luminex 100 (Luminex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (738, 130, 'LUMINEX_200', 'Luminex 200 (Luminex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (739, 131, 'MACS_QUANT', 'MACS Quant (Miltenyi)', 148);
INSERT INTO controlledvocabularyvalue VALUES (740, 132, 'MALDI_SYNAPT_G2_HDMS', 'MALDI SYNAPT G2 HDMS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (741, 133, 'MALDI_SYNAPT_G2_MS', 'MALDI SYNAPT G2 MS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (742, 134, 'MALDI_SYNAPT_HDMS', 'MALDI SYNAPT HDMS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (743, 135, 'MALDI_SYNAPT_MS', 'MALDI SYNAPT MS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (744, 136, 'MALDI_MICROMX', 'MALDI micro MX (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (745, 137, 'MAXIS', 'maXis (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (746, 138, 'MAXISG4', 'maXis G4 (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (747, 139, 'MICROFLEX_LT_MALDI_TOF_MS', 'microflex LT MALDI-TOF MS (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (748, 140, 'MICROFLEX_LRF_MALDI_TOF_MS', 'microflex LRF MALDI-TOF MS (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (749, 141, 'MICROFLEX_III_TOF_MS', 'microflex III MALDI-TOF MS (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (750, 142, 'MICROTOF_II_ESI_TOF', 'micrOTOF II ESI TOF (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (751, 143, 'MICROTOF_Q_II_ESI_QQ_TOF', 'micrOTOF-Q II ESI-Qq-TOF (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (752, 144, 'MICROPLATE_ALAMAR_BLUE_COLORIMETRIC', 'microplate Alamar Blue (resazurin) colorimetric method', 148);
INSERT INTO controlledvocabularyvalue VALUES (753, 145, 'MSTATION', 'Mstation (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (754, 146, 'MSQ_PLUS', 'MSQ Plus (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (755, 147, 'NABSYS', 'NABsys', 148);
INSERT INTO controlledvocabularyvalue VALUES (756, 148, 'NANOPHOTONICS_BIOSCIENCES', 'Nanophotonics Biosciences', 148);
INSERT INTO controlledvocabularyvalue VALUES (757, 149, 'NETWORK_BIOSYSTEMS', 'Network Biosystems', 148);
INSERT INTO controlledvocabularyvalue VALUES (758, 150, 'NIMBLEGEN', 'Nimblegen', 148);
INSERT INTO controlledvocabularyvalue VALUES (759, 151, 'OXFORD_NANOPORE_TECHNOLOGIES', 'Oxford Nanopore Technologies', 148);
INSERT INTO controlledvocabularyvalue VALUES (760, 152, 'PACIFIC_BIOSCIENCES', 'Pacific Biosciences', 148);
INSERT INTO controlledvocabularyvalue VALUES (761, 153, 'POPULATION_GENETICS_TECHNOLOGIES', 'Population Genetics Technologies', 148);
INSERT INTO controlledvocabularyvalue VALUES (762, 154, 'Q1000GC_ULTRAQUAD', 'Q1000GC UltraQuad (Jeol)', 148);
INSERT INTO controlledvocabularyvalue VALUES (763, 155, 'QUATTRO_MICRO_API', 'Quattro micro API (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (764, 156, 'QUATTRO_MICRO_GC', 'Quattro micro GC (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (765, 157, 'QUATTRO_PREMIER_XE', 'Quattro Premier XE (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (766, 158, 'QSTAR', 'QSTAR (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (767, 159, 'REVEO', 'Reveo', 148);
INSERT INTO controlledvocabularyvalue VALUES (768, 160, 'ROCHE', 'Roche', 148);
INSERT INTO controlledvocabularyvalue VALUES (769, 161, 'SEIRAD', 'Seirad', 148);
INSERT INTO controlledvocabularyvalue VALUES (770, 162, 'SOLARIX_HYBRID_QQ_FTMS', 'solariX hybrid Qq-FTMS (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (771, 163, 'SOMACOUNT', 'Somacount (Bently Instruments)', 148);
INSERT INTO controlledvocabularyvalue VALUES (772, 164, 'SOMASCOPE', 'SomaScope (Bently Instruments)', 148);
INSERT INTO controlledvocabularyvalue VALUES (773, 165, 'SYNAPT_G2_HDMS', 'SYNAPT G2 HDMS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (774, 166, 'SYNAPT_G2_MS', 'SYNAPT G2 MS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (775, 167, 'SYNAPT_HDMS', 'SYNAPT HDMS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (776, 168, 'SYNAPT_MS', 'SYNAPT MS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (777, 169, 'TRIPLETOF_5600', 'TripleTOF 5600 (AB Sciex)', 148);
INSERT INTO controlledvocabularyvalue VALUES (778, 170, 'TSQ_QUANTUM_ULTRA', 'TSQ Quantum Ultra (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (779, 171, 'TSQ_QUANTUM_ACCESS', 'TSQ Quantum Access (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (780, 172, 'TSQ_QUANTUM_ACCESS_MAX', 'TSQ Quantum Access MAX (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (781, 173, 'TSQ_QUANTUM_DISCOVERY_MAX', 'TSQ Quantum Discovery MAX (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (782, 174, 'TSQ_QUANTUM_GC', 'TSQ Quantum GC (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (783, 175, 'TSQ_QUANTUM_XLS', 'TSQ Quantum XLS (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (784, 176, 'TSQ_VANTAGE', 'TSQ Vantage (Thermo Scientific)', 148);
INSERT INTO controlledvocabularyvalue VALUES (785, 177, 'ULTRAFLEXTREME_MALDI_TOF_MS', 'ultrafleXtreme MALDI-TOF MS (Bruker)', 148);
INSERT INTO controlledvocabularyvalue VALUES (786, 178, 'VISIGEN_BIO', 'VisiGen Biotechnologies', 148);
INSERT INTO controlledvocabularyvalue VALUES (787, 179, 'XEVO_G2_QTOF', 'Xevo G2 QTOF (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (788, 180, 'XEVO_QTOF_MS', 'Xevo QTof MS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (789, 181, 'XEVO_TQ_MS', 'Xevo TQ MS (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (790, 182, 'XEVO_TQ_S', 'Xevo TQ-S (Waters)', 148);
INSERT INTO controlledvocabularyvalue VALUES (791, 183, 'OTHER_PLATFORM', 'Other', 148);
INSERT INTO controlledvocabularyvalue VALUES (792, 0, '', 'abstract', 154);
INSERT INTO controlledvocabularyvalue VALUES (793, 1, '', 'addendum', 154);
INSERT INTO controlledvocabularyvalue VALUES (794, 2, '', 'announcement', 154);
INSERT INTO controlledvocabularyvalue VALUES (795, 3, '', 'article-commentary', 154);
INSERT INTO controlledvocabularyvalue VALUES (796, 4, '', 'book review', 154);
INSERT INTO controlledvocabularyvalue VALUES (797, 5, '', 'books received', 154);
INSERT INTO controlledvocabularyvalue VALUES (798, 6, '', 'brief report', 154);
INSERT INTO controlledvocabularyvalue VALUES (799, 7, '', 'calendar', 154);
INSERT INTO controlledvocabularyvalue VALUES (800, 8, '', 'case report', 154);
INSERT INTO controlledvocabularyvalue VALUES (801, 9, '', 'collection', 154);
INSERT INTO controlledvocabularyvalue VALUES (802, 10, '', 'correction', 154);
INSERT INTO controlledvocabularyvalue VALUES (803, 11, '', 'data paper', 154);
INSERT INTO controlledvocabularyvalue VALUES (804, 12, '', 'discussion', 154);
INSERT INTO controlledvocabularyvalue VALUES (805, 13, '', 'dissertation', 154);
INSERT INTO controlledvocabularyvalue VALUES (806, 14, '', 'editorial', 154);
INSERT INTO controlledvocabularyvalue VALUES (807, 15, '', 'in brief', 154);
INSERT INTO controlledvocabularyvalue VALUES (808, 16, '', 'introduction', 154);
INSERT INTO controlledvocabularyvalue VALUES (809, 17, '', 'letter', 154);
INSERT INTO controlledvocabularyvalue VALUES (810, 18, '', 'meeting report', 154);
INSERT INTO controlledvocabularyvalue VALUES (811, 19, '', 'news', 154);
INSERT INTO controlledvocabularyvalue VALUES (812, 20, '', 'obituary', 154);
INSERT INTO controlledvocabularyvalue VALUES (813, 21, '', 'oration', 154);
INSERT INTO controlledvocabularyvalue VALUES (814, 22, '', 'partial retraction', 154);
INSERT INTO controlledvocabularyvalue VALUES (815, 23, '', 'product review', 154);
INSERT INTO controlledvocabularyvalue VALUES (816, 24, '', 'rapid communication', 154);
INSERT INTO controlledvocabularyvalue VALUES (817, 25, '', 'reply', 154);
INSERT INTO controlledvocabularyvalue VALUES (818, 26, '', 'reprint', 154);
INSERT INTO controlledvocabularyvalue VALUES (819, 27, '', 'research article', 154);
INSERT INTO controlledvocabularyvalue VALUES (820, 28, '', 'retraction', 154);
INSERT INTO controlledvocabularyvalue VALUES (821, 29, '', 'review article', 154);
INSERT INTO controlledvocabularyvalue VALUES (822, 30, '', 'translation', 154);
INSERT INTO controlledvocabularyvalue VALUES (823, 31, '', 'other', 154);
INSERT INTO controlledvocabularyvalue VALUES (824, 0, 'dna', 'DNA', 157);
INSERT INTO controlledvocabularyvalue VALUES (825, 1, 'ligand', 'Ligand', 157);
INSERT INTO controlledvocabularyvalue VALUES (826, 2, 'protein', 'Protein', 157);
INSERT INTO controlledvocabularyvalue VALUES (827, 3, 'rna', 'RNA', 157);
INSERT INTO controlledvocabularyvalue VALUES (828, 0, 'als', 'ALS - The Advanced Light Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (829, 1, 'aps', 'APS - The Advanced Photon Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (830, 2, 'camd', 'CAMD - The Center for Advanced Microstructures and Device', 168);
INSERT INTO controlledvocabularyvalue VALUES (831, 3, 'chess', 'CHESS - Cornell High Energy Synchrotron Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (832, 4, 'cls', 'CLSI - Canadian Light Source Inc.', 168);
INSERT INTO controlledvocabularyvalue VALUES (833, 5, 'lcls', 'LCLS - Linac Coherent Light Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (834, 6, 'lnls', 'LNLS - LNLS', 168);
INSERT INTO controlledvocabularyvalue VALUES (835, 7, 'nsls', 'NSLS - National Synchrotron Light Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (836, 8, 'ssrl', 'SSRL - Stanford Synchrotron Radiation Lightsource', 168);
INSERT INTO controlledvocabularyvalue VALUES (837, 9, 'alba', 'ALBA - ALBA', 168);
INSERT INTO controlledvocabularyvalue VALUES (838, 10, 'bessy', 'BESSY - Berlin Electron Storage ring company for SYnchrotron radiation', 168);
INSERT INTO controlledvocabularyvalue VALUES (839, 11, 'diamond', 'DIAMOND - Diamond Light Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (840, 12, 'elettra', 'ELETTRA - Elettra', 168);
INSERT INTO controlledvocabularyvalue VALUES (841, 13, 'embldesy', 'EMBLDESY - EMBL/DESY', 168);
INSERT INTO controlledvocabularyvalue VALUES (842, 14, 'esrf', 'ESRF - European Synchrotron Radiation Facility', 168);
INSERT INTO controlledvocabularyvalue VALUES (843, 15, 'kcsrnt', 'KCSRNT - Kurchatov Center for Synchrotron Radiation and Nanotechnology', 168);
INSERT INTO controlledvocabularyvalue VALUES (844, 16, 'maxii', 'MAX_II - MAXLab', 168);
INSERT INTO controlledvocabularyvalue VALUES (845, 17, 'mpgdesy', 'MPGDESY - MPG/DESY', 168);
INSERT INTO controlledvocabularyvalue VALUES (846, 18, 'petraiii', 'PETRA_III - PETRA III', 168);
INSERT INTO controlledvocabularyvalue VALUES (847, 19, 'slspsi', 'SLSPSI - Swiss Light Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (848, 20, 'soleil', 'SOLEIL - SOLEIL', 168);
INSERT INTO controlledvocabularyvalue VALUES (849, 21, 'srs', 'SRS - Synchrotron Radiation Source', 168);
INSERT INTO controlledvocabularyvalue VALUES (850, 22, 'australian', 'AUSTRALIAN - Australian Synchrotron', 168);
INSERT INTO controlledvocabularyvalue VALUES (851, 23, 'bsrf', 'BSRF - BSRF', 168);
INSERT INTO controlledvocabularyvalue VALUES (852, 24, 'nsrrc', 'NSRRC - National Synchroton Radiation Research Center', 168);
INSERT INTO controlledvocabularyvalue VALUES (853, 25, 'pal', 'PAL - Pohang Accelerator Laboratory', 168);
INSERT INTO controlledvocabularyvalue VALUES (854, 26, 'pf', 'PF - Photon Factory', 168);
INSERT INTO controlledvocabularyvalue VALUES (855, 27, 'rrcat', 'RRCAT - Raja Ramanna Centre for Advanced Technology, Indus-2', 168);
INSERT INTO controlledvocabularyvalue VALUES (856, 28, 'sacla', 'SACLA - SACLA, Japan''s First X-ray Free Electron Laser (XFEL) facility', 168);
INSERT INTO controlledvocabularyvalue VALUES (857, 29, 'slri', 'SLRI - Synchrotron Light Research Institute', 168);
INSERT INTO controlledvocabularyvalue VALUES (858, 30, 'spring8', 'SPRING8 - Super Photon ring 8 GeV', 168);
INSERT INTO controlledvocabularyvalue VALUES (859, 31, 'ssrf', 'SSRF - Shanghai Synchrotron Radiation Facility', 168);


--
-- Name: controlledvocabularyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('controlledvocabularyvalue_id_seq', 859, true);


--
-- Data for Name: customfieldmap; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: customfieldmap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('customfieldmap_id_seq', 1, false);


--
-- Data for Name: customquestion; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: customquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('customquestion_id_seq', 1, false);


--
-- Data for Name: customquestionresponse; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: customquestionresponse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('customquestionresponse_id_seq', 1, false);


--
-- Data for Name: customquestionvalue; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: customquestionvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('customquestionvalue_id_seq', 1, false);


--
-- Data for Name: datafile; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: datafilecategory; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datafilecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datafilecategory_id_seq', 1, false);


--
-- Data for Name: datafiletag; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datafiletag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datafiletag_id_seq', 1, false);


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: datasetfield; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: datasetfield_controlledvocabularyvalue; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetfield_id_seq', 1, false);


--
-- Data for Name: datasetfieldcompoundvalue; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetfieldcompoundvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetfieldcompoundvalue_id_seq', 1, false);


--
-- Data for Name: datasetfielddefaultvalue; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetfielddefaultvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetfielddefaultvalue_id_seq', 1, false);


--
-- Data for Name: datasetfieldtype; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO datasetfieldtype VALUES (1, true, false, false, 'Full title by which the Dataset is known.', '', true, 0, false, 'TEXT', 'title', true, 'Title', 'Enter title...', 1, NULL);
INSERT INTO datasetfieldtype VALUES (2, false, false, false, 'A secondary title used to amplify or state certain limitations on the main title.', '', false, 1, false, 'TEXT', 'subtitle', false, 'Subtitle', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (3, false, false, false, 'A title by which the work is commonly referred, or an abbreviation of the title.', '', false, 2, false, 'TEXT', 'alternativeTitle', false, 'Alternative Title', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (4, false, false, true, 'Another unique identifier that identifies this Dataset (e.g., producer''s or another repository''s number).', ':', false, 3, false, 'NONE', 'otherId', false, 'Other ID', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (5, false, false, false, 'Name of agency which generated this identifier.', '#VALUE', false, 4, false, 'TEXT', 'otherIdAgency', false, 'Agency', '', 1, 4);
INSERT INTO datasetfieldtype VALUES (6, false, false, false, 'Other identifier that corresponds to this Dataset.', '#VALUE', false, 5, false, 'TEXT', 'otherIdValue', false, 'Identifier', '', 1, 4);
INSERT INTO datasetfieldtype VALUES (7, false, false, true, 'The person(s), corporate body(ies), or agency(ies) responsible for creating the work.', '', true, 6, false, 'NONE', 'author', false, 'Author', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (8, true, false, false, 'The author''s Family Name, Given Name or the name of the organization responsible for this Dataset.', '#VALUE', true, 7, true, 'TEXT', 'authorName', true, 'Name', 'FamilyName, GivenName or Organization', 1, 7);
INSERT INTO datasetfieldtype VALUES (9, true, false, false, 'The organization with which the author is affiliated.', '(#VALUE)', true, 8, true, 'TEXT', 'authorAffiliation', false, 'Affiliation', '', 1, 7);
INSERT INTO datasetfieldtype VALUES (10, false, true, false, 'Name of the identifier scheme (ORCID, ISNI).', '- #VALUE:', true, 9, false, 'TEXT', 'authorIdentifierScheme', false, 'Identifier Scheme', '', 1, 7);
INSERT INTO datasetfieldtype VALUES (11, false, false, false, 'Uniquely identifies an individual author or organization, according to various schemes.', '#VALUE', true, 10, false, 'TEXT', 'authorIdentifier', false, 'Identifier', '', 1, 7);
INSERT INTO datasetfieldtype VALUES (12, false, false, true, 'The contact(s) for this Dataset.', '', true, 11, false, 'NONE', 'datasetContact', false, 'Contact', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (13, false, false, false, 'The contact''s Family Name, Given Name or the name of the organization.', '#VALUE', true, 12, false, 'TEXT', 'datasetContactName', false, 'Name', 'FamilyName, GivenName or Organization', 1, 12);
INSERT INTO datasetfieldtype VALUES (14, false, false, false, 'The organization with which the contact is affiliated.', '(#VALUE)', true, 13, false, 'TEXT', 'datasetContactAffiliation', false, 'Affiliation', '', 1, 12);
INSERT INTO datasetfieldtype VALUES (15, false, false, false, 'The e-mail address(es) of the contact(s) for the Dataset. This will not be displayed.', '#EMAIL', true, 14, false, 'EMAIL', 'datasetContactEmail', true, 'E-mail', '', 1, 12);
INSERT INTO datasetfieldtype VALUES (16, false, false, true, 'A summary describing the purpose, nature, and scope of the Dataset.', '', true, 15, false, 'NONE', 'dsDescription', false, 'Description', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (17, true, false, false, 'A summary describing the purpose, nature, and scope of the Dataset.', '#VALUE', true, 16, false, 'TEXTBOX', 'dsDescriptionValue', true, 'Text', '', 1, 16);
INSERT INTO datasetfieldtype VALUES (18, false, false, false, 'In cases where a Dataset contains more than one description (for example, one might be supplied by the data producer and another prepared by the data repository where the data are deposited), the date attribute is used to distinguish between the two descriptions. The date attribute follows the ISO convention of YYYY-MM-DD.', '(#VALUE)', true, 17, false, 'DATE', 'dsDescriptionDate', false, 'Date', 'YYYY-MM-DD', 1, 16);
INSERT INTO datasetfieldtype VALUES (19, true, true, true, 'Domain-specific Subject Categories that are topically relevant to the Dataset.', '', true, 18, true, 'TEXT', 'subject', true, 'Subject', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (20, false, false, true, 'Key terms that describe important aspects of the Dataset.', '', true, 19, false, 'NONE', 'keyword', false, 'Keyword', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (21, true, false, false, 'Key terms that describe important aspects of the Dataset. Can be used for building keyword indexes and for classification and retrieval purposes. A controlled vocabulary can be employed. The vocab attribute is provided for specification of the controlled vocabulary in use, such as LCSH, MeSH, or others. The vocabURI attribute specifies the location for the full controlled vocabulary.', '#VALUE', true, 20, true, 'TEXT', 'keywordValue', false, 'Term', '', 1, 20);
INSERT INTO datasetfieldtype VALUES (22, false, false, false, 'For the specification of the keyword controlled vocabulary in use, such as LCSH, MeSH, or others.', '(#VALUE)', true, 21, false, 'TEXT', 'keywordVocabulary', false, 'Vocabulary', '', 1, 20);
INSERT INTO datasetfieldtype VALUES (23, false, false, false, 'Keyword vocabulary URL points to the web presence that describes the keyword vocabulary, if appropriate. Enter an absolute URL where the keyword vocabulary web site is found, such as http://www.my.org.', '<a href="#VALUE">#VALUE</a>', true, 22, false, 'URL', 'keywordVocabularyURI', false, 'Vocabulary URL', 'Enter full URL, starting with http://', 1, 20);
INSERT INTO datasetfieldtype VALUES (24, false, false, true, 'The classification field indicates the broad important topic(s) and subjects that the data cover. Library of Congress subject terms may be used here.  ', '', false, 23, false, 'NONE', 'topicClassification', false, 'Topic Classification', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (25, true, false, false, 'Topic or Subject term that is relevant to this Dataset.', '#VALUE', false, 24, true, 'TEXT', 'topicClassValue', false, 'Term', '', 1, 24);
INSERT INTO datasetfieldtype VALUES (26, false, false, false, 'Provided for specification of the controlled vocabulary in use, e.g., LCSH, MeSH, etc.', '(#VALUE)', false, 25, false, 'TEXT', 'topicClassVocab', false, 'Vocabulary', '', 1, 24);
INSERT INTO datasetfieldtype VALUES (27, false, false, false, 'Specifies the URL location for the full controlled vocabulary.', '<a href="#VALUE">#VALUE</a>', false, 26, false, 'URL', 'topicClassVocabURI', false, 'Vocabulary URL', 'Enter full URL, starting with http://', 1, 24);
INSERT INTO datasetfieldtype VALUES (28, false, false, true, 'Publications that use the data from this Dataset.', '', false, 27, false, 'NONE', 'publication', false, 'Related Publication', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (29, true, false, false, 'The full bibliographic citation for this related publication.', '#VALUE', false, 28, false, 'TEXTBOX', 'publicationCitation', false, 'Citation', '', 1, 28);
INSERT INTO datasetfieldtype VALUES (30, true, true, false, 'The type of digital identifier used for this publication (e.g., Digital Object Identifier (DOI)).', '#VALUE: ', false, 29, false, 'TEXT', 'publicationIDType', false, 'ID Type', '', 1, 28);
INSERT INTO datasetfieldtype VALUES (31, true, false, false, 'The identifier for the selected ID type.', '#VALUE', false, 30, false, 'TEXT', 'publicationIDNumber', false, 'ID Number', '', 1, 28);
INSERT INTO datasetfieldtype VALUES (32, false, false, false, 'Link to the publication web page (e.g., journal article page, archive record page, or other).', '<a href="#VALUE">#VALUE</a>', false, 31, false, 'URL', 'publicationURL', false, 'URL', 'Enter full URL, starting with http://', 1, 28);
INSERT INTO datasetfieldtype VALUES (33, false, false, false, 'Additional important information about the Dataset.', '', true, 32, false, 'TEXTBOX', 'notesText', false, 'Notes', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (34, true, true, true, 'Language of the Dataset', '', false, 33, true, 'TEXT', 'language', false, 'Language', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (35, false, false, true, 'Person or organization with the financial or administrative responsibility over this Dataset', '', false, 34, false, 'NONE', 'producer', false, 'Producer', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (36, true, false, false, 'Producer name', '#VALUE', false, 35, true, 'TEXT', 'producerName', false, 'Name', 'FamilyName, GivenName or Organization', 1, 35);
INSERT INTO datasetfieldtype VALUES (37, false, false, false, 'The organization with which the producer is affiliated.', '(#VALUE)', false, 36, false, 'TEXT', 'producerAffiliation', false, 'Affiliation', '', 1, 35);
INSERT INTO datasetfieldtype VALUES (38, false, false, false, 'The abbreviation by which the producer is commonly known. (ex. IQSS, ICPSR)', '(#VALUE)', false, 37, false, 'TEXT', 'producerAbbreviation', false, 'Abbreviation', '', 1, 35);
INSERT INTO datasetfieldtype VALUES (39, false, false, false, 'Producer URL points to the producer''s web presence, if appropriate. Enter an absolute URL where the producer''s web site is found, such as http://www.my.org.  ', '<a href="#VALUE">#VALUE</a>', false, 38, false, 'URL', 'producerURL', false, 'URL', 'Enter full URL, starting with http://', 1, 35);
INSERT INTO datasetfieldtype VALUES (40, false, false, false, 'URL for the producer''s logo, which points to this  producer''s web-accessible logo image. Enter an absolute URL where the producer''s logo image is found, such as http://www.my.org/images/logo.gif.', '<img src="#VALUE" alt="#NAME" class="metadata-logo"/><br/>', false, 39, false, 'URL', 'producerLogoURL', false, 'Logo URL', 'Enter full URL for image, starting with http://', 1, 35);
INSERT INTO datasetfieldtype VALUES (41, true, false, false, 'Date when the data collection or other materials were produced (not distributed, published or archived).', '', false, 40, true, 'DATE', 'productionDate', false, 'Production Date', 'YYYY-MM-DD', 1, NULL);
INSERT INTO datasetfieldtype VALUES (42, false, false, false, 'The location where the data collection and any other related materials were produced.', '', false, 41, false, 'TEXT', 'productionPlace', false, 'Production Place', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (43, false, false, true, 'The organization or person responsible for either collecting, managing, or otherwise contributing in some form to the development of the resource.', ':', false, 42, false, 'NONE', 'contributor', false, 'Contributor', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (44, true, true, false, 'The type of contributor of the  resource.  ', '#VALUE ', false, 43, true, 'TEXT', 'contributorType', false, 'Type', '', 1, 43);
INSERT INTO datasetfieldtype VALUES (45, true, false, false, 'The Family Name, Given Name or organization name of the contributor.', '#VALUE', false, 44, true, 'TEXT', 'contributorName', false, 'Name', 'FamilyName, GivenName or Organization', 1, 43);
INSERT INTO datasetfieldtype VALUES (46, false, false, true, 'Grant Information', ':', false, 45, false, 'NONE', 'grantNumber', false, 'Grant Information', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (47, false, false, false, 'Grant Number Agency', '#VALUE', false, 46, false, 'TEXT', 'grantNumberAgency', false, 'Grant Agency', '', 1, 46);
INSERT INTO datasetfieldtype VALUES (48, false, false, false, 'The grant or contract number of the project that  sponsored the effort.', '#VALUE', false, 47, false, 'TEXT', 'grantNumberValue', false, 'Grant Number', '', 1, 46);
INSERT INTO datasetfieldtype VALUES (49, false, false, true, 'The organization designated by the author or producer to generate copies of the particular work including any necessary editions or revisions.', '', false, 48, false, 'NONE', 'distributor', false, 'Distributor', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (50, true, false, false, 'Distributor name', '#VALUE', false, 49, true, 'TEXT', 'distributorName', false, 'Name', 'FamilyName, GivenName or Organization', 1, 49);
INSERT INTO datasetfieldtype VALUES (51, false, false, false, 'The organization with which the distributor contact is affiliated.', '(#VALUE)', false, 50, false, 'TEXT', 'distributorAffiliation', false, 'Affiliation', '', 1, 49);
INSERT INTO datasetfieldtype VALUES (52, false, false, false, 'The abbreviation by which this distributor is commonly known (e.g., IQSS, ICPSR).', '(#VALUE)', false, 51, false, 'TEXT', 'distributorAbbreviation', false, 'Abbreviation', '', 1, 49);
INSERT INTO datasetfieldtype VALUES (53, false, false, false, 'Distributor URL points to the distributor''s web presence, if appropriate. Enter an absolute URL where the distributor''s web site is found, such as http://www.my.org.', '<a href="#VALUE">#VALUE</a>', false, 52, false, 'URL', 'distributorURL', false, 'URL', 'Enter full URL, starting with http://', 1, 49);
INSERT INTO datasetfieldtype VALUES (54, false, false, false, 'URL of the distributor''s logo, which points to this  distributor''s web-accessible logo image. Enter an absolute URL where the distributor''s logo image is found, such as http://www.my.org/images/logo.gif.', '<img src="#VALUE" alt="#NAME" class="metadata-logo"/><br/>', false, 53, false, 'URL', 'distributorLogoURL', false, 'Logo URL', 'Enter full URL for image, starting with http://', 1, 49);
INSERT INTO datasetfieldtype VALUES (55, true, false, false, 'Date that the work was made available for distribution/presentation.', '', false, 54, true, 'DATE', 'distributionDate', false, 'Distribution Date', 'YYYY-MM-DD', 1, NULL);
INSERT INTO datasetfieldtype VALUES (56, false, false, false, 'The person (Family Name, Given Name) or the name of the organization that deposited this Dataset to the repository.', '', false, 55, false, 'TEXT', 'depositor', false, 'Depositor', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (57, false, false, false, 'Date that the Dataset was deposited into the repository.', '', false, 56, true, 'DATE', 'dateOfDeposit', false, 'Deposit Date', 'YYYY-MM-DD', 1, NULL);
INSERT INTO datasetfieldtype VALUES (58, false, false, true, 'Time period to which the data refer. This item reflects the time period covered by the data, not the dates of coding or making documents machine-readable or the dates the data were collected. Also known as span.', ';', false, 57, false, 'NONE', 'timePeriodCovered', false, 'Time Period Covered', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (59, true, false, false, 'Start date which reflects the time period covered by the data, not the dates of coding or making documents machine-readable or the dates the data were collected.', '#NAME: #VALUE ', false, 58, true, 'DATE', 'timePeriodCoveredStart', false, 'Start', 'YYYY-MM-DD', 1, 58);
INSERT INTO datasetfieldtype VALUES (60, true, false, false, 'End date which reflects the time period covered by the data, not the dates of coding or making documents machine-readable or the dates the data were collected.', '#NAME: #VALUE ', false, 59, true, 'DATE', 'timePeriodCoveredEnd', false, 'End', 'YYYY-MM-DD', 1, 58);
INSERT INTO datasetfieldtype VALUES (61, false, false, true, 'Contains the date(s) when the data were collected.', ';', false, 60, false, 'NONE', 'dateOfCollection', false, 'Date of Collection', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (62, false, false, false, 'Date when the data collection started.', '#NAME: #VALUE ', false, 61, false, 'DATE', 'dateOfCollectionStart', false, 'Start', 'YYYY-MM-DD', 1, 61);
INSERT INTO datasetfieldtype VALUES (63, false, false, false, 'Date when the data collection ended.', '#NAME: #VALUE ', false, 62, false, 'DATE', 'dateOfCollectionEnd', false, 'End', 'YYYY-MM-DD', 1, 61);
INSERT INTO datasetfieldtype VALUES (64, true, false, true, 'Type of data included in the file: survey data, census/enumeration data, aggregate data, clinical data, event/transaction data, program source code, machine-readable text, administrative records data, experimental data, psychological test, textual data, coded textual, coded documents, time budget diaries, observation data/ratings, process-produced data, or other.', '', false, 63, true, 'TEXT', 'kindOfData', false, 'Kind of Data', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (65, false, false, false, 'Information about the Dataset series.', ':', false, 64, false, 'NONE', 'series', false, 'Series', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (66, true, false, false, 'Name of the dataset series to which the Dataset belongs.', '#VALUE', false, 65, true, 'TEXT', 'seriesName', false, 'Name', '', 1, 65);
INSERT INTO datasetfieldtype VALUES (67, false, false, false, 'History of the series and summary of those features that apply to the series as a whole.', '#VALUE', false, 66, false, 'TEXTBOX', 'seriesInformation', false, 'Information', '', 1, 65);
INSERT INTO datasetfieldtype VALUES (68, false, false, true, 'Information about the software used to generate the Dataset.', ',', false, 67, false, 'NONE', 'software', false, 'Software', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (69, false, true, false, 'Name of software used to generate the Dataset.', '#VALUE', false, 68, false, 'TEXT', 'softwareName', false, 'Name', '', 1, 68);
INSERT INTO datasetfieldtype VALUES (70, false, false, false, 'Version of the software used to generate the Dataset.', '#NAME: #VALUE', false, 69, false, 'TEXT', 'softwareVersion', false, 'Version', '', 1, 68);
INSERT INTO datasetfieldtype VALUES (71, false, false, true, 'Any material related to this Dataset.', '', false, 70, false, 'TEXTBOX', 'relatedMaterial', false, 'Related Material', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (72, false, false, true, 'Any Datasets that are related to this Dataset, such as previous research on this subject.', '', false, 71, false, 'TEXTBOX', 'relatedDatasets', false, 'Related Datasets', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (73, false, false, true, 'Any references that would serve as background or supporting material to this Dataset.', '', false, 72, false, 'TEXT', 'otherReferences', false, 'Other References', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (74, false, false, true, 'List of books, articles, serials, or machine-readable data files that served as the sources of the data collection.', '', false, 73, false, 'TEXTBOX', 'dataSources', false, 'Data Sources', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (75, false, false, false, 'For historical materials, information about the origin of the sources and the rules followed in establishing the sources should be specified.', '', false, 74, false, 'TEXTBOX', 'originOfSources', false, 'Origin of Sources', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (76, false, false, false, 'Assessment of characteristics and source material.', '', false, 75, false, 'TEXTBOX', 'characteristicOfSources', false, 'Characteristic of Sources Noted', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (77, false, false, false, 'Level of documentation of the original sources.', '', false, 76, false, 'TEXTBOX', 'accessToSources', false, 'Documentation and Access to Sources', '', 1, NULL);
INSERT INTO datasetfieldtype VALUES (78, false, false, true, 'Information on the geographic coverage of the data. Includes the total geographic scope of the data.', '', false, 0, false, 'NONE', 'geographicCoverage', false, 'Geographic Coverage', '', 2, NULL);
INSERT INTO datasetfieldtype VALUES (79, true, true, false, 'The country or nation that the Dataset is about.', '', false, 1, true, 'TEXT', 'country', false, 'Country / Nation', '', 2, 78);
INSERT INTO datasetfieldtype VALUES (80, true, false, false, 'The state or province that the Dataset is about. Use GeoNames for correct spelling and avoid abbreviations.', '', false, 2, true, 'TEXT', 'state', false, 'State / Province', '', 2, 78);
INSERT INTO datasetfieldtype VALUES (81, true, false, false, 'The name of the city that the Dataset is about. Use GeoNames for correct spelling and avoid abbreviations.', '', false, 3, true, 'TEXT', 'city', false, 'City', '', 2, 78);
INSERT INTO datasetfieldtype VALUES (82, false, false, false, 'Other information on the geographic coverage of the data.', '', false, 4, false, 'TEXT', 'otherGeographicCoverage', false, 'Other', '', 2, 78);
INSERT INTO datasetfieldtype VALUES (83, true, false, true, 'Lowest level of geographic aggregation covered by the Dataset, e.g., village, county, region.', '', false, 5, true, 'TEXT', 'geographicUnit', false, 'Geographic Unit', '', 2, NULL);
INSERT INTO datasetfieldtype VALUES (84, false, false, true, 'The fundamental geometric description for any Dataset that models geography is the geographic bounding box. It describes the minimum box, defined by west and east longitudes and north and south latitudes, which includes the largest geographic extent of the  Dataset''s geographic coverage. This element is used in the first pass of a coordinate-based search. Inclusion of this element in the codebook is recommended, but is required if the bound polygon box is included. ', '', false, 6, false, 'NONE', 'geographicBoundingBox', false, 'Geographic Bounding Box', '', 2, NULL);
INSERT INTO datasetfieldtype VALUES (85, false, false, false, 'Westernmost coordinate delimiting the geographic extent of the Dataset. A valid range of values,  expressed in decimal degrees, is -180,0 <= West  Bounding Longitude Value <= 180,0.', '', false, 7, false, 'TEXT', 'westLongitude', false, 'West Longitude', '', 2, 84);
INSERT INTO datasetfieldtype VALUES (86, false, false, false, 'Easternmost coordinate delimiting the geographic extent of the Dataset. A valid range of values,  expressed in decimal degrees, is -180,0 <= East Bounding Longitude Value <= 180,0.', '', false, 8, false, 'TEXT', 'eastLongitude', false, 'East Longitude', '', 2, 84);
INSERT INTO datasetfieldtype VALUES (87, false, false, false, 'Northernmost coordinate delimiting the geographic extent of the Dataset. A valid range of values,  expressed in decimal degrees, is -90,0 <= North Bounding Latitude Value <= 90,0.', '', false, 9, false, 'TEXT', 'northLongitude', false, 'North Latitude', '', 2, 84);
INSERT INTO datasetfieldtype VALUES (88, false, false, false, 'Southernmost coordinate delimiting the geographic extent of the Dataset. A valid range of values,  expressed in decimal degrees, is -90,0 <= South Bounding Latitude Value <= 90,0.', '', false, 10, false, 'TEXT', 'southLongitude', false, 'South Latitude', '', 2, 84);
INSERT INTO datasetfieldtype VALUES (89, true, false, true, 'Basic unit of analysis or observation that this Dataset describes, such as individuals, families/households, groups, institutions/organizations, administrative units, and more. For information about the DDI''s controlled vocabulary for this element, please refer to the DDI web page at http://www.ddialliance.org/Specification/DDI-CV/.', '', false, 0, true, 'TEXTBOX', 'unitOfAnalysis', false, 'Unit of Analysis', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (90, true, false, true, 'Description of the population covered by the data in the file; the group of people or other elements that are the object of the study and to which the study results refer. Age, nationality, and residence commonly help to  delineate a given universe, but any number of other factors may be used, such as age limits, sex, marital status, race, ethnic group, nationality, income, veteran status, criminal convictions, and more. The universe may consist of elements other than persons, such as housing units, court cases, deaths, countries, and so on. In general, it should be possible to tell from the description of the universe whether a given individual or element is a member of the population under study. Also known as the universe of interest, population of interest, and target population.', '', false, 1, true, 'TEXTBOX', 'universe', false, 'Universe', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (91, true, false, false, 'The time method or time dimension of the data collection, such as panel, cross-sectional, trend, time- series, or other.', '', false, 2, true, 'TEXT', 'timeMethod', false, 'Time Method', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (92, false, false, false, 'Individual, agency or organization responsible for  administering the questionnaire or interview or compiling the data.', '', false, 3, false, 'TEXT', 'dataCollector', false, 'Data Collector', 'FamilyName, GivenName or Organization', 3, NULL);
INSERT INTO datasetfieldtype VALUES (93, false, false, false, 'Type of training provided to the data collector', '', false, 4, false, 'TEXT', 'collectorTraining', false, 'Collector Training', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (94, true, false, false, 'If the data collected includes more than one point in time, indicate the frequency with which the data was collected; that is, monthly, quarterly, or other.', '', false, 5, true, 'TEXT', 'frequencyOfDataCollection', false, 'Frequency', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (95, false, false, false, 'Type of sample and sample design used to select the survey respondents to represent the population. May include reference to the target sample size and the sampling fraction.', '', false, 6, false, 'TEXTBOX', 'samplingProcedure', false, 'Sampling Procedure', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (96, false, false, false, 'Specific information regarding the target sample size, actual  sample size, and the formula used to determine this.', '', false, 7, false, 'NONE', 'targetSampleSize', false, 'Target Sample Size', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (97, false, false, false, 'Actual sample size.', '', false, 8, false, 'INT', 'targetSampleActualSize', false, 'Actual', 'Enter an integer...', 3, 96);
INSERT INTO datasetfieldtype VALUES (98, false, false, false, 'Formula used to determine target sample size.', '', false, 9, false, 'TEXT', 'targetSampleSizeFormula', false, 'Formula', '', 3, 96);
INSERT INTO datasetfieldtype VALUES (99, false, false, false, 'Show correspondence as well as discrepancies between the sampled units (obtained) and available statistics for the population (age, sex-ratio, marital status, etc.) as a whole.', '', false, 10, false, 'TEXT', 'deviationsFromSampleDesign', false, 'Major Deviations for Sample Design', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (100, false, false, false, 'Method used to collect the data; instrumentation characteristics (e.g., telephone interview, mail questionnaire, or other).', '', false, 11, false, 'TEXTBOX', 'collectionMode', false, 'Collection Mode', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (101, false, false, false, 'Type of data collection instrument used. Structured indicates an instrument in which all respondents are asked the same questions/tests, possibly with precoded answers. If a small portion of such a questionnaire includes open-ended questions, provide appropriate comments. Semi-structured indicates that the research instrument contains mainly open-ended questions. Unstructured indicates that in-depth interviews were conducted.', '', false, 12, false, 'TEXT', 'researchInstrument', false, 'Type of Research Instrument', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (102, false, false, false, 'Description of noteworthy aspects of the data collection situation. Includes information on factors such as cooperativeness of respondents, duration of interviews, number of call backs, or similar.', '', false, 13, false, 'TEXTBOX', 'dataCollectionSituation', false, 'Characteristics of Data Collection Situation', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (103, false, false, false, 'Summary of actions taken to minimize data loss. Include information on actions such as follow-up visits, supervisory checks, historical matching, estimation, and so on.', '', false, 14, false, 'TEXT', 'actionsToMinimizeLoss', false, 'Actions to Minimize Losses', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (104, false, false, false, 'Control OperationsMethods to facilitate data control performed by the primary investigator or by the data archive.', '', false, 15, false, 'TEXT', 'controlOperations', false, 'Control Operations', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (105, false, false, false, 'The use of sampling procedures might make it necessary to apply weights to produce accurate statistical results. Describes the criteria for using weights in analysis of a collection. If a weighting formula or coefficient was developed, the formula is provided, its elements are defined, and it is indicated how the formula was applied to the data.', '', false, 16, false, 'TEXTBOX', 'weighting', false, 'Weighting', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (106, false, false, false, 'Methods used to clean the data collection, such as consistency checking, wildcode checking, or other.', '', false, 17, false, 'TEXT', 'cleaningOperations', false, 'Cleaning Operations', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (107, false, false, false, 'Note element used for any information annotating or clarifying the methodology and processing of the study. ', '', false, 18, false, 'TEXT', 'datasetLevelErrorNotes', false, 'Study Level Error Notes', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (108, true, false, false, 'Percentage of sample members who provided information.', '', false, 19, true, 'TEXTBOX', 'responseRate', false, 'Response Rate', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (109, false, false, false, 'Measure of how precisely one can estimate a population value from a given sample.', '', false, 20, false, 'TEXT', 'samplingErrorEstimates', false, 'Estimates of Sampling Error', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (110, false, false, false, 'Other issues pertaining to the data appraisal. Describe issues such as response variance, nonresponse rate  and testing for bias, interviewer and response bias, confidence levels, question bias, or similar.', '', false, 21, false, 'TEXT', 'otherDataAppraisal', false, 'Other Forms of Data Appraisal', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (111, false, false, false, 'General notes about this Dataset.', '', false, 22, false, 'NONE', 'socialScienceNotes', false, 'Notes', '', 3, NULL);
INSERT INTO datasetfieldtype VALUES (112, false, false, false, 'Type of note.', '', false, 23, false, 'TEXT', 'socialScienceNotesType', false, 'Type', '', 3, 111);
INSERT INTO datasetfieldtype VALUES (113, false, false, false, 'Note subject.', '', false, 24, false, 'TEXT', 'socialScienceNotesSubject', false, 'Subject', '', 3, 111);
INSERT INTO datasetfieldtype VALUES (114, false, false, false, 'Text for this note.', '', false, 25, false, 'TEXTBOX', 'socialScienceNotesText', false, 'Text', '', 3, 111);
INSERT INTO datasetfieldtype VALUES (115, true, true, true, 'The nature or genre of the content of the files in the dataset.', '', false, 0, true, 'TEXT', 'astroType', false, 'Type', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (116, true, true, true, 'The observatory or facility where the data was obtained. ', '', false, 1, true, 'TEXT', 'astroFacility', false, 'Facility', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (117, true, true, true, 'The instrument used to collect the data.', '', false, 2, true, 'TEXT', 'astroInstrument', false, 'Instrument', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (118, true, false, true, 'Astronomical Objects represented in the data (Given as SIMBAD recognizable names preferred).', '', false, 3, true, 'TEXT', 'astroObject', false, 'Object', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (119, true, false, false, 'The spatial (angular) resolution that is typical of the observations, in decimal degrees.', '', false, 4, true, 'TEXT', 'resolution.Spatial', false, 'Spatial Resolution', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (120, true, false, false, 'The spectral resolution that is typical of the observations, given as the ratio λ/Δλ.', '', false, 5, true, 'TEXT', 'resolution.Spectral', false, 'Spectral Resolution', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (121, false, false, false, 'The temporal resolution that is typical of the observations, given in seconds.', '', false, 6, false, 'TEXT', 'resolution.Temporal', false, 'Time Resolution', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (122, true, true, true, 'Conventional bandpass name', '', false, 7, true, 'TEXT', 'coverage.Spectral.Bandpass', false, 'Bandpass', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (123, true, false, true, 'The central wavelength of the spectral bandpass, in meters.', '', false, 8, true, 'FLOAT', 'coverage.Spectral.CentralWavelength', false, 'Central Wavelength (m)', 'Enter a floating-point number.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (124, false, false, true, 'The minimum and maximum wavelength of the spectral bandpass.', '', false, 9, false, 'NONE', 'coverage.Spectral.Wavelength', false, 'Wavelength Range', 'Enter a floating-point number.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (125, true, false, false, 'The minimum wavelength of the spectral bandpass, in meters.', '', false, 10, true, 'FLOAT', 'coverage.Spectral.MinimumWavelength', false, 'Minimum (m)', 'Enter a floating-point number.', 4, 124);
INSERT INTO datasetfieldtype VALUES (126, true, false, false, 'The maximum wavelength of the spectral bandpass, in meters.', '', false, 11, true, 'FLOAT', 'coverage.Spectral.MaximumWavelength', false, 'Maximum (m)', 'Enter a floating-point number.', 4, 124);
INSERT INTO datasetfieldtype VALUES (127, false, false, true, ' Time period covered by the data.', '', false, 12, false, 'NONE', 'coverage.Temporal', false, 'Dataset Date Range', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (128, true, false, false, 'Dataset Start Date', '', false, 13, true, 'DATE', 'coverage.Temporal.StartTime', false, 'Start', 'YYYY-MM-DD', 4, 127);
INSERT INTO datasetfieldtype VALUES (129, true, false, false, 'Dataset End Date', '', false, 14, true, 'DATE', 'coverage.Temporal.StopTime', false, 'End', 'YYYY-MM-DD', 4, 127);
INSERT INTO datasetfieldtype VALUES (130, false, false, true, 'The sky coverage of the data object.', '', false, 15, false, 'TEXT', 'coverage.Spatial', false, 'Sky Coverage', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (131, false, false, false, 'The (typical) depth coverage, or sensitivity, of the data object in Jy.', '', false, 16, false, 'FLOAT', 'coverage.Depth', false, 'Depth Coverage', 'Enter a floating-point number.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (132, false, false, false, 'The (typical) density of objects, catalog entries, telescope pointings, etc., on the sky, in number per square degree.', '', false, 17, false, 'FLOAT', 'coverage.ObjectDensity', false, 'Object Density', 'Enter a floating-point number.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (133, false, false, false, 'The total number of objects, catalog entries, etc., in the data object.', '', false, 18, false, 'INT', 'coverage.ObjectCount', false, 'Object Count', 'Enter an integer.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (134, false, false, false, 'The fraction of the sky represented in the observations, ranging from 0 to 1.', '', false, 19, false, 'FLOAT', 'coverage.SkyFraction', false, 'Fraction of Sky', 'Enter a floating-point number.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (135, false, false, false, 'The polarization coverage', '', false, 20, false, 'TEXT', 'coverage.Polarization', false, 'Polarization', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (136, false, false, false, 'RedshiftType string C "Redshift"; or "Optical" or "Radio" definitions of Doppler velocity used in the data object.', '', false, 21, false, 'TEXT', 'redshiftType', false, 'RedshiftType', '', 4, NULL);
INSERT INTO datasetfieldtype VALUES (137, false, false, false, 'The resolution in redshift (unitless) or Doppler velocity (km/s) in the data object.', '', false, 22, false, 'FLOAT', 'resolution.Redshift', false, 'Redshift Resolution', 'Enter a floating-point number.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (138, false, false, true, 'The value of the redshift (unitless) or Doppler velocity (km/s in the data object.', '', false, 23, false, 'FLOAT', 'coverage.RedshiftValue', false, 'Redshift Value', 'Enter a floating-point number.', 4, NULL);
INSERT INTO datasetfieldtype VALUES (139, false, false, false, 'The minimum value of the redshift (unitless) or Doppler velocity (km/s in the data object.', '', false, 24, false, 'FLOAT', 'coverage.Redshift.MinimumValue', false, 'Minimum', 'Enter a floating-point number.', 4, 138);
INSERT INTO datasetfieldtype VALUES (140, false, false, false, 'The maximum value of the redshift (unitless) or Doppler velocity (km/s in the data object.', '', false, 25, false, 'FLOAT', 'coverage.Redshift.MaximumValue', false, 'Maximum', 'Enter a floating-point number.', 4, 138);
INSERT INTO datasetfieldtype VALUES (141, true, true, true, 'Design types that are based on the overall experimental design.', '', false, 0, true, 'TEXT', 'studyDesignType', false, 'Design Type', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (142, true, true, true, 'Factors used in the Dataset. ', '', false, 1, true, 'TEXT', 'studyFactorType', false, 'Factor Type', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (143, true, true, true, 'The taxonomic name of the organism used in the Dataset or from which the  starting biological material derives.', '', false, 2, true, 'TEXT', 'studyAssayOrganism', false, 'Organism', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (144, true, false, true, 'If Other was selected in Organism, list any other organisms that were used in this Dataset. Terms from the NCBI Taxonomy are recommended.', '', false, 3, true, 'TEXT', 'studyAssayOtherOrganism', false, 'Other Organism', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (145, true, true, true, 'A term to qualify the endpoint, or what is being measured (e.g. gene expression profiling; protein identification). ', '', false, 4, true, 'TEXT', 'studyAssayMeasurementType', false, 'Measurement Type', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (146, true, false, true, 'If Other was selected in Measurement Type, list any other measurement types that were used. Terms from NCBO Bioportal are recommended.', '', false, 5, true, 'TEXT', 'studyAssayOtherMeasurmentType', false, 'Other Measurement Type', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (147, true, true, true, 'A term to identify the technology used to perform the measurement (e.g. DNA microarray; mass spectrometry).', '', false, 6, true, 'TEXT', 'studyAssayTechnologyType', false, 'Technology Type', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (148, true, true, true, 'The manufacturer and name of the technology platform used in the assay (e.g. Bruker AVANCE).', '', false, 7, true, 'TEXT', 'studyAssayPlatform', false, 'Technology Platform', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (149, true, true, true, 'The name of the cell line from which the source or sample derives.', '', false, 8, true, 'TEXT', 'studyAssayCellType', false, 'Cell Type', '', 5, NULL);
INSERT INTO datasetfieldtype VALUES (150, false, false, true, 'Indicates the volume, issue and date of a journal, which this Dataset is associated with.', '', false, 0, false, 'NONE', 'journalVolumeIssue', false, 'Journal', '', 6, NULL);
INSERT INTO datasetfieldtype VALUES (204, false, false, false, '', '#VALUE', false, 34, false, 'FLOAT', 'reprocISigmaAll', false, 'I/sigma (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (151, true, false, false, 'The journal volume which this Dataset is associated with (e.g., Volume 4).', '', false, 1, true, 'TEXT', 'journalVolume', false, 'Volume', '', 6, 150);
INSERT INTO datasetfieldtype VALUES (152, true, false, false, 'The journal issue number which this Dataset is associated with (e.g., Number 2, Autumn).', '', false, 2, true, 'TEXT', 'journalIssue', false, 'Issue', '', 6, 150);
INSERT INTO datasetfieldtype VALUES (153, true, false, false, 'The publication date for this journal volume/issue, which this Dataset is associated with (e.g., 1999).', '', false, 3, true, 'DATE', 'journalPubDate', false, 'Publication Date', 'YYYY or YYYY-MM or YYYY-MM-DD', 6, 150);
INSERT INTO datasetfieldtype VALUES (154, true, true, false, 'Indicates what kind of article this is, for example, a research article, a commentary, a book or product review, a case report, a calendar, etc (based on JATS). ', '', false, 4, true, 'TEXT', 'journalArticleType', false, 'Type of Article', '', 6, NULL);
INSERT INTO datasetfieldtype VALUES (155, true, false, false, 'Please provide a short description of your sample, e.g. Human Lin28A in complex with let7-d1 microRNA.', '', true, 0, true, 'TEXT', 'biologicalSample', true, 'Biological Sample', '', 7, NULL);
INSERT INTO datasetfieldtype VALUES (156, true, false, false, 'Please indicate the date this dataset was collected. This information can often be located in image headers, file timestamps, or your lab notebooks. If the exact date is unknown, please provide a best estimate.', '', true, 2, true, 'DATE', 'collectionDate', true, 'Date Collected/Created', 'YYYY-MM-DD', 7, NULL);
INSERT INTO datasetfieldtype VALUES (157, true, true, true, 'Please check all that apply. Include all types of molecules that are present in your sample. Ligands should indicate co-factors, inhibitors, or other biologically relevant small molecules.', '', true, 3, true, 'TEXT', 'subjectComposition', true, 'Subject Composition', '', 7, NULL);
INSERT INTO datasetfieldtype VALUES (158, true, false, false, 'Please provide special instructions for data re-processing, including critical parameters that are inaccurate in image headers, the detector type, additional merging instructions, etc. Some examples of critical information: 1) Beam center, as defined in image headers, needs to be corrected to X=150,Y170; 2) This is a low resolution dataset and needs to be combined with high res datasets to obtain complete coverage; 3) This dataset was indexed in space group P21, and 120 frames were processed with HKL2000 at 3.2A resolution.', '', true, 4, false, 'TEXTBOX', 'reprocessingInstructions', false, 'Reprocessing Instructions', '', 7, NULL);
INSERT INTO datasetfieldtype VALUES (159, true, false, false, 'Name of the site where the data collection was performed.', '', true, 5, true, 'TEXT', 'collectionFacility', true, 'Collection Facility', '', 7, NULL);
INSERT INTO datasetfieldtype VALUES (160, true, false, false, 'Please provide a PDB code for the primary set of coordinates derived from this dataset.', '#VALUE: <a href="http://www.rcsb.org/pdb/explore/explore.do?structureId=#VALUE">PDB</a>, <a href="http://www.ncbi.nlm.nih.gov/Structure/mmdb/mmdbsrv.cgi?uid=#VALUE">MMDB</a>', true, 6, false, 'TEXT', 'refinedStructurePDBCode', false, 'Refined Structure PDB Code', '4-character PDB ID', 7, NULL);
INSERT INTO datasetfieldtype VALUES (161, true, false, false, 'Please provide a comparable PDB code for the primary set of coordinates derived from this dataset.', '#VALUE: <a href="http://www.rcsb.org/pdb/explore/explore.do?structureId=#VALUE">PDB</a>, <a href="http://www.ncbi.nlm.nih.gov/Structure/mmdb/mmdbsrv.cgi?uid=#VALUE">MMDB</a>', true, 6, false, 'TEXT', 'refinedStructurePDBCodeComparable', false, 'Refined Structure PDB Code (Comparable)', '4-character PDB ID', 7, NULL);
INSERT INTO datasetfieldtype VALUES (162, true, false, false, 'Please indicate the diffraction protocol.', '', true, 0, false, 'TEXT', 'diffractionProtocol', false, 'Diffraction Protocol', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (163, true, false, false, 'Please indicate the ambient temperature.', '', true, 1, false, 'TEXT', 'ambientTemp', false, 'Ambient Temperature', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (164, true, false, false, 'Please indicate the wavelength list.', '', true, 2, false, 'TEXT', 'wavelength', false, 'Wavelength List', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (165, true, false, false, 'Please provide any detector details.', '', true, 3, false, 'TEXTBOX', 'detectorDetails', false, 'Detector Details', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (166, true, false, false, 'Please indicate beam source type.', '', true, 4, false, 'TEXT', 'beamSourceType', false, 'Beam Source Type', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (167, true, false, false, 'Please indicate detector type.', '', true, 5, false, 'TEXT', 'detectorType', false, 'Detector Type ', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (168, true, true, false, 'Please indicate synchrotron site.', '', true, 6, false, 'TEXT', 'synchrotronSite', false, 'Synchrotron Site', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (169, true, false, false, 'Please indicate synchrotron beamline.', '', true, 7, false, 'TEXT', 'synchrotronBeamline', false, 'Synchrotron Beamline', '', 8, NULL);
INSERT INTO datasetfieldtype VALUES (170, false, false, true, '', '', true, 0, false, 'NONE', 'reproc', false, 'Reprocessing Data', '', 9, NULL);
INSERT INTO datasetfieldtype VALUES (171, false, false, false, '', '#VALUE', false, 1, false, 'TEXT', 'reprocDataType', false, 'Data type', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (172, false, false, false, '', '#VALUE', false, 2, false, 'TEXT', 'reprocVersion', false, 'Version', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (173, false, false, false, '', '#VALUE', false, 3, false, 'TEXT', 'reprocCommand', false, 'Command', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (174, false, false, false, '', '#VALUE', false, 4, false, 'TEXT', 'reprocProject', false, 'Project', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (175, false, false, false, '', '#VALUE', false, 5, false, 'TEXT', 'reprocCrystal', false, 'Crystal', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (176, false, false, false, '', '#VALUE', false, 6, false, 'INT', 'reprocSequenceLength', false, 'Sequence lenth', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (177, false, false, false, '', '#VALUE', false, 7, false, 'TEXT', 'reprocWavelengthText', false, 'Wavelength text', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (178, false, false, false, '', '#VALUE', false, 8, false, 'FLOAT', 'reprocWavelengthNumber', false, 'Wavelength number', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (179, false, false, false, '', '#VALUE', false, 9, false, 'TEXT', 'reprocSweep', false, 'Sweep', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (180, false, false, false, '', '#VALUE', false, 10, false, 'TEXT', 'reprocFiles', false, 'Files', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (181, false, false, false, '', '#VALUE', false, 11, false, 'INT', 'reprocImagesStart', false, 'Images start', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (182, false, false, false, '', '#VALUE', false, 12, false, 'INT', 'reprocImagesEnd', false, 'Images end', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (183, false, false, false, '', '#VALUE', false, 13, false, 'FLOAT', 'reprocBeamX1', false, 'Beamline X1', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (184, false, false, false, '', '#VALUE', false, 14, false, 'FLOAT', 'reprocBeamY1', false, 'Beamline Y1', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (185, false, false, false, '', '#VALUE', false, 15, false, 'FLOAT', 'reprocBeamX2', false, 'Beamline X2', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (186, false, false, false, '', '#VALUE', false, 16, false, 'FLOAT', 'reprocBeamY2', false, 'Beamline Y2', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (187, false, false, false, '', '#VALUE', false, 17, false, 'FLOAT', 'reprocDistanceStart', false, 'Distance start', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (188, false, false, false, '', '#VALUE', false, 18, false, 'FLOAT', 'reprocDistanceEnd', false, 'Distance end', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (189, false, false, false, '', '#VALUE', false, 19, false, 'DATE', 'reprocDate', false, 'Date', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (190, false, false, false, '', '#VALUE', false, 20, false, 'TEXT', 'reprocTime', false, 'Time', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (191, false, false, false, '', '#VALUE', false, 21, false, 'TEXT', 'reprocForText', false, 'For text', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (192, false, false, false, '', '#VALUE', false, 22, false, 'FLOAT', 'reprocHighResAll', false, 'High resolution (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (193, false, false, false, '', '#VALUE', false, 23, false, 'FLOAT', 'reprocHighResLow', false, 'High resolution (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (194, false, false, false, '', '#VALUE', false, 24, false, 'FLOAT', 'reprocHighResHigh', false, 'High resolution (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (195, false, false, false, '', '#VALUE', false, 25, false, 'FLOAT', 'reprocLowResAll', false, 'Low resolution (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (196, false, false, false, '', '#VALUE', false, 26, false, 'FLOAT', 'reprocLowResLow', false, 'Low resolution (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (197, false, false, false, '', '#VALUE', false, 27, false, 'FLOAT', 'reprocLowResHigh', false, 'Low resolution (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (198, false, false, false, '', '#VALUE', false, 28, false, 'FLOAT', 'reprocCompletenessAll', false, 'Completeness (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (199, false, false, false, '', '#VALUE', false, 29, false, 'FLOAT', 'reprocCompletenessLow', false, 'Completeness (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (200, false, false, false, '', '#VALUE', false, 30, false, 'FLOAT', 'reprocCompletenessHigh', false, 'Completeness (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (201, false, false, false, '', '#VALUE', false, 31, false, 'FLOAT', 'reprocMultiplicityAll', false, 'Multiplicity (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (202, false, false, false, '', '#VALUE', false, 32, false, 'FLOAT', 'reprocMultiplicityLow', false, 'Multiplicity (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (203, false, false, false, '', '#VALUE', false, 33, false, 'FLOAT', 'reprocMultiplicityHigh', false, 'Multiplicity (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (205, false, false, false, '', '#VALUE', false, 35, false, 'FLOAT', 'reprocISigmaLow', false, 'I/sigma (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (206, false, false, false, '', '#VALUE', false, 36, false, 'FLOAT', 'reprocISigmaHigh', false, 'I/sigma (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (207, false, false, false, '', '#VALUE', false, 37, false, 'FLOAT', 'reprocRMergeAll', false, 'Rmerge (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (208, false, false, false, '', '#VALUE', false, 38, false, 'FLOAT', 'reprocRMergeLow', false, 'Rmerge (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (209, false, false, false, '', '#VALUE', false, 39, false, 'FLOAT', 'reprocRMergeHigh', false, 'Rmerge (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (210, false, false, false, '', '#VALUE', false, 40, false, 'FLOAT', 'reprocCCHalfAll', false, 'CC half (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (211, false, false, false, '', '#VALUE', false, 41, false, 'FLOAT', 'reprocCCHalfLow', false, 'CC half (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (212, false, false, false, '', '#VALUE', false, 42, false, 'FLOAT', 'reprocCCHalfHigh', false, 'CC half (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (213, false, false, false, '', '#VALUE', false, 43, false, 'FLOAT', 'reprocAnomalousCompletenessAll', false, 'Anomalous completeness (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (214, false, false, false, '', '#VALUE', false, 44, false, 'FLOAT', 'reprocAnomalousCompletenessLow', false, 'Anomalous completeness (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (215, false, false, false, '', '#VALUE', false, 45, false, 'FLOAT', 'reprocAnomalousCompletenessHigh', false, 'Anomalous completeness (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (216, false, false, false, '', '#VALUE', false, 46, false, 'FLOAT', 'reprocAnomalousMultiplicityAll', false, 'Anomalous multiplicity (All)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (217, false, false, false, '', '#VALUE', false, 47, false, 'FLOAT', 'reprocAnomalousMultiplicityLow', false, 'Anomalous multiplicity (Low)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (218, false, false, false, '', '#VALUE', false, 48, false, 'FLOAT', 'reprocAnomalousMultiplicityHigh', false, 'Anomalous multiplicity (High)', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (219, false, false, false, '', '#VALUE', false, 49, false, 'FLOAT', 'reprocCellLength1', false, 'Cell length 1', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (220, false, false, false, '', '#VALUE', false, 50, false, 'FLOAT', 'reprocCellLength2', false, 'Cell length 2', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (221, false, false, false, '', '#VALUE', false, 51, false, 'FLOAT', 'reprocCellLength3', false, 'Cell length 3', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (222, false, false, false, '', '#VALUE', false, 52, false, 'FLOAT', 'reprocCellAngle1', false, 'Cell angle 1', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (223, false, false, false, '', '#VALUE', false, 53, false, 'FLOAT', 'reprocCellAngle2', false, 'Cell angle 2', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (224, false, false, false, '', '#VALUE', false, 54, false, 'FLOAT', 'reprocCellAngle3', false, 'Cell angle 3', '', 9, 170);
INSERT INTO datasetfieldtype VALUES (225, false, false, false, '', '#VALUE', false, 55, false, 'TEXT', 'reprocSpacegroup', false, 'Spacegroup', '', 9, 170);


--
-- Name: datasetfieldtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetfieldtype_id_seq', 225, true);


--
-- Data for Name: datasetfieldvalue; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetfieldvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetfieldvalue_id_seq', 1, false);


--
-- Data for Name: datasetlinkingdataverse; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetlinkingdataverse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetlinkingdataverse_id_seq', 1, false);


--
-- Data for Name: datasetlock; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetlock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetlock_id_seq', 1, false);


--
-- Data for Name: datasetversion; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetversion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetversion_id_seq', 1, false);


--
-- Data for Name: datasetversionuser; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datasetversionuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datasetversionuser_id_seq', 1, false);


--
-- Data for Name: datatable; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datatable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datatable_id_seq', 1, false);


--
-- Data for Name: datavariable; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: datavariable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('datavariable_id_seq', 1, false);


--
-- Data for Name: dataverse; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO dataverse VALUES (1, NULL, 'root', 'UNCATEGORIZED', 'The root dataverse.', true, false, true, 'Root', true, false, true, 6, NULL, NULL, NULL);


--
-- Data for Name: dataverse_citationdatasetfieldtypes; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: dataverse_metadatablock; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO dataverse_metadatablock VALUES (1, 1);
INSERT INTO dataverse_metadatablock VALUES (1, 8);
INSERT INTO dataverse_metadatablock VALUES (1, 7);
INSERT INTO dataverse_metadatablock VALUES (1, 9);


--
-- Data for Name: dataversecontact; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO dataversecontact VALUES (1, 'root@mailinator.com', 0, 1);


--
-- Name: dataversecontact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dataversecontact_id_seq', 1, true);


--
-- Data for Name: dataversefacet; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO dataversefacet VALUES (1, 2, 21, 1);
INSERT INTO dataversefacet VALUES (2, 1, 19, 1);
INSERT INTO dataversefacet VALUES (3, 0, 8, 1);
INSERT INTO dataversefacet VALUES (4, 3, 57, 1);


--
-- Name: dataversefacet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dataversefacet_id_seq', 4, true);


--
-- Data for Name: dataversefeatureddataverse; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: dataversefeatureddataverse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dataversefeatureddataverse_id_seq', 1, false);


--
-- Data for Name: dataversefieldtypeinputlevel; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: dataversefieldtypeinputlevel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dataversefieldtypeinputlevel_id_seq', 1, false);


--
-- Data for Name: dataverselinkingdataverse; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: dataverselinkingdataverse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dataverselinkingdataverse_id_seq', 1, false);


--
-- Data for Name: dataverserole; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO dataverserole VALUES (1, 'admin', 'A person who has all permissions for dataverses, datasets, and files.', 'Admin', 8191, NULL);
INSERT INTO dataverserole VALUES (2, 'fileDownloader', 'A person who can download a published file.', 'File Downloader', 16, NULL);
INSERT INTO dataverserole VALUES (3, 'fullContributor', 'A person who can add subdataverses and datasets within a dataverse.', 'Dataverse + Dataset Creator', 3, NULL);
INSERT INTO dataverserole VALUES (4, 'dvContributor', 'A person who can add subdataverses within a dataverse.', 'Dataverse Creator', 1, NULL);
INSERT INTO dataverserole VALUES (5, 'dsContributor', 'A person who can add datasets within a dataverse.', 'Dataset Creator', 2, NULL);
INSERT INTO dataverserole VALUES (6, 'editor', 'For datasets, a person who can edit License + Terms, and then submit them for review.', 'Contributor', 4184, NULL);
INSERT INTO dataverserole VALUES (7, 'curator', 'For datasets, a person who can edit License + Terms, edit Permissions, and publish datasets.', 'Curator', 5471, NULL);
INSERT INTO dataverserole VALUES (8, 'member', 'A person who can view both unpublished dataverses and datasets.', 'Member', 28, NULL);


--
-- Name: dataverserole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dataverserole_id_seq', 8, true);


--
-- Data for Name: dataversesubjects; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: dataversetheme; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: dataversetheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dataversetheme_id_seq', 1, false);


--
-- Data for Name: defaultvalueset; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: defaultvalueset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('defaultvalueset_id_seq', 1, false);


--
-- Data for Name: doidataciteregistercache; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: doidataciteregistercache_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('doidataciteregistercache_id_seq', 1, false);


--
-- Data for Name: dvobject; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO dvobject VALUES (1, 'Dataverse', '2016-03-03 15:34:03.07', NULL, '2016-11-17 18:26:33.012', '2016-11-17 18:26:33.079', '2016-03-03 15:34:03.544', false, '2016-11-17 18:26:33.012', 1, NULL, 1);


--
-- Name: dvobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('dvobject_id_seq', 1, true);


--
-- Data for Name: explicitgroup; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: explicitgroup_authenticateduser; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: explicitgroup_containedroleassignees; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: explicitgroup_explicitgroup; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: explicitgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('explicitgroup_id_seq', 1, false);


--
-- Data for Name: fileaccessrequests; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: filemetadata; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: filemetadata_datafilecategory; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: filemetadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('filemetadata_id_seq', 1, false);


--
-- Data for Name: foreignmetadatafieldmapping; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO foreignmetadatafieldmapping VALUES (1, 'title', ':title', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (2, 'otherIdValue', ':identifier', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (3, 'authorName', ':creator', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (4, 'productionDate', ':date', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (5, 'keywordValue', ':subject', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (6, 'dsDescriptionValue', ':description', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (7, 'relatedMaterial', ':relation', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (8, 'publicationCitation', ':isReferencedBy', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (9, 'publicationURL', 'holdingsURI', true, 1, 8);
INSERT INTO foreignmetadatafieldmapping VALUES (10, 'publicationIDType', 'agency', true, 1, 8);
INSERT INTO foreignmetadatafieldmapping VALUES (11, 'publicationIDNumber', 'IDNo', true, 1, 8);
INSERT INTO foreignmetadatafieldmapping VALUES (12, 'otherGeographicCoverage', ':coverage', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (13, 'kindOfData', ':type', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (14, 'dataSources', ':source', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (15, 'authorAffiliation', 'affiliation', true, 1, 3);
INSERT INTO foreignmetadatafieldmapping VALUES (16, 'contributorName', ':contributor', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (17, 'contributorType', 'type', true, 1, 16);
INSERT INTO foreignmetadatafieldmapping VALUES (18, 'producerName', ':publisher', false, 1, NULL);
INSERT INTO foreignmetadatafieldmapping VALUES (19, 'language', ':language', false, 1, NULL);


--
-- Name: foreignmetadatafieldmapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('foreignmetadatafieldmapping_id_seq', 1, false);


--
-- Data for Name: foreignmetadataformatmapping; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO foreignmetadataformatmapping VALUES (1, 'dcterms: DCMI Metadata Terms', 'http://purl.org/dc/terms/', 'http://dublincore.org/schemas/xmls/qdc/dcterms.xsd', 'entry');


--
-- Name: foreignmetadataformatmapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('foreignmetadataformatmapping_id_seq', 1, false);


--
-- Data for Name: guestbook; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO guestbook VALUES (1, '2016-03-03 15:06:36.842274', false, true, false, 'Default', false, false, NULL);


--
-- Name: guestbook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('guestbook_id_seq', 1, true);


--
-- Data for Name: guestbookresponse; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: guestbookresponse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('guestbookresponse_id_seq', 1, false);


--
-- Data for Name: harvestingclient; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: harvestingclient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('harvestingclient_id_seq', 1, false);


--
-- Data for Name: harvestingdataverseconfig; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: ingestreport; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: ingestreport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('ingestreport_id_seq', 1, false);


--
-- Data for Name: ingestrequest; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: ingestrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('ingestrequest_id_seq', 1, false);


--
-- Data for Name: ipv4range; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: ipv6range; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: maplayermetadata; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: maplayermetadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('maplayermetadata_id_seq', 1, false);


--
-- Data for Name: metadatablock; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO metadatablock VALUES (1, 'Citation Metadata', 'citation', NULL);
INSERT INTO metadatablock VALUES (2, 'Geospatial Metadata', 'geospatial', NULL);
INSERT INTO metadatablock VALUES (3, 'Social Science and Humanities Metadata', 'socialscience', NULL);
INSERT INTO metadatablock VALUES (4, 'Astronomy and Astrophysics Metadata', 'astrophysics', NULL);
INSERT INTO metadatablock VALUES (5, 'Life Sciences Metadata', 'biomedical', NULL);
INSERT INTO metadatablock VALUES (6, 'Journal Metadata', 'journal', NULL);
INSERT INTO metadatablock VALUES (7, 'Structural Biology Metadata', 'sbgrid', NULL);
INSERT INTO metadatablock VALUES (8, 'X-Ray Diffraction Experiment', 'diffractionExperiment', NULL);
INSERT INTO metadatablock VALUES (9, 'Reprocessing Data', 'sbgridReproc', NULL);


--
-- Name: metadatablock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('metadatablock_id_seq', 9, true);


--
-- Data for Name: oairecord; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: oairecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('oairecord_id_seq', 1, false);


--
-- Data for Name: oaiset; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: oaiset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('oaiset_id_seq', 1, false);


--
-- Data for Name: passwordresetdata; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: passwordresetdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('passwordresetdata_id_seq', 1, false);


--
-- Data for Name: persistedglobalgroup; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Data for Name: roleassignment; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO roleassignment VALUES (1, '@dataverseAdmin', 1, 1, NULL);


--
-- Name: roleassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('roleassignment_id_seq', 1, true);


--
-- Data for Name: savedsearch; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: savedsearch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('savedsearch_id_seq', 1, false);


--
-- Data for Name: savedsearchfilterquery; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: savedsearchfilterquery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('savedsearchfilterquery_id_seq', 1, false);


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO sequence VALUES ('SEQ_GEN', 0);


--
-- Data for Name: setting; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO setting VALUES (':AllowSignUp', 'yes');
INSERT INTO setting VALUES (':SignUpUrl', '/dataverseuser.xhtml?editMode=CREATE');
INSERT INTO setting VALUES (':Protocol', 'doi');
INSERT INTO setting VALUES (':Authority', '10.5072/FK2');
INSERT INTO setting VALUES (':DoiProvider', 'EZID');
INSERT INTO setting VALUES (':DoiSeparator', '/');
INSERT INTO setting VALUES ('BuiltinUsers.KEY', 'burrito');
INSERT INTO setting VALUES (':BlockedApiKey', 'empanada');
INSERT INTO setting VALUES (':BlockedApiPolicy', 'localhost-only');


--
-- Data for Name: shibgroup; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: shibgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('shibgroup_id_seq', 1, false);


--
-- Data for Name: summarystatistic; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: summarystatistic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('summarystatistic_id_seq', 1, false);


--
-- Data for Name: template; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('template_id_seq', 1, false);


--
-- Data for Name: termsofuseandaccess; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: termsofuseandaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('termsofuseandaccess_id_seq', 1, false);


--
-- Data for Name: usernotification; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO usernotification VALUES (1, false, NULL, true, '2016-03-03 15:45:16.929', 4, 1);
INSERT INTO usernotification VALUES (2, false, 1, false, '2016-11-17 18:26:32.907', 0, 1);


--
-- Name: usernotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('usernotification_id_seq', 2, true);


--
-- Data for Name: variablecategory; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: variablecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('variablecategory_id_seq', 1, false);


--
-- Data for Name: variablerange; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: variablerange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('variablerange_id_seq', 1, false);


--
-- Data for Name: variablerangeitem; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: variablerangeitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('variablerangeitem_id_seq', 1, false);


--
-- Data for Name: worldmapauth_token; Type: TABLE DATA; Schema: public; Owner: dvnapp
--



--
-- Name: worldmapauth_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('worldmapauth_token_id_seq', 1, false);


--
-- Data for Name: worldmapauth_tokentype; Type: TABLE DATA; Schema: public; Owner: dvnapp
--

INSERT INTO worldmapauth_tokentype VALUES (1, 'support@dataverse.org', '2016-03-03 15:06:36.877159', 'geoconnect.datascience.iq.harvard.edu', '140.247.115.127', 'http://geoconnect.datascience.iq.harvard.edu/shapefile/map-it', '38c0a931b2d582a5c43fc79405b30c22', '2016-03-03 15:06:36.877159', 'GEOCONNECT', 30, 1800);


--
-- Name: worldmapauth_tokentype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dvnapp
--

SELECT pg_catalog.setval('worldmapauth_tokentype_id_seq', 1, true);


--
-- Name: EJB__TIMER__TBL_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY "EJB__TIMER__TBL"
ADD CONSTRAINT "EJB__TIMER__TBL_pkey" PRIMARY KEY ("TIMERID");


--
-- Name: actionlogrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY actionlogrecord
ADD CONSTRAINT actionlogrecord_pkey PRIMARY KEY (id);


--
-- Name: apitoken_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY apitoken
ADD CONSTRAINT apitoken_pkey PRIMARY KEY (id);


--
-- Name: apitoken_tokenstring_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY apitoken
ADD CONSTRAINT apitoken_tokenstring_key UNIQUE (tokenstring);


--
-- Name: authenticateduser_email_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY authenticateduser
ADD CONSTRAINT authenticateduser_email_key UNIQUE (email);


--
-- Name: authenticateduser_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY authenticateduser
ADD CONSTRAINT authenticateduser_pkey PRIMARY KEY (id);


--
-- Name: authenticateduser_useridentifier_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY authenticateduser
ADD CONSTRAINT authenticateduser_useridentifier_key UNIQUE (useridentifier);


--
-- Name: authenticateduserlookup_authenticateduser_id_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY authenticateduserlookup
ADD CONSTRAINT authenticateduserlookup_authenticateduser_id_key UNIQUE (authenticateduser_id);


--
-- Name: authenticateduserlookup_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY authenticateduserlookup
ADD CONSTRAINT authenticateduserlookup_pkey PRIMARY KEY (id);


--
-- Name: authenticationproviderrow_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY authenticationproviderrow
ADD CONSTRAINT authenticationproviderrow_pkey PRIMARY KEY (id);


--
-- Name: builtinuser_email_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY builtinuser
ADD CONSTRAINT builtinuser_email_key UNIQUE (email);


--
-- Name: builtinuser_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY builtinuser
ADD CONSTRAINT builtinuser_pkey PRIMARY KEY (id);


--
-- Name: builtinuser_username_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY builtinuser
ADD CONSTRAINT builtinuser_username_key UNIQUE (username);


--
-- Name: clientharvestrun_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY clientharvestrun
ADD CONSTRAINT clientharvestrun_pkey PRIMARY KEY (id);


--
-- Name: confirmemaildata_authenticateduser_id_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY confirmemaildata
ADD CONSTRAINT confirmemaildata_authenticateduser_id_key UNIQUE (authenticateduser_id);


--
-- Name: confirmemaildata_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY confirmemaildata
ADD CONSTRAINT confirmemaildata_pkey PRIMARY KEY (id);


--
-- Name: controlledvocabalternate_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY controlledvocabalternate
ADD CONSTRAINT controlledvocabalternate_pkey PRIMARY KEY (id);


--
-- Name: controlledvocabularyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY controlledvocabularyvalue
ADD CONSTRAINT controlledvocabularyvalue_pkey PRIMARY KEY (id);


--
-- Name: customfieldmap_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY customfieldmap
ADD CONSTRAINT customfieldmap_pkey PRIMARY KEY (id);


--
-- Name: customquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY customquestion
ADD CONSTRAINT customquestion_pkey PRIMARY KEY (id);


--
-- Name: customquestionresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY customquestionresponse
ADD CONSTRAINT customquestionresponse_pkey PRIMARY KEY (id);


--
-- Name: customquestionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY customquestionvalue
ADD CONSTRAINT customquestionvalue_pkey PRIMARY KEY (id);


--
-- Name: datafile_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datafile
ADD CONSTRAINT datafile_pkey PRIMARY KEY (id);


--
-- Name: datafilecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datafilecategory
ADD CONSTRAINT datafilecategory_pkey PRIMARY KEY (id);


--
-- Name: datafiletag_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datafiletag
ADD CONSTRAINT datafiletag_pkey PRIMARY KEY (id);


--
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataset
ADD CONSTRAINT dataset_pkey PRIMARY KEY (id);


--
-- Name: datasetfield_controlledvocabularyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetfield_controlledvocabularyvalue
ADD CONSTRAINT datasetfield_controlledvocabularyvalue_pkey PRIMARY KEY (datasetfield_id, controlledvocabularyvalues_id);


--
-- Name: datasetfield_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetfield
ADD CONSTRAINT datasetfield_pkey PRIMARY KEY (id);


--
-- Name: datasetfieldcompoundvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetfieldcompoundvalue
ADD CONSTRAINT datasetfieldcompoundvalue_pkey PRIMARY KEY (id);


--
-- Name: datasetfielddefaultvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetfielddefaultvalue
ADD CONSTRAINT datasetfielddefaultvalue_pkey PRIMARY KEY (id);


--
-- Name: datasetfieldtype_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetfieldtype
ADD CONSTRAINT datasetfieldtype_pkey PRIMARY KEY (id);


--
-- Name: datasetfieldvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetfieldvalue
ADD CONSTRAINT datasetfieldvalue_pkey PRIMARY KEY (id);


--
-- Name: datasetlinkingdataverse_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetlinkingdataverse
ADD CONSTRAINT datasetlinkingdataverse_pkey PRIMARY KEY (id);


--
-- Name: datasetlock_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetlock
ADD CONSTRAINT datasetlock_pkey PRIMARY KEY (id);


--
-- Name: datasetversion_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetversion
ADD CONSTRAINT datasetversion_pkey PRIMARY KEY (id);


--
-- Name: datasetversionuser_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetversionuser
ADD CONSTRAINT datasetversionuser_pkey PRIMARY KEY (id);


--
-- Name: datatable_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datatable
ADD CONSTRAINT datatable_pkey PRIMARY KEY (id);


--
-- Name: datavariable_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datavariable
ADD CONSTRAINT datavariable_pkey PRIMARY KEY (id);


--
-- Name: dataverse_alias_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataverse
ADD CONSTRAINT dataverse_alias_key UNIQUE (alias);


--
-- Name: dataverse_citationdatasetfieldtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataverse_citationdatasetfieldtypes
ADD CONSTRAINT dataverse_citationdatasetfieldtypes_pkey PRIMARY KEY (dataverse_id, citationdatasetfieldtype_id);


--
-- Name: dataverse_metadatablock_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataverse_metadatablock
ADD CONSTRAINT dataverse_metadatablock_pkey PRIMARY KEY (dataverse_id, metadatablocks_id);


--
-- Name: dataverse_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataverse
ADD CONSTRAINT dataverse_pkey PRIMARY KEY (id);


--
-- Name: dataversecontact_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataversecontact
ADD CONSTRAINT dataversecontact_pkey PRIMARY KEY (id);


--
-- Name: dataversefacet_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataversefacet
ADD CONSTRAINT dataversefacet_pkey PRIMARY KEY (id);


--
-- Name: dataversefeatureddataverse_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataversefeatureddataverse
ADD CONSTRAINT dataversefeatureddataverse_pkey PRIMARY KEY (id);


--
-- Name: dataversefieldtypeinputlevel_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataversefieldtypeinputlevel
ADD CONSTRAINT dataversefieldtypeinputlevel_pkey PRIMARY KEY (id);


--
-- Name: dataverselinkingdataverse_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataverselinkingdataverse
ADD CONSTRAINT dataverselinkingdataverse_pkey PRIMARY KEY (id);


--
-- Name: dataverserole_alias_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataverserole
ADD CONSTRAINT dataverserole_alias_key UNIQUE (alias);


--
-- Name: dataverserole_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataverserole
ADD CONSTRAINT dataverserole_pkey PRIMARY KEY (id);


--
-- Name: dataversesubjects_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataversesubjects
ADD CONSTRAINT dataversesubjects_pkey PRIMARY KEY (dataverse_id, controlledvocabularyvalue_id);


--
-- Name: dataversetheme_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataversetheme
ADD CONSTRAINT dataversetheme_pkey PRIMARY KEY (id);


--
-- Name: defaultvalueset_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY defaultvalueset
ADD CONSTRAINT defaultvalueset_pkey PRIMARY KEY (id);


--
-- Name: dvobject_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dvobject
ADD CONSTRAINT dvobject_pkey PRIMARY KEY (id);


--
-- Name: explicitgroup_authenticateduser_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY explicitgroup_authenticateduser
ADD CONSTRAINT explicitgroup_authenticateduser_pkey PRIMARY KEY (explicitgroup_id, containedauthenticatedusers_id);


--
-- Name: explicitgroup_explicitgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY explicitgroup_explicitgroup
ADD CONSTRAINT explicitgroup_explicitgroup_pkey PRIMARY KEY (explicitgroup_id, containedexplicitgroups_id);


--
-- Name: explicitgroup_groupalias_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY explicitgroup
ADD CONSTRAINT explicitgroup_groupalias_key UNIQUE (groupalias);


--
-- Name: explicitgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY explicitgroup
ADD CONSTRAINT explicitgroup_pkey PRIMARY KEY (id);


--
-- Name: fileaccessrequests_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY fileaccessrequests
ADD CONSTRAINT fileaccessrequests_pkey PRIMARY KEY (datafile_id, authenticated_user_id);


--
-- Name: filemetadata_datafilecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY filemetadata_datafilecategory
ADD CONSTRAINT filemetadata_datafilecategory_pkey PRIMARY KEY (filecategories_id, filemetadatas_id);


--
-- Name: filemetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY filemetadata
ADD CONSTRAINT filemetadata_pkey PRIMARY KEY (id);


--
-- Name: foreignmetadatafieldmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY foreignmetadatafieldmapping
ADD CONSTRAINT foreignmetadatafieldmapping_pkey PRIMARY KEY (id);


--
-- Name: foreignmetadataformatmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY foreignmetadataformatmapping
ADD CONSTRAINT foreignmetadataformatmapping_pkey PRIMARY KEY (id);


--
-- Name: guestbook_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY guestbook
ADD CONSTRAINT guestbook_pkey PRIMARY KEY (id);


--
-- Name: guestbookresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY guestbookresponse
ADD CONSTRAINT guestbookresponse_pkey PRIMARY KEY (id);


--
-- Name: harvestingclient_name_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY harvestingclient
ADD CONSTRAINT harvestingclient_name_key UNIQUE (name);


--
-- Name: harvestingclient_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY harvestingclient
ADD CONSTRAINT harvestingclient_pkey PRIMARY KEY (id);


--
-- Name: harvestingdataverseconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY harvestingdataverseconfig
ADD CONSTRAINT harvestingdataverseconfig_pkey PRIMARY KEY (id);


--
-- Name: ingestreport_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY ingestreport
ADD CONSTRAINT ingestreport_pkey PRIMARY KEY (id);


--
-- Name: ingestrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY ingestrequest
ADD CONSTRAINT ingestrequest_pkey PRIMARY KEY (id);


--
-- Name: ipv4range_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY ipv4range
ADD CONSTRAINT ipv4range_pkey PRIMARY KEY (id);


--
-- Name: ipv6range_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY ipv6range
ADD CONSTRAINT ipv6range_pkey PRIMARY KEY (id);


--
-- Name: maplayermetadata_datafile_id_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY maplayermetadata
ADD CONSTRAINT maplayermetadata_datafile_id_key UNIQUE (datafile_id);


--
-- Name: maplayermetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY maplayermetadata
ADD CONSTRAINT maplayermetadata_pkey PRIMARY KEY (id);


--
-- Name: metadatablock_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY metadatablock
ADD CONSTRAINT metadatablock_pkey PRIMARY KEY (id);


--
-- Name: oairecord_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY oairecord
ADD CONSTRAINT oairecord_pkey PRIMARY KEY (id);


--
-- Name: oaiset_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY oaiset
ADD CONSTRAINT oaiset_pkey PRIMARY KEY (id);


--
-- Name: passwordresetdata_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY passwordresetdata
ADD CONSTRAINT passwordresetdata_pkey PRIMARY KEY (id);


--
-- Name: persistedglobalgroup_persistedgroupalias_key; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY persistedglobalgroup
ADD CONSTRAINT persistedglobalgroup_persistedgroupalias_key UNIQUE (persistedgroupalias);


--
-- Name: persistedglobalgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY persistedglobalgroup
ADD CONSTRAINT persistedglobalgroup_pkey PRIMARY KEY (id);


--
-- Name: roleassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY roleassignment
ADD CONSTRAINT roleassignment_pkey PRIMARY KEY (id);


--
-- Name: savedsearch_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY savedsearch
ADD CONSTRAINT savedsearch_pkey PRIMARY KEY (id);


--
-- Name: savedsearchfilterquery_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY savedsearchfilterquery
ADD CONSTRAINT savedsearchfilterquery_pkey PRIMARY KEY (id);


--
-- Name: sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY sequence
ADD CONSTRAINT sequence_pkey PRIMARY KEY (seq_name);


--
-- Name: setting_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY setting
ADD CONSTRAINT setting_pkey PRIMARY KEY (name);


--
-- Name: shibgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY shibgroup
ADD CONSTRAINT shibgroup_pkey PRIMARY KEY (id);


--
-- Name: summarystatistic_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY summarystatistic
ADD CONSTRAINT summarystatistic_pkey PRIMARY KEY (id);


--
-- Name: template_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY template
ADD CONSTRAINT template_pkey PRIMARY KEY (id);


--
-- Name: termsofuseandaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY termsofuseandaccess
ADD CONSTRAINT termsofuseandaccess_pkey PRIMARY KEY (id);


--
-- Name: unq_authenticateduserlookup_0; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY authenticateduserlookup
ADD CONSTRAINT unq_authenticateduserlookup_0 UNIQUE (persistentuserid, authenticationproviderid);


--
-- Name: unq_dataset_0; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataset
ADD CONSTRAINT unq_dataset_0 UNIQUE (authority, protocol, identifier, doiseparator);


--
-- Name: unq_datasetversion_0; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY datasetversion
ADD CONSTRAINT unq_datasetversion_0 UNIQUE (dataset_id, versionnumber, minorversionnumber);


--
-- Name: unq_dataversefieldtypeinputlevel_0; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY dataversefieldtypeinputlevel
ADD CONSTRAINT unq_dataversefieldtypeinputlevel_0 UNIQUE (dataverse_id, datasetfieldtype_id);


--
-- Name: unq_foreignmetadatafieldmapping_0; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY foreignmetadatafieldmapping
ADD CONSTRAINT unq_foreignmetadatafieldmapping_0 UNIQUE (foreignmetadataformatmapping_id, foreignfieldxpath);


--
-- Name: unq_roleassignment_0; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY roleassignment
ADD CONSTRAINT unq_roleassignment_0 UNIQUE (assigneeidentifier, role_id, definitionpoint_id);


--
-- Name: usernotification_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY usernotification
ADD CONSTRAINT usernotification_pkey PRIMARY KEY (id);


--
-- Name: variablecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY variablecategory
ADD CONSTRAINT variablecategory_pkey PRIMARY KEY (id);


--
-- Name: variablerange_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY variablerange
ADD CONSTRAINT variablerange_pkey PRIMARY KEY (id);


--
-- Name: variablerangeitem_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY variablerangeitem
ADD CONSTRAINT variablerangeitem_pkey PRIMARY KEY (id);


--
-- Name: worldmapauth_token_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY worldmapauth_token
ADD CONSTRAINT worldmapauth_token_pkey PRIMARY KEY (id);


--
-- Name: worldmapauth_tokentype_pkey; Type: CONSTRAINT; Schema: public; Owner: dvnapp; Tablespace: 
--

ALTER TABLE ONLY worldmapauth_tokentype
ADD CONSTRAINT worldmapauth_tokentype_pkey PRIMARY KEY (id);


--
-- Name: application_name; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE UNIQUE INDEX application_name ON worldmapauth_tokentype USING btree (name);


--
-- Name: dataverse_alias_unique_idx; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE UNIQUE INDEX dataverse_alias_unique_idx ON dataverse USING btree (lower((alias)::text));


--
-- Name: index_actionlogrecord_actiontype; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_actionlogrecord_actiontype ON actionlogrecord USING btree (actiontype);


--
-- Name: index_actionlogrecord_starttime; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_actionlogrecord_starttime ON actionlogrecord USING btree (starttime);


--
-- Name: index_actionlogrecord_useridentifier; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_actionlogrecord_useridentifier ON actionlogrecord USING btree (useridentifier);


--
-- Name: index_apitoken_authenticateduser_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_apitoken_authenticateduser_id ON apitoken USING btree (authenticateduser_id);


--
-- Name: index_authenticateduser_lower_email; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE UNIQUE INDEX index_authenticateduser_lower_email ON authenticateduser USING btree (lower((email)::text));


--
-- Name: index_authenticationproviderrow_enabled; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_authenticationproviderrow_enabled ON authenticationproviderrow USING btree (enabled);


--
-- Name: index_builtinuser_lastname; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_builtinuser_lastname ON builtinuser USING btree (lastname);


--
-- Name: index_builtinuser_lower_email; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE UNIQUE INDEX index_builtinuser_lower_email ON builtinuser USING btree (lower((email)::text));


--
-- Name: index_confirmemaildata_authenticateduser_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_confirmemaildata_authenticateduser_id ON confirmemaildata USING btree (authenticateduser_id);


--
-- Name: index_confirmemaildata_token; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_confirmemaildata_token ON confirmemaildata USING btree (token);


--
-- Name: index_controlledvocabalternate_controlledvocabularyvalue_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_controlledvocabalternate_controlledvocabularyvalue_id ON controlledvocabalternate USING btree (controlledvocabularyvalue_id);


--
-- Name: index_controlledvocabalternate_datasetfieldtype_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_controlledvocabalternate_datasetfieldtype_id ON controlledvocabalternate USING btree (datasetfieldtype_id);


--
-- Name: index_controlledvocabularyvalue_datasetfieldtype_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_controlledvocabularyvalue_datasetfieldtype_id ON controlledvocabularyvalue USING btree (datasetfieldtype_id);


--
-- Name: index_controlledvocabularyvalue_displayorder; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_controlledvocabularyvalue_displayorder ON controlledvocabularyvalue USING btree (displayorder);


--
-- Name: index_customfieldmap_sourcedatasetfield; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_customfieldmap_sourcedatasetfield ON customfieldmap USING btree (sourcedatasetfield);


--
-- Name: index_customfieldmap_sourcetemplate; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_customfieldmap_sourcetemplate ON customfieldmap USING btree (sourcetemplate);


--
-- Name: index_customquestion_guestbook_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_customquestion_guestbook_id ON customquestion USING btree (guestbook_id);


--
-- Name: index_customquestionresponse_guestbookresponse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_customquestionresponse_guestbookresponse_id ON customquestionresponse USING btree (guestbookresponse_id);


--
-- Name: index_datafile_contenttype; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datafile_contenttype ON datafile USING btree (contenttype);


--
-- Name: index_datafile_ingeststatus; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datafile_ingeststatus ON datafile USING btree (ingeststatus);


--
-- Name: index_datafile_md5; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datafile_md5 ON datafile USING btree (checksumvalue);


--
-- Name: index_datafile_restricted; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datafile_restricted ON datafile USING btree (restricted);


--
-- Name: index_datafilecategory_dataset_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datafilecategory_dataset_id ON datafilecategory USING btree (dataset_id);


--
-- Name: index_datafiletag_datafile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datafiletag_datafile_id ON datafiletag USING btree (datafile_id);


--
-- Name: index_dataset_guestbook_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataset_guestbook_id ON dataset USING btree (guestbook_id);


--
-- Name: index_dataset_thumbnailfile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataset_thumbnailfile_id ON dataset USING btree (thumbnailfile_id);


--
-- Name: index_datasetfield_controlledvocabularyvalue_controlledvocabula; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfield_controlledvocabularyvalue_controlledvocabula ON datasetfield_controlledvocabularyvalue USING btree (controlledvocabularyvalues_id);


--
-- Name: index_datasetfield_controlledvocabularyvalue_datasetfield_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfield_controlledvocabularyvalue_datasetfield_id ON datasetfield_controlledvocabularyvalue USING btree (datasetfield_id);


--
-- Name: index_datasetfield_datasetfieldtype_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfield_datasetfieldtype_id ON datasetfield USING btree (datasetfieldtype_id);


--
-- Name: index_datasetfield_datasetversion_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfield_datasetversion_id ON datasetfield USING btree (datasetversion_id);


--
-- Name: index_datasetfield_parentdatasetfieldcompoundvalue_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfield_parentdatasetfieldcompoundvalue_id ON datasetfield USING btree (parentdatasetfieldcompoundvalue_id);


--
-- Name: index_datasetfield_template_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfield_template_id ON datasetfield USING btree (template_id);


--
-- Name: index_datasetfieldcompoundvalue_parentdatasetfield_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfieldcompoundvalue_parentdatasetfield_id ON datasetfieldcompoundvalue USING btree (parentdatasetfield_id);


--
-- Name: index_datasetfielddefaultvalue_datasetfield_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfielddefaultvalue_datasetfield_id ON datasetfielddefaultvalue USING btree (datasetfield_id);


--
-- Name: index_datasetfielddefaultvalue_defaultvalueset_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfielddefaultvalue_defaultvalueset_id ON datasetfielddefaultvalue USING btree (defaultvalueset_id);


--
-- Name: index_datasetfielddefaultvalue_displayorder; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfielddefaultvalue_displayorder ON datasetfielddefaultvalue USING btree (displayorder);


--
-- Name: index_datasetfielddefaultvalue_parentdatasetfielddefaultvalue_i; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfielddefaultvalue_parentdatasetfielddefaultvalue_i ON datasetfielddefaultvalue USING btree (parentdatasetfielddefaultvalue_id);


--
-- Name: index_datasetfieldtype_metadatablock_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfieldtype_metadatablock_id ON datasetfieldtype USING btree (metadatablock_id);


--
-- Name: index_datasetfieldtype_parentdatasetfieldtype_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfieldtype_parentdatasetfieldtype_id ON datasetfieldtype USING btree (parentdatasetfieldtype_id);


--
-- Name: index_datasetfieldvalue_datasetfield_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetfieldvalue_datasetfield_id ON datasetfieldvalue USING btree (datasetfield_id);


--
-- Name: index_datasetlinkingdataverse_dataset_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetlinkingdataverse_dataset_id ON datasetlinkingdataverse USING btree (dataset_id);


--
-- Name: index_datasetlinkingdataverse_linkingdataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetlinkingdataverse_linkingdataverse_id ON datasetlinkingdataverse USING btree (linkingdataverse_id);


--
-- Name: index_datasetlock_dataset_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetlock_dataset_id ON datasetlock USING btree (dataset_id);


--
-- Name: index_datasetlock_user_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetlock_user_id ON datasetlock USING btree (user_id);


--
-- Name: index_datasetversion_dataset_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetversion_dataset_id ON datasetversion USING btree (dataset_id);


--
-- Name: index_datasetversionuser_authenticateduser_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetversionuser_authenticateduser_id ON datasetversionuser USING btree (authenticateduser_id);


--
-- Name: index_datasetversionuser_datasetversion_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datasetversionuser_datasetversion_id ON datasetversionuser USING btree (datasetversion_id);


--
-- Name: index_datatable_datafile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datatable_datafile_id ON datatable USING btree (datafile_id);


--
-- Name: index_datavariable_datatable_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_datavariable_datatable_id ON datavariable USING btree (datatable_id);


--
-- Name: index_dataverse_affiliation; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_affiliation ON dataverse USING btree (affiliation);


--
-- Name: index_dataverse_alias; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_alias ON dataverse USING btree (alias);


--
-- Name: index_dataverse_dataversetype; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_dataversetype ON dataverse USING btree (dataversetype);


--
-- Name: index_dataverse_defaultcontributorrole_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_defaultcontributorrole_id ON dataverse USING btree (defaultcontributorrole_id);


--
-- Name: index_dataverse_defaulttemplate_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_defaulttemplate_id ON dataverse USING btree (defaulttemplate_id);


--
-- Name: index_dataverse_facetroot; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_facetroot ON dataverse USING btree (facetroot);


--
-- Name: index_dataverse_guestbookroot; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_guestbookroot ON dataverse USING btree (guestbookroot);


--
-- Name: index_dataverse_metadatablockroot; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_metadatablockroot ON dataverse USING btree (metadatablockroot);


--
-- Name: index_dataverse_permissionroot; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_permissionroot ON dataverse USING btree (permissionroot);


--
-- Name: index_dataverse_templateroot; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_templateroot ON dataverse USING btree (templateroot);


--
-- Name: index_dataverse_themeroot; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverse_themeroot ON dataverse USING btree (themeroot);


--
-- Name: index_dataversecontact_contactemail; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversecontact_contactemail ON dataversecontact USING btree (contactemail);


--
-- Name: index_dataversecontact_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversecontact_dataverse_id ON dataversecontact USING btree (dataverse_id);


--
-- Name: index_dataversecontact_displayorder; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversecontact_displayorder ON dataversecontact USING btree (displayorder);


--
-- Name: index_dataversefacet_datasetfieldtype_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefacet_datasetfieldtype_id ON dataversefacet USING btree (datasetfieldtype_id);


--
-- Name: index_dataversefacet_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefacet_dataverse_id ON dataversefacet USING btree (dataverse_id);


--
-- Name: index_dataversefacet_displayorder; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefacet_displayorder ON dataversefacet USING btree (displayorder);


--
-- Name: index_dataversefeatureddataverse_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefeatureddataverse_dataverse_id ON dataversefeatureddataverse USING btree (dataverse_id);


--
-- Name: index_dataversefeatureddataverse_displayorder; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefeatureddataverse_displayorder ON dataversefeatureddataverse USING btree (displayorder);


--
-- Name: index_dataversefeatureddataverse_featureddataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefeatureddataverse_featureddataverse_id ON dataversefeatureddataverse USING btree (featureddataverse_id);


--
-- Name: index_dataversefieldtypeinputlevel_datasetfieldtype_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefieldtypeinputlevel_datasetfieldtype_id ON dataversefieldtypeinputlevel USING btree (datasetfieldtype_id);


--
-- Name: index_dataversefieldtypeinputlevel_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefieldtypeinputlevel_dataverse_id ON dataversefieldtypeinputlevel USING btree (dataverse_id);


--
-- Name: index_dataversefieldtypeinputlevel_required; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversefieldtypeinputlevel_required ON dataversefieldtypeinputlevel USING btree (required);


--
-- Name: index_dataverselinkingdataverse_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverselinkingdataverse_dataverse_id ON dataverselinkingdataverse USING btree (dataverse_id);


--
-- Name: index_dataverselinkingdataverse_linkingdataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverselinkingdataverse_linkingdataverse_id ON dataverselinkingdataverse USING btree (linkingdataverse_id);


--
-- Name: index_dataverserole_alias; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverserole_alias ON dataverserole USING btree (alias);


--
-- Name: index_dataverserole_name; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverserole_name ON dataverserole USING btree (name);


--
-- Name: index_dataverserole_owner_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataverserole_owner_id ON dataverserole USING btree (owner_id);


--
-- Name: index_dataversetheme_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dataversetheme_dataverse_id ON dataversetheme USING btree (dataverse_id);


--
-- Name: index_dvobject_creator_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dvobject_creator_id ON dvobject USING btree (creator_id);


--
-- Name: index_dvobject_dtype; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dvobject_dtype ON dvobject USING btree (dtype);


--
-- Name: index_dvobject_owner_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dvobject_owner_id ON dvobject USING btree (owner_id);


--
-- Name: index_dvobject_releaseuser_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_dvobject_releaseuser_id ON dvobject USING btree (releaseuser_id);


--
-- Name: index_explicitgroup_groupaliasinowner; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_explicitgroup_groupaliasinowner ON explicitgroup USING btree (groupaliasinowner);


--
-- Name: index_explicitgroup_owner_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_explicitgroup_owner_id ON explicitgroup USING btree (owner_id);


--
-- Name: index_filemetadata_datafile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_filemetadata_datafile_id ON filemetadata USING btree (datafile_id);


--
-- Name: index_filemetadata_datafilecategory_filecategories_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_filemetadata_datafilecategory_filecategories_id ON filemetadata_datafilecategory USING btree (filecategories_id);


--
-- Name: index_filemetadata_datafilecategory_filemetadatas_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_filemetadata_datafilecategory_filemetadatas_id ON filemetadata_datafilecategory USING btree (filemetadatas_id);


--
-- Name: index_filemetadata_datasetversion_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_filemetadata_datasetversion_id ON filemetadata USING btree (datasetversion_id);


--
-- Name: index_foreignmetadatafieldmapping_foreignfieldxpath; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_foreignmetadatafieldmapping_foreignfieldxpath ON foreignmetadatafieldmapping USING btree (foreignfieldxpath);


--
-- Name: index_foreignmetadatafieldmapping_foreignmetadataformatmapping_; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_foreignmetadatafieldmapping_foreignmetadataformatmapping_ ON foreignmetadatafieldmapping USING btree (foreignmetadataformatmapping_id);


--
-- Name: index_foreignmetadatafieldmapping_parentfieldmapping_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_foreignmetadatafieldmapping_parentfieldmapping_id ON foreignmetadatafieldmapping USING btree (parentfieldmapping_id);


--
-- Name: index_foreignmetadataformatmapping_name; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_foreignmetadataformatmapping_name ON foreignmetadataformatmapping USING btree (name);


--
-- Name: index_guestbookresponse_datafile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_guestbookresponse_datafile_id ON guestbookresponse USING btree (datafile_id);


--
-- Name: index_guestbookresponse_dataset_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_guestbookresponse_dataset_id ON guestbookresponse USING btree (dataset_id);


--
-- Name: index_guestbookresponse_guestbook_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_guestbookresponse_guestbook_id ON guestbookresponse USING btree (guestbook_id);


--
-- Name: index_harvestingclient_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingclient_dataverse_id ON harvestingclient USING btree (dataverse_id);


--
-- Name: index_harvestingclient_harvestingurl; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingclient_harvestingurl ON harvestingclient USING btree (harvestingurl);


--
-- Name: index_harvestingclient_harveststyle; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingclient_harveststyle ON harvestingclient USING btree (harveststyle);


--
-- Name: index_harvestingclient_harvesttype; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingclient_harvesttype ON harvestingclient USING btree (harvesttype);


--
-- Name: index_harvestingdataverseconfig_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingdataverseconfig_dataverse_id ON harvestingdataverseconfig USING btree (dataverse_id);


--
-- Name: index_harvestingdataverseconfig_harvestingurl; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingdataverseconfig_harvestingurl ON harvestingdataverseconfig USING btree (harvestingurl);


--
-- Name: index_harvestingdataverseconfig_harveststyle; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingdataverseconfig_harveststyle ON harvestingdataverseconfig USING btree (harveststyle);


--
-- Name: index_harvestingdataverseconfig_harvesttype; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_harvestingdataverseconfig_harvesttype ON harvestingdataverseconfig USING btree (harvesttype);


--
-- Name: index_ingestreport_datafile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_ingestreport_datafile_id ON ingestreport USING btree (datafile_id);


--
-- Name: index_ingestrequest_datafile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_ingestrequest_datafile_id ON ingestrequest USING btree (datafile_id);


--
-- Name: index_ipv4range_owner_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_ipv4range_owner_id ON ipv4range USING btree (owner_id);


--
-- Name: index_ipv6range_owner_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_ipv6range_owner_id ON ipv6range USING btree (owner_id);


--
-- Name: index_maplayermetadata_dataset_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_maplayermetadata_dataset_id ON maplayermetadata USING btree (dataset_id);


--
-- Name: index_metadatablock_name; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_metadatablock_name ON metadatablock USING btree (name);


--
-- Name: index_metadatablock_owner_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_metadatablock_owner_id ON metadatablock USING btree (owner_id);


--
-- Name: index_passwordresetdata_builtinuser_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_passwordresetdata_builtinuser_id ON passwordresetdata USING btree (builtinuser_id);


--
-- Name: index_passwordresetdata_token; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_passwordresetdata_token ON passwordresetdata USING btree (token);


--
-- Name: index_persistedglobalgroup_dtype; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_persistedglobalgroup_dtype ON persistedglobalgroup USING btree (dtype);


--
-- Name: index_roleassignment_assigneeidentifier; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_roleassignment_assigneeidentifier ON roleassignment USING btree (assigneeidentifier);


--
-- Name: index_roleassignment_definitionpoint_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_roleassignment_definitionpoint_id ON roleassignment USING btree (definitionpoint_id);


--
-- Name: index_roleassignment_role_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_roleassignment_role_id ON roleassignment USING btree (role_id);


--
-- Name: index_savedsearch_creator_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_savedsearch_creator_id ON savedsearch USING btree (creator_id);


--
-- Name: index_savedsearch_definitionpoint_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_savedsearch_definitionpoint_id ON savedsearch USING btree (definitionpoint_id);


--
-- Name: index_savedsearchfilterquery_savedsearch_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_savedsearchfilterquery_savedsearch_id ON savedsearchfilterquery USING btree (savedsearch_id);


--
-- Name: index_summarystatistic_datavariable_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_summarystatistic_datavariable_id ON summarystatistic USING btree (datavariable_id);


--
-- Name: index_template_dataverse_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_template_dataverse_id ON template USING btree (dataverse_id);


--
-- Name: index_usernotification_user_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_usernotification_user_id ON usernotification USING btree (user_id);


--
-- Name: index_variablecategory_datavariable_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_variablecategory_datavariable_id ON variablecategory USING btree (datavariable_id);


--
-- Name: index_variablerange_datavariable_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_variablerange_datavariable_id ON variablerange USING btree (datavariable_id);


--
-- Name: index_variablerangeitem_datavariable_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_variablerangeitem_datavariable_id ON variablerangeitem USING btree (datavariable_id);


--
-- Name: index_worldmapauth_token_application_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_worldmapauth_token_application_id ON worldmapauth_token USING btree (application_id);


--
-- Name: index_worldmapauth_token_datafile_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_worldmapauth_token_datafile_id ON worldmapauth_token USING btree (datafile_id);


--
-- Name: index_worldmapauth_token_dataverseuser_id; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE INDEX index_worldmapauth_token_dataverseuser_id ON worldmapauth_token USING btree (dataverseuser_id);


--
-- Name: one_draft_version_per_dataset; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE UNIQUE INDEX one_draft_version_per_dataset ON datasetversion USING btree (dataset_id) WHERE ((versionstate)::text = 'DRAFT'::text);


--
-- Name: token_value; Type: INDEX; Schema: public; Owner: dvnapp; Tablespace: 
--

CREATE UNIQUE INDEX token_value ON worldmapauth_token USING btree (token);


--
-- Name: dataverse_citationdatasetfieldtypes_citationdatasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverse_citationdatasetfieldtypes
ADD CONSTRAINT dataverse_citationdatasetfieldtypes_citationdatasetfieldtype_id FOREIGN KEY (citationdatasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: dtasetfieldcontrolledvocabularyvaluecntrolledvocabularyvaluesid; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfield_controlledvocabularyvalue
ADD CONSTRAINT dtasetfieldcontrolledvocabularyvaluecntrolledvocabularyvaluesid FOREIGN KEY (controlledvocabularyvalues_id) REFERENCES controlledvocabularyvalue(id);


--
-- Name: explicitgroup_authenticateduser_containedauthenticatedusers_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY explicitgroup_authenticateduser
ADD CONSTRAINT explicitgroup_authenticateduser_containedauthenticatedusers_id FOREIGN KEY (containedauthenticatedusers_id) REFERENCES authenticateduser(id);


--
-- Name: fk_apitoken_authenticateduser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY apitoken
ADD CONSTRAINT fk_apitoken_authenticateduser_id FOREIGN KEY (authenticateduser_id) REFERENCES authenticateduser(id);


--
-- Name: fk_authenticateduserlookup_authenticateduser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY authenticateduserlookup
ADD CONSTRAINT fk_authenticateduserlookup_authenticateduser_id FOREIGN KEY (authenticateduser_id) REFERENCES authenticateduser(id);


--
-- Name: fk_clientharvestrun_harvestingclient_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY clientharvestrun
ADD CONSTRAINT fk_clientharvestrun_harvestingclient_id FOREIGN KEY (harvestingclient_id) REFERENCES harvestingclient(id);


--
-- Name: fk_confirmemaildata_authenticateduser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY confirmemaildata
ADD CONSTRAINT fk_confirmemaildata_authenticateduser_id FOREIGN KEY (authenticateduser_id) REFERENCES authenticateduser(id);


--
-- Name: fk_controlledvocabalternate_controlledvocabularyvalue_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY controlledvocabalternate
ADD CONSTRAINT fk_controlledvocabalternate_controlledvocabularyvalue_id FOREIGN KEY (controlledvocabularyvalue_id) REFERENCES controlledvocabularyvalue(id);


--
-- Name: fk_controlledvocabalternate_datasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY controlledvocabalternate
ADD CONSTRAINT fk_controlledvocabalternate_datasetfieldtype_id FOREIGN KEY (datasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_controlledvocabularyvalue_datasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY controlledvocabularyvalue
ADD CONSTRAINT fk_controlledvocabularyvalue_datasetfieldtype_id FOREIGN KEY (datasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_customquestion_guestbook_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customquestion
ADD CONSTRAINT fk_customquestion_guestbook_id FOREIGN KEY (guestbook_id) REFERENCES guestbook(id);


--
-- Name: fk_customquestionresponse_customquestion_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customquestionresponse
ADD CONSTRAINT fk_customquestionresponse_customquestion_id FOREIGN KEY (customquestion_id) REFERENCES customquestion(id);


--
-- Name: fk_customquestionresponse_guestbookresponse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customquestionresponse
ADD CONSTRAINT fk_customquestionresponse_guestbookresponse_id FOREIGN KEY (guestbookresponse_id) REFERENCES guestbookresponse(id);


--
-- Name: fk_customquestionvalue_customquestion_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY customquestionvalue
ADD CONSTRAINT fk_customquestionvalue_customquestion_id FOREIGN KEY (customquestion_id) REFERENCES customquestion(id);


--
-- Name: fk_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datafile
ADD CONSTRAINT fk_datafile_id FOREIGN KEY (id) REFERENCES dvobject(id);


--
-- Name: fk_datafilecategory_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datafilecategory
ADD CONSTRAINT fk_datafilecategory_dataset_id FOREIGN KEY (dataset_id) REFERENCES dvobject(id);


--
-- Name: fk_datafiletag_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datafiletag
ADD CONSTRAINT fk_datafiletag_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_dataset_citationdatedatasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataset
ADD CONSTRAINT fk_dataset_citationdatedatasetfieldtype_id FOREIGN KEY (citationdatedatasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_dataset_guestbook_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataset
ADD CONSTRAINT fk_dataset_guestbook_id FOREIGN KEY (guestbook_id) REFERENCES guestbook(id);


--
-- Name: fk_dataset_harvestingclient_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataset
ADD CONSTRAINT fk_dataset_harvestingclient_id FOREIGN KEY (harvestingclient_id) REFERENCES harvestingclient(id);


--
-- Name: fk_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataset
ADD CONSTRAINT fk_dataset_id FOREIGN KEY (id) REFERENCES dvobject(id);


--
-- Name: fk_dataset_thumbnailfile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataset
ADD CONSTRAINT fk_dataset_thumbnailfile_id FOREIGN KEY (thumbnailfile_id) REFERENCES dvobject(id);


--
-- Name: fk_datasetfield_controlledvocabularyvalue_datasetfield_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfield_controlledvocabularyvalue
ADD CONSTRAINT fk_datasetfield_controlledvocabularyvalue_datasetfield_id FOREIGN KEY (datasetfield_id) REFERENCES datasetfield(id);


--
-- Name: fk_datasetfield_datasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfield
ADD CONSTRAINT fk_datasetfield_datasetfieldtype_id FOREIGN KEY (datasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_datasetfield_datasetversion_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfield
ADD CONSTRAINT fk_datasetfield_datasetversion_id FOREIGN KEY (datasetversion_id) REFERENCES datasetversion(id);


--
-- Name: fk_datasetfield_parentdatasetfieldcompoundvalue_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfield
ADD CONSTRAINT fk_datasetfield_parentdatasetfieldcompoundvalue_id FOREIGN KEY (parentdatasetfieldcompoundvalue_id) REFERENCES datasetfieldcompoundvalue(id);


--
-- Name: fk_datasetfield_template_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfield
ADD CONSTRAINT fk_datasetfield_template_id FOREIGN KEY (template_id) REFERENCES template(id);


--
-- Name: fk_datasetfieldcompoundvalue_parentdatasetfield_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfieldcompoundvalue
ADD CONSTRAINT fk_datasetfieldcompoundvalue_parentdatasetfield_id FOREIGN KEY (parentdatasetfield_id) REFERENCES datasetfield(id);


--
-- Name: fk_datasetfielddefaultvalue_datasetfield_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfielddefaultvalue
ADD CONSTRAINT fk_datasetfielddefaultvalue_datasetfield_id FOREIGN KEY (datasetfield_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_datasetfielddefaultvalue_defaultvalueset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfielddefaultvalue
ADD CONSTRAINT fk_datasetfielddefaultvalue_defaultvalueset_id FOREIGN KEY (defaultvalueset_id) REFERENCES defaultvalueset(id);


--
-- Name: fk_datasetfielddefaultvalue_parentdatasetfielddefaultvalue_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfielddefaultvalue
ADD CONSTRAINT fk_datasetfielddefaultvalue_parentdatasetfielddefaultvalue_id FOREIGN KEY (parentdatasetfielddefaultvalue_id) REFERENCES datasetfielddefaultvalue(id);


--
-- Name: fk_datasetfieldtype_metadatablock_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfieldtype
ADD CONSTRAINT fk_datasetfieldtype_metadatablock_id FOREIGN KEY (metadatablock_id) REFERENCES metadatablock(id);


--
-- Name: fk_datasetfieldtype_parentdatasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfieldtype
ADD CONSTRAINT fk_datasetfieldtype_parentdatasetfieldtype_id FOREIGN KEY (parentdatasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_datasetfieldvalue_datasetfield_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetfieldvalue
ADD CONSTRAINT fk_datasetfieldvalue_datasetfield_id FOREIGN KEY (datasetfield_id) REFERENCES datasetfield(id);


--
-- Name: fk_datasetlinkingdataverse_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetlinkingdataverse
ADD CONSTRAINT fk_datasetlinkingdataverse_dataset_id FOREIGN KEY (dataset_id) REFERENCES dvobject(id);


--
-- Name: fk_datasetlinkingdataverse_linkingdataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetlinkingdataverse
ADD CONSTRAINT fk_datasetlinkingdataverse_linkingdataverse_id FOREIGN KEY (linkingdataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_datasetlock_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetlock
ADD CONSTRAINT fk_datasetlock_dataset_id FOREIGN KEY (dataset_id) REFERENCES dvobject(id);


--
-- Name: fk_datasetlock_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetlock
ADD CONSTRAINT fk_datasetlock_user_id FOREIGN KEY (user_id) REFERENCES authenticateduser(id);


--
-- Name: fk_datasetversion_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetversion
ADD CONSTRAINT fk_datasetversion_dataset_id FOREIGN KEY (dataset_id) REFERENCES dvobject(id);


--
-- Name: fk_datasetversion_termsofuseandaccess_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetversion
ADD CONSTRAINT fk_datasetversion_termsofuseandaccess_id FOREIGN KEY (termsofuseandaccess_id) REFERENCES termsofuseandaccess(id);


--
-- Name: fk_datasetversionuser_authenticateduser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetversionuser
ADD CONSTRAINT fk_datasetversionuser_authenticateduser_id FOREIGN KEY (authenticateduser_id) REFERENCES authenticateduser(id);


--
-- Name: fk_datasetversionuser_datasetversion_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datasetversionuser
ADD CONSTRAINT fk_datasetversionuser_datasetversion_id FOREIGN KEY (datasetversion_id) REFERENCES datasetversion(id);


--
-- Name: fk_datatable_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datatable
ADD CONSTRAINT fk_datatable_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_datavariable_datatable_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY datavariable
ADD CONSTRAINT fk_datavariable_datatable_id FOREIGN KEY (datatable_id) REFERENCES datatable(id);


--
-- Name: fk_dataverse_citationdatasetfieldtypes_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverse_citationdatasetfieldtypes
ADD CONSTRAINT fk_dataverse_citationdatasetfieldtypes_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataverse_defaultcontributorrole_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverse
ADD CONSTRAINT fk_dataverse_defaultcontributorrole_id FOREIGN KEY (defaultcontributorrole_id) REFERENCES dataverserole(id);


--
-- Name: fk_dataverse_defaulttemplate_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverse
ADD CONSTRAINT fk_dataverse_defaulttemplate_id FOREIGN KEY (defaulttemplate_id) REFERENCES template(id);


--
-- Name: fk_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverse
ADD CONSTRAINT fk_dataverse_id FOREIGN KEY (id) REFERENCES dvobject(id);


--
-- Name: fk_dataverse_metadatablock_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverse_metadatablock
ADD CONSTRAINT fk_dataverse_metadatablock_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataverse_metadatablock_metadatablocks_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverse_metadatablock
ADD CONSTRAINT fk_dataverse_metadatablock_metadatablocks_id FOREIGN KEY (metadatablocks_id) REFERENCES metadatablock(id);


--
-- Name: fk_dataversecontact_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversecontact
ADD CONSTRAINT fk_dataversecontact_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataversefacet_datasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefacet
ADD CONSTRAINT fk_dataversefacet_datasetfieldtype_id FOREIGN KEY (datasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_dataversefacet_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefacet
ADD CONSTRAINT fk_dataversefacet_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataversefeatureddataverse_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefeatureddataverse
ADD CONSTRAINT fk_dataversefeatureddataverse_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataversefeatureddataverse_featureddataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefeatureddataverse
ADD CONSTRAINT fk_dataversefeatureddataverse_featureddataverse_id FOREIGN KEY (featureddataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataversefieldtypeinputlevel_datasetfieldtype_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefieldtypeinputlevel
ADD CONSTRAINT fk_dataversefieldtypeinputlevel_datasetfieldtype_id FOREIGN KEY (datasetfieldtype_id) REFERENCES datasetfieldtype(id);


--
-- Name: fk_dataversefieldtypeinputlevel_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversefieldtypeinputlevel
ADD CONSTRAINT fk_dataversefieldtypeinputlevel_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataverselinkingdataverse_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverselinkingdataverse
ADD CONSTRAINT fk_dataverselinkingdataverse_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataverselinkingdataverse_linkingdataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverselinkingdataverse
ADD CONSTRAINT fk_dataverselinkingdataverse_linkingdataverse_id FOREIGN KEY (linkingdataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataverserole_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataverserole
ADD CONSTRAINT fk_dataverserole_owner_id FOREIGN KEY (owner_id) REFERENCES dvobject(id);


--
-- Name: fk_dataversesubjects_controlledvocabularyvalue_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversesubjects
ADD CONSTRAINT fk_dataversesubjects_controlledvocabularyvalue_id FOREIGN KEY (controlledvocabularyvalue_id) REFERENCES controlledvocabularyvalue(id);


--
-- Name: fk_dataversesubjects_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversesubjects
ADD CONSTRAINT fk_dataversesubjects_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dataversetheme_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dataversetheme
ADD CONSTRAINT fk_dataversetheme_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_dvobject_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dvobject
ADD CONSTRAINT fk_dvobject_creator_id FOREIGN KEY (creator_id) REFERENCES authenticateduser(id);


--
-- Name: fk_dvobject_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dvobject
ADD CONSTRAINT fk_dvobject_owner_id FOREIGN KEY (owner_id) REFERENCES dvobject(id);


--
-- Name: fk_dvobject_releaseuser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY dvobject
ADD CONSTRAINT fk_dvobject_releaseuser_id FOREIGN KEY (releaseuser_id) REFERENCES authenticateduser(id);


--
-- Name: fk_explicitgroup_authenticateduser_explicitgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY explicitgroup_authenticateduser
ADD CONSTRAINT fk_explicitgroup_authenticateduser_explicitgroup_id FOREIGN KEY (explicitgroup_id) REFERENCES explicitgroup(id);


--
-- Name: fk_explicitgroup_containedroleassignees_explicitgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY explicitgroup_containedroleassignees
ADD CONSTRAINT fk_explicitgroup_containedroleassignees_explicitgroup_id FOREIGN KEY (explicitgroup_id) REFERENCES explicitgroup(id);


--
-- Name: fk_explicitgroup_explicitgroup_containedexplicitgroups_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY explicitgroup_explicitgroup
ADD CONSTRAINT fk_explicitgroup_explicitgroup_containedexplicitgroups_id FOREIGN KEY (containedexplicitgroups_id) REFERENCES explicitgroup(id);


--
-- Name: fk_explicitgroup_explicitgroup_explicitgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY explicitgroup_explicitgroup
ADD CONSTRAINT fk_explicitgroup_explicitgroup_explicitgroup_id FOREIGN KEY (explicitgroup_id) REFERENCES explicitgroup(id);


--
-- Name: fk_explicitgroup_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY explicitgroup
ADD CONSTRAINT fk_explicitgroup_owner_id FOREIGN KEY (owner_id) REFERENCES dvobject(id);


--
-- Name: fk_fileaccessrequests_authenticated_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY fileaccessrequests
ADD CONSTRAINT fk_fileaccessrequests_authenticated_user_id FOREIGN KEY (authenticated_user_id) REFERENCES authenticateduser(id);


--
-- Name: fk_fileaccessrequests_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY fileaccessrequests
ADD CONSTRAINT fk_fileaccessrequests_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_filemetadata_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY filemetadata
ADD CONSTRAINT fk_filemetadata_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_filemetadata_datafilecategory_filecategories_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY filemetadata_datafilecategory
ADD CONSTRAINT fk_filemetadata_datafilecategory_filecategories_id FOREIGN KEY (filecategories_id) REFERENCES datafilecategory(id);


--
-- Name: fk_filemetadata_datafilecategory_filemetadatas_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY filemetadata_datafilecategory
ADD CONSTRAINT fk_filemetadata_datafilecategory_filemetadatas_id FOREIGN KEY (filemetadatas_id) REFERENCES filemetadata(id);


--
-- Name: fk_filemetadata_datasetversion_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY filemetadata
ADD CONSTRAINT fk_filemetadata_datasetversion_id FOREIGN KEY (datasetversion_id) REFERENCES datasetversion(id);


--
-- Name: fk_foreignmetadatafieldmapping_foreignmetadataformatmapping_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY foreignmetadatafieldmapping
ADD CONSTRAINT fk_foreignmetadatafieldmapping_foreignmetadataformatmapping_id FOREIGN KEY (foreignmetadataformatmapping_id) REFERENCES foreignmetadataformatmapping(id);


--
-- Name: fk_foreignmetadatafieldmapping_parentfieldmapping_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY foreignmetadatafieldmapping
ADD CONSTRAINT fk_foreignmetadatafieldmapping_parentfieldmapping_id FOREIGN KEY (parentfieldmapping_id) REFERENCES foreignmetadatafieldmapping(id);


--
-- Name: fk_guestbook_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbook
ADD CONSTRAINT fk_guestbook_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_guestbookresponse_authenticateduser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbookresponse
ADD CONSTRAINT fk_guestbookresponse_authenticateduser_id FOREIGN KEY (authenticateduser_id) REFERENCES authenticateduser(id);


--
-- Name: fk_guestbookresponse_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbookresponse
ADD CONSTRAINT fk_guestbookresponse_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_guestbookresponse_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbookresponse
ADD CONSTRAINT fk_guestbookresponse_dataset_id FOREIGN KEY (dataset_id) REFERENCES dvobject(id);


--
-- Name: fk_guestbookresponse_datasetversion_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbookresponse
ADD CONSTRAINT fk_guestbookresponse_datasetversion_id FOREIGN KEY (datasetversion_id) REFERENCES datasetversion(id);


--
-- Name: fk_guestbookresponse_guestbook_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY guestbookresponse
ADD CONSTRAINT fk_guestbookresponse_guestbook_id FOREIGN KEY (guestbook_id) REFERENCES guestbook(id);


--
-- Name: fk_harvestingclient_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY harvestingclient
ADD CONSTRAINT fk_harvestingclient_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_harvestingdataverseconfig_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY harvestingdataverseconfig
ADD CONSTRAINT fk_harvestingdataverseconfig_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_ingestreport_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY ingestreport
ADD CONSTRAINT fk_ingestreport_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_ingestrequest_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY ingestrequest
ADD CONSTRAINT fk_ingestrequest_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_ipv4range_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY ipv4range
ADD CONSTRAINT fk_ipv4range_owner_id FOREIGN KEY (owner_id) REFERENCES persistedglobalgroup(id);


--
-- Name: fk_ipv6range_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY ipv6range
ADD CONSTRAINT fk_ipv6range_owner_id FOREIGN KEY (owner_id) REFERENCES persistedglobalgroup(id);


--
-- Name: fk_maplayermetadata_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY maplayermetadata
ADD CONSTRAINT fk_maplayermetadata_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_maplayermetadata_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY maplayermetadata
ADD CONSTRAINT fk_maplayermetadata_dataset_id FOREIGN KEY (dataset_id) REFERENCES dvobject(id);


--
-- Name: fk_metadatablock_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY metadatablock
ADD CONSTRAINT fk_metadatablock_owner_id FOREIGN KEY (owner_id) REFERENCES dvobject(id);


--
-- Name: fk_passwordresetdata_builtinuser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY passwordresetdata
ADD CONSTRAINT fk_passwordresetdata_builtinuser_id FOREIGN KEY (builtinuser_id) REFERENCES builtinuser(id);


--
-- Name: fk_roleassignment_definitionpoint_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY roleassignment
ADD CONSTRAINT fk_roleassignment_definitionpoint_id FOREIGN KEY (definitionpoint_id) REFERENCES dvobject(id);


--
-- Name: fk_roleassignment_role_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY roleassignment
ADD CONSTRAINT fk_roleassignment_role_id FOREIGN KEY (role_id) REFERENCES dataverserole(id);


--
-- Name: fk_savedsearch_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY savedsearch
ADD CONSTRAINT fk_savedsearch_creator_id FOREIGN KEY (creator_id) REFERENCES authenticateduser(id);


--
-- Name: fk_savedsearch_definitionpoint_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY savedsearch
ADD CONSTRAINT fk_savedsearch_definitionpoint_id FOREIGN KEY (definitionpoint_id) REFERENCES dvobject(id);


--
-- Name: fk_savedsearchfilterquery_savedsearch_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY savedsearchfilterquery
ADD CONSTRAINT fk_savedsearchfilterquery_savedsearch_id FOREIGN KEY (savedsearch_id) REFERENCES savedsearch(id);


--
-- Name: fk_summarystatistic_datavariable_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY summarystatistic
ADD CONSTRAINT fk_summarystatistic_datavariable_id FOREIGN KEY (datavariable_id) REFERENCES datavariable(id);


--
-- Name: fk_template_dataverse_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY template
ADD CONSTRAINT fk_template_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES dvobject(id);


--
-- Name: fk_template_termsofuseandaccess_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY template
ADD CONSTRAINT fk_template_termsofuseandaccess_id FOREIGN KEY (termsofuseandaccess_id) REFERENCES termsofuseandaccess(id);


--
-- Name: fk_usernotification_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY usernotification
ADD CONSTRAINT fk_usernotification_user_id FOREIGN KEY (user_id) REFERENCES authenticateduser(id);


--
-- Name: fk_variablecategory_datavariable_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY variablecategory
ADD CONSTRAINT fk_variablecategory_datavariable_id FOREIGN KEY (datavariable_id) REFERENCES datavariable(id);


--
-- Name: fk_variablerange_datavariable_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY variablerange
ADD CONSTRAINT fk_variablerange_datavariable_id FOREIGN KEY (datavariable_id) REFERENCES datavariable(id);


--
-- Name: fk_variablerangeitem_datavariable_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY variablerangeitem
ADD CONSTRAINT fk_variablerangeitem_datavariable_id FOREIGN KEY (datavariable_id) REFERENCES datavariable(id);


--
-- Name: fk_worldmapauth_token_application_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY worldmapauth_token
ADD CONSTRAINT fk_worldmapauth_token_application_id FOREIGN KEY (application_id) REFERENCES worldmapauth_tokentype(id);


--
-- Name: fk_worldmapauth_token_datafile_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY worldmapauth_token
ADD CONSTRAINT fk_worldmapauth_token_datafile_id FOREIGN KEY (datafile_id) REFERENCES dvobject(id);


--
-- Name: fk_worldmapauth_token_dataverseuser_id; Type: FK CONSTRAINT; Schema: public; Owner: dvnapp
--

ALTER TABLE ONLY worldmapauth_token
ADD CONSTRAINT fk_worldmapauth_token_dataverseuser_id FOREIGN KEY (dataverseuser_id) REFERENCES authenticateduser(id);


--
-- PostgreSQL database dump complete
--
