--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.24
-- Dumped by pg_dump version 14.2

-- Started on 2024-08-07 12:45:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE openapi;
--
-- TOC entry 3069 (class 1262 OID 1119406)
-- Name: openapi; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE openapi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE openapi OWNER TO postgres;

\connect openapi

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 201 (class 1255 OID 1126179)
-- Name: f_ins_tm_app_user_request_log(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.f_ins_tm_app_user_request_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO public.tm_app_user_request_log
		("i_id"
          ,"i_id_app_user_request"
		  ,"i_id_user"
		  ,"n_requested_by"
		  ,"i_id_app_user"
		  ,"i_id_sit_type"
		  ,"n_doc_path"
		  ,"i_id_status"
		  ,"i_status_upd_by"
		  ,"d_status_upd_on"
		  ,"i_created_by"
		  ,"d_created_on"
		  ,"i_updated_by"
		  ,"d_updated_by"
		)
		VALUES
		(
            (SELECT i_cur_id FROM tr_nomax WHERE n_module_name = 'tm_app_user_request_log')
		  ,NEW."i_id"
		  ,NEW."i_id_user"
		  ,NEW."n_requested_by"
		  ,NEW."i_id_app_user"
		  ,NEW."i_id_sit_type"
		  ,NEW."n_doc_path"
		  ,NEW."i_id_status"
		  ,NEW."i_status_upd_by"
		  ,NEW."d_status_upd_on"
		  ,NEW."i_created_by"
		  ,NEW."d_created_on"
		  ,NEW."i_updated_by"
		  ,NEW."d_updated_by"
		)
	;
    UPDATE tr_nomax SET i_cur_id = i_cur_id + 1 WHERE n_module_name = 'tm_app_user_request_log';
	
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.f_ins_tm_app_user_request_log() OWNER TO postgres;

--
-- TOC entry 202 (class 1255 OID 1126181)
-- Name: f_upd_tm_app_user_request_log(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.f_upd_tm_app_user_request_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
	INSERT INTO public.tm_app_user_request_log
		("i_id"
          ,"i_id_app_user_request"
		  ,"i_id_user"
		  ,"n_requested_by"
		  ,"i_id_app_user"
		  ,"i_id_sit_type"
		  ,"n_doc_path"
		  ,"i_id_status"
		  ,"i_status_upd_by"
		  ,"d_status_upd_on"
		  ,"i_created_by"
		  ,"d_created_on"
		  ,"i_updated_by"
		  ,"d_updated_by"
		)
		VALUES
		(
            (SELECT i_cur_id FROM tr_nomax WHERE n_module_name = 'tm_app_user_request_log')
			  ,OLD."i_id"
			  ,OLD."i_id_user"
			  ,OLD."n_requested_by"
			  ,OLD."i_id_app_user"
			  ,OLD."i_id_sit_type"
			  ,OLD."n_doc_path"
			  ,OLD."i_id_status"
			  ,OLD."i_status_upd_by"
			  ,OLD."d_status_upd_on"
			  ,OLD."i_created_by"
			  ,OLD."d_created_on"
			  ,OLD."i_updated_by"
			  ,OLD."d_updated_by"
			)
	;
    UPDATE tr_nomax SET i_cur_id = i_cur_id + 1 WHERE n_module_name = 'tm_app_user_request_log';
		
		RETURN NEW;
	END;
	$$;


ALTER FUNCTION public.f_upd_tm_app_user_request_log() OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 188 (class 1259 OID 1158002)
-- Name: tm_api_hit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_api_hit (
    i_id integer NOT NULL,
    i_id_api_katalog bigint NOT NULL,
    d_hit_date timestamp with time zone,
    c_external_id character varying(36) NOT NULL
);


ALTER TABLE public.tm_api_hit OWNER TO postgres;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE tm_api_hit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_api_hit IS 'Log APi Hit';


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN tm_api_hit.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_api_hit.i_id IS 'ID';


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN tm_api_hit.i_id_api_katalog; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_api_hit.i_id_api_katalog IS 'Referenced from tr_api_katalog.i_id';


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN tm_api_hit.d_hit_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_api_hit.d_hit_date IS 'HIt Date';


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN tm_api_hit.c_external_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_api_hit.c_external_id IS 'External Unique Id';


--
-- TOC entry 185 (class 1259 OID 1145142)
-- Name: tm_app; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_app (
    i_id integer NOT NULL,
    n_name character varying(50) NOT NULL,
    n_version character varying(10),
    n_desc character varying(250),
    n_logo_path character varying(255),
    n_features character varying(1024),
    c_active character varying(1)
);


ALTER TABLE public.tm_app OWNER TO postgres;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE tm_app; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_app IS 'Application Properties';


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tm_app.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app.i_id IS 'ID Application Properties';


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tm_app.n_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app.n_name IS 'Application Name';


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tm_app.n_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app.n_version IS 'Application Version';


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tm_app.n_desc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app.n_desc IS 'Application Description';


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tm_app.n_logo_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app.n_logo_path IS 'Application Logo Path';


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tm_app.n_features; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app.n_features IS 'Update or features information (ex: if version is updated, etc)';


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tm_app.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app.c_active IS 'Active Status';


--
-- TOC entry 180 (class 1259 OID 1119718)
-- Name: tm_app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_app_user (
    i_id bigint NOT NULL,
    i_id_user bigint NOT NULL,
    n_app_name character varying(100) NOT NULL,
    i_app_type bigint,
    i_app_version bigint,
    n_source_acc character varying(50),
    i_max_hit_rate bigint,
    n_account_no character varying(100) NOT NULL,
    n_consumer_key character varying(100) NOT NULL,
    n_consumer_secret character varying(100) NOT NULL,
    c_active character varying(1) DEFAULT 1,
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_by timestamp with time zone,
    d_max_hit_rate timestamp with time zone,
    i_count_hit_rate bigint
);


ALTER TABLE public.tm_app_user OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 180
-- Name: TABLE tm_app_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_app_user IS 'App User Relation';


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.i_id IS 'ID App User';


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.i_id_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.i_id_user IS 'ID User';


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.n_app_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.n_app_name IS 'App Name';


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.i_app_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.i_app_type IS 'Referenced from tr_literal.i_id App Type';


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.i_app_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.i_app_version IS 'Referenced from tr_literal.i_id App Version';


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.n_source_acc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.n_source_acc IS 'Source Account';


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.i_max_hit_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.i_max_hit_rate IS 'Current Max Hit Rate';


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.n_account_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.n_account_no IS 'Account No';


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.n_consumer_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.n_consumer_key IS 'Consumer Key';


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.n_consumer_secret; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.n_consumer_secret IS 'Consumer Secret';


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.c_active IS 'Active Status';


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.d_max_hit_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.d_max_hit_rate IS 'Current Hit Rate Last Valid Date';


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN tm_app_user.i_count_hit_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user.i_count_hit_rate IS 'Hit Rate Counter';


--
-- TOC entry 186 (class 1259 OID 1153023)
-- Name: tm_app_user_hit_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_app_user_hit_log (
    i_id bigint NOT NULL,
    i_id_app_user bigint NOT NULL,
    i_max_hit_rate bigint,
    d_max_hit_rate timestamp with time zone,
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_by timestamp with time zone,
    i_count_hit_rate bigint,
    c_active character varying(1)
);


ALTER TABLE public.tm_app_user_hit_log OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE tm_app_user_hit_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_app_user_hit_log IS 'Log App User Hit Rate Max and Period';


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN tm_app_user_hit_log.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_hit_log.i_id IS 'ID';


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN tm_app_user_hit_log.i_id_app_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_hit_log.i_id_app_user IS 'Referenced from tm_app_user.i_id';


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN tm_app_user_hit_log.i_max_hit_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_hit_log.i_max_hit_rate IS 'Max Hit Rate Log';


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN tm_app_user_hit_log.d_max_hit_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_hit_log.d_max_hit_rate IS 'Hit Rate Last Valid Date Log';


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN tm_app_user_hit_log.i_count_hit_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_hit_log.i_count_hit_rate IS 'Hit Rate Last Counter';


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN tm_app_user_hit_log.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_hit_log.c_active IS 'Active Status';


--
-- TOC entry 176 (class 1259 OID 1119571)
-- Name: tm_app_user_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_app_user_product (
    i_id bigint NOT NULL,
    i_id_app_user bigint NOT NULL,
    i_id_app_product bigint NOT NULL,
    i_created_by bigint DEFAULT 1,
    d_created_by timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_on timestamp with time zone,
    i_count_hit_rate bigint
);


ALTER TABLE public.tm_app_user_product OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 176
-- Name: TABLE tm_app_user_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_app_user_product IS 'App User and Product Relation';


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN tm_app_user_product.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_product.i_id IS 'ID App User Product';


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN tm_app_user_product.i_id_app_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_product.i_id_app_user IS 'Referenced from tm_app_user.i_id';


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN tm_app_user_product.i_id_app_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_product.i_id_app_product IS 'Referenced from tr_app_product.i_id';


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN tm_app_user_product.i_count_hit_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_product.i_count_hit_rate IS 'Hit Rate Counter';


--
-- TOC entry 183 (class 1259 OID 1126093)
-- Name: tm_app_user_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_app_user_request (
    i_id bigint NOT NULL,
    i_id_user bigint,
    n_requested_by character varying,
    i_id_app_user bigint NOT NULL,
    i_id_sit_type bigint,
    n_doc_path character varying(100),
    i_id_status bigint,
    i_status_upd_by bigint DEFAULT 1,
    d_status_upd_on timestamp with time zone DEFAULT now(),
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_by timestamp with time zone
);


ALTER TABLE public.tm_app_user_request OWNER TO postgres;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE tm_app_user_request; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_app_user_request IS 'App SIT Request List';


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.i_id IS 'ID App User Request';


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.i_id_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.i_id_user IS 'Requestor (Person who request this). Referenced from tm_user.i_id';


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.n_requested_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.n_requested_by IS 'Requestor (Person who request this) if NOT from tm_user';


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.i_id_app_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.i_id_app_user IS 'Referenced from tm_app_user';


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.i_id_sit_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.i_id_sit_type IS 'Current SIT Type. Referenced from tr_literal.i_id SIT Type';


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.n_doc_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.n_doc_path IS 'Uploaded Document Path';


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.i_id_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.i_id_status IS 'Current SIT Request Status. Referenced from tr_literal.i_id SIT Request Status';


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.i_status_upd_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.i_status_upd_by IS 'Person who update Status. Referenced from tm_user.i_id';


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN tm_app_user_request.d_status_upd_on; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request.d_status_upd_on IS 'DateTime on SIT-Request-Status Changed';


--
-- TOC entry 184 (class 1259 OID 1126160)
-- Name: tm_app_user_request_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_app_user_request_log (
    i_id bigint NOT NULL,
    i_id_app_user_request bigint,
    i_id_user bigint,
    n_requested_by character varying,
    i_id_app_user bigint NOT NULL,
    i_id_sit_type bigint,
    n_doc_path character varying(100),
    i_id_status bigint,
    i_status_upd_by bigint DEFAULT 1,
    d_status_upd_on timestamp with time zone DEFAULT now(),
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_by timestamp with time zone
);


ALTER TABLE public.tm_app_user_request_log OWNER TO postgres;

--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE tm_app_user_request_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_app_user_request_log IS 'App SIT Request Log';


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.i_id IS 'ID App User Request Log';


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.i_id_app_user_request; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.i_id_app_user_request IS 'ID App User Request';


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.i_id_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.i_id_user IS 'Requestor (Person who request this). Referenced from tm_user.i_id';


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.n_requested_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.n_requested_by IS 'Requestor (Person who request this) if NOT from tm_user';


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.i_id_app_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.i_id_app_user IS 'Referenced from tm_app_user';


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.i_id_sit_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.i_id_sit_type IS 'Current SIT Type. Referenced from tr_literal.i_id SIT Type';


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.n_doc_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.n_doc_path IS 'Uploaded Document Path';


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.i_id_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.i_id_status IS 'Current SIT Request Status. Referenced from tr_literal.i_id SIT Request Status';


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.i_status_upd_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.i_status_upd_by IS 'Person who update Status. Referenced from tm_user.i_id';


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN tm_app_user_request_log.d_status_upd_on; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_app_user_request_log.d_status_upd_on IS 'DateTime on SIT-Request-Status Changed';


--
-- TOC entry 171 (class 1259 OID 1119483)
-- Name: tm_authority_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_authority_menu (
    i_id integer NOT NULL,
    i_id_authority integer NOT NULL,
    i_id_menu integer NOT NULL,
    i_created_by bigint DEFAULT (1)::bigint NOT NULL,
    d_created_on timestamp with time zone DEFAULT now() NOT NULL,
    i_updated_by bigint,
    d_updated_on timestamp with time zone
);


ALTER TABLE public.tm_authority_menu OWNER TO postgres;

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 171
-- Name: TABLE tm_authority_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_authority_menu IS 'Authority and Menu Relation';


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN tm_authority_menu.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_authority_menu.i_id IS 'ID Authority Menu';


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN tm_authority_menu.i_id_authority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_authority_menu.i_id_authority IS 'Referenced from tr_authority.i_id';


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN tm_authority_menu.i_id_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_authority_menu.i_id_menu IS 'Referenced from tr_menu.i_id';


--
-- TOC entry 181 (class 1259 OID 1119786)
-- Name: tm_cms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_cms (
    i_id bigint NOT NULL,
    i_id_parent bigint,
    i_id_authority_for integer,
    i_id_cms_type bigint,
    n_title character varying(100) NOT NULL,
    n_link_url character varying(100),
    n_image character varying(100),
    n_content text,
    c_active character varying(1),
    d_start_date timestamp with time zone,
    d_end_date timestamp with time zone,
    i_created_by bigint DEFAULT (1)::bigint NOT NULL,
    d_created_on timestamp with time zone DEFAULT now() NOT NULL,
    i_updated_by bigint,
    d_updated_on timestamp with time zone,
    n_image_src bytea,
    n_bucket character varying
);


ALTER TABLE public.tm_cms OWNER TO postgres;

--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 181
-- Name: TABLE tm_cms; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_cms IS 'CMS List';


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.i_id IS 'ID CMS';


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.i_id_parent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.i_id_parent IS 'ID Parent CMS';


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.i_id_authority_for; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.i_id_authority_for IS 'Consumption For (1 = Admin; 2 = Tenant)';


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.i_id_cms_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.i_id_cms_type IS 'ID CMS Type. Referenced from tr_literal.i_id CMS Type';


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.n_title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.n_title IS 'Title';


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.n_link_url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.n_link_url IS 'Link';


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.n_image; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.n_image IS 'Image';


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.n_content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.n_content IS 'Content';


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.c_active IS 'Active Status';


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.d_start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.d_start_date IS 'Start Date';


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.d_end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.d_end_date IS 'End Date';


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN tm_cms.n_image_src; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_cms.n_image_src IS 'Source Image';


--
-- TOC entry 177 (class 1259 OID 1119578)
-- Name: tm_sig_gen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_sig_gen (
    i_id bigint NOT NULL,
    i_id_user bigint NOT NULL,
    i_id_api_version bigint,
    i_id_api_type bigint,
    i_id_api_method bigint,
    n_url_path character varying(100),
    d_timestamp timestamp with time zone,
    n_client_id character varying(100),
    n_client_secret character varying(100),
    n_body character varying(100),
    n_access_token character varying(100),
    n_signature_result character varying(100),
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_on timestamp with time zone
);


ALTER TABLE public.tm_sig_gen OWNER TO postgres;

--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE tm_sig_gen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_sig_gen IS 'Signature Generation List';


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.i_id IS 'ID Signature Generation';


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.i_id_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.i_id_user IS 'Referenced from tm_user.i_id';


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.i_id_api_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.i_id_api_version IS 'Referenced from tr_literal.i_id API Version';


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.i_id_api_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.i_id_api_type IS 'Referenced from tr_literal.i_id API Type';


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.i_id_api_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.i_id_api_method IS 'Referenced from tr_literal.i_id API Method';


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.n_url_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.n_url_path IS 'URL Path';


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.d_timestamp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.d_timestamp IS 'Timestamp';


--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.n_client_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.n_client_id IS 'Client Id';


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.n_client_secret; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.n_client_secret IS 'Client Secret';


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.n_body; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.n_body IS 'Body';


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.n_access_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.n_access_token IS 'Access Token';


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN tm_sig_gen.n_signature_result; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_sig_gen.n_signature_result IS 'Signature Result';


--
-- TOC entry 187 (class 1259 OID 1153484)
-- Name: tm_upstream; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_upstream (
    i_id integer NOT NULL,
    n_name character varying(250),
    n_description character varying(1000),
    n_config character varying(8000),
    created_by integer,
    created_on timestamp with time zone,
    updated_by integer,
    updated_on timestamp with time zone
);


ALTER TABLE public.tm_upstream OWNER TO postgres;

--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN tm_upstream.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_upstream.i_id IS 'ID Upstream';


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN tm_upstream.n_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_upstream.n_name IS 'Name';


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN tm_upstream.n_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_upstream.n_description IS 'Description';


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN tm_upstream.n_config; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_upstream.n_config IS 'Config';


--
-- TOC entry 175 (class 1259 OID 1119549)
-- Name: tm_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_user (
    i_id bigint NOT NULL,
    n_name character varying(100) NOT NULL,
    n_surname character varying(100),
    n_username character varying(100) NOT NULL,
    n_password character varying(255) NOT NULL,
    n_email character varying(50),
    n_phone character varying(50),
    n_company character varying(50),
    n_address character varying(250),
    c_active character varying(1) DEFAULT 1,
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_on timestamp with time zone,
    i_partner_id character varying(40)
);


ALTER TABLE public.tm_user OWNER TO postgres;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE tm_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_user IS 'User List';


--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.i_id IS 'ID User';


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_name IS 'Name';


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_surname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_surname IS 'Surname';


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_username IS 'Username';


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_password IS 'Password';


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_email IS 'Email';


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_phone IS 'Phone';


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_company; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_company IS 'Company';


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.n_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.n_address IS 'Address';


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN tm_user.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user.c_active IS 'Active Status';


--
-- TOC entry 172 (class 1259 OID 1119500)
-- Name: tm_user_authority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_user_authority (
    i_id integer NOT NULL,
    i_id_user bigint NOT NULL,
    i_id_authority integer NOT NULL,
    i_created_by bigint DEFAULT (1)::bigint NOT NULL,
    d_created_on timestamp with time zone DEFAULT now() NOT NULL,
    i_updated_by bigint,
    d_updated_on timestamp with time zone
);


ALTER TABLE public.tm_user_authority OWNER TO postgres;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 172
-- Name: TABLE tm_user_authority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_user_authority IS 'User and Authority Relation';


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN tm_user_authority.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_authority.i_id IS 'ID User Authority';


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN tm_user_authority.i_id_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_authority.i_id_user IS 'Referenced from tm_user.i_id';


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN tm_user_authority.i_id_authority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_authority.i_id_authority IS 'Referenced from tm_authority.i_id';


--
-- TOC entry 178 (class 1259 OID 1119588)
-- Name: tm_user_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tm_user_key (
    i_id bigint NOT NULL,
    i_id_user bigint NOT NULL,
    private_key character varying NOT NULL,
    public_key character varying NOT NULL,
    c_active character varying(1) DEFAULT 1,
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_on timestamp with time zone DEFAULT now()
);


ALTER TABLE public.tm_user_key OWNER TO postgres;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 178
-- Name: TABLE tm_user_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tm_user_key IS 'User Key List';


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN tm_user_key.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_key.i_id IS 'ID User Key';


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN tm_user_key.i_id_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_key.i_id_user IS 'Referenced from tm_user.i_id';


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN tm_user_key.private_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_key.private_key IS 'User Private Key';


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN tm_user_key.public_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_key.public_key IS 'User Public Key';


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN tm_user_key.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tm_user_key.c_active IS 'Active Status';


--
-- TOC entry 182 (class 1259 OID 1121964)
-- Name: tr_api_katalog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr_api_katalog (
    i_id integer NOT NULL,
    i_id_api_method bigint NOT NULL,
    n_name character varying(100) NOT NULL,
    n_category character varying(100),
    n_description character varying(512),
    n_url character varying(100),
    n_path_doc character varying(100),
    created_by integer DEFAULT 1 NOT NULL,
    created_on timestamp with time zone DEFAULT now() NOT NULL,
    updated_by integer,
    updated_on timestamp with time zone,
    request_header character varying,
    request_body character varying,
    header_schema character varying,
    body_schema character varying,
    status smallint,
    i_id_induk integer,
    n_config_route character varying(8000),
    n_title character varying(100),
    n_path_picture character varying(1000),
    i_id_upstream integer,
    is_snap smallint
);


ALTER TABLE public.tr_api_katalog OWNER TO postgres;

--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE tr_api_katalog; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tr_api_katalog IS 'Reference(s) Data of API Catalog';


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.i_id IS 'ID API Catalog';


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.i_id_api_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.i_id_api_method IS 'Referenced from tr_literal.i_id API Method';


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_name IS 'Name';


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_category IS 'Category';


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_description IS 'Description';


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_url IS 'URL';


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_path_doc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_path_doc IS 'Document Path';


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.status IS 'Status';


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_config_route; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_config_route IS 'Route Config';


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_title IS 'Title';


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.n_path_picture; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.n_path_picture IS 'Picture Path';


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN tr_api_katalog.i_id_upstream; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_api_katalog.i_id_upstream IS 'Referenced from tm_upstream.i_id';


--
-- TOC entry 174 (class 1259 OID 1119527)
-- Name: tr_app_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr_app_product (
    i_id bigint NOT NULL,
    n_name character varying(100) NOT NULL,
    n_description character varying(250),
    i_created_by bigint DEFAULT 1,
    d_created_on timestamp with time zone DEFAULT now(),
    i_updated_by bigint,
    d_updated_on timestamp with time zone
);


ALTER TABLE public.tr_app_product OWNER TO postgres;

--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE tr_app_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tr_app_product IS 'App Products References Data';


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN tr_app_product.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_app_product.i_id IS 'ID App Product';


--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN tr_app_product.n_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_app_product.n_name IS 'Product Name';


--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN tr_app_product.n_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_app_product.n_description IS 'Product Description';


--
-- TOC entry 169 (class 1259 OID 1119467)
-- Name: tr_authority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr_authority (
    i_id integer NOT NULL,
    n_auth_name character varying(50) NOT NULL,
    i_created_by bigint DEFAULT (1)::bigint NOT NULL,
    d_created_on timestamp with time zone DEFAULT now() NOT NULL,
    i_updated_by bigint,
    d_updated_on timestamp with time zone
);


ALTER TABLE public.tr_authority OWNER TO postgres;

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 169
-- Name: TABLE tr_authority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tr_authority IS 'Authority References Data';


--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 169
-- Name: COLUMN tr_authority.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_authority.i_id IS 'ID Authority';


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 169
-- Name: COLUMN tr_authority.n_auth_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_authority.n_auth_name IS 'Authority Name';


--
-- TOC entry 173 (class 1259 OID 1119517)
-- Name: tr_literal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr_literal (
    i_id bigint NOT NULL,
    n_category character varying(50) NOT NULL,
    n_name character varying(250) NOT NULL,
    e_description character varying(500),
    i_order smallint,
    c_active character varying(1),
    i_created_by bigint DEFAULT (1)::bigint NOT NULL,
    d_created_on timestamp with time zone DEFAULT now() NOT NULL,
    i_updated_by bigint,
    d_updated_on timestamp with time zone
);


ALTER TABLE public.tr_literal OWNER TO postgres;

--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE tr_literal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tr_literal IS 'Literal References Data';


--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN tr_literal.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_literal.i_id IS 'ID Literal';


--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN tr_literal.n_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_literal.n_category IS 'Category';


--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN tr_literal.n_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_literal.n_name IS 'Name';


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN tr_literal.e_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_literal.e_description IS 'Description';


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN tr_literal.i_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_literal.i_order IS 'Order';


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN tr_literal.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_literal.c_active IS 'Active Status';


--
-- TOC entry 170 (class 1259 OID 1119476)
-- Name: tr_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr_menu (
    i_id integer NOT NULL,
    i_id_parent integer,
    n_name character varying(50) NOT NULL,
    n_desc character varying(100),
    n_link character varying(100),
    n_image character varying(100),
    c_active character varying(1),
    i_created_by bigint DEFAULT (1)::bigint NOT NULL,
    d_created_on timestamp with time zone DEFAULT now() NOT NULL,
    i_updated_by bigint,
    d_updated_on timestamp with time zone,
    c_logged_in character varying(1) DEFAULT 0 NOT NULL
);


ALTER TABLE public.tr_menu OWNER TO postgres;

--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 170
-- Name: TABLE tr_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tr_menu IS 'Menu References Data';


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN tr_menu.i_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_menu.i_id IS 'ID Menu';


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN tr_menu.i_id_parent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_menu.i_id_parent IS 'ID Parent Menu';


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN tr_menu.n_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_menu.n_name IS 'Name';


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN tr_menu.n_desc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_menu.n_desc IS 'Description';


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN tr_menu.n_link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_menu.n_link IS 'Link';


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN tr_menu.n_image; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_menu.n_image IS 'Image';


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN tr_menu.c_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tr_menu.c_active IS 'Active Status';


--
-- TOC entry 179 (class 1259 OID 1119642)
-- Name: tr_nomax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr_nomax (
    i_id smallint NOT NULL,
    n_module_name character varying(50) NOT NULL,
    i_cur_id bigint NOT NULL,
    i_created_by bigint DEFAULT (1)::bigint NOT NULL,
    d_created_on timestamp with time zone DEFAULT now() NOT NULL,
    i_updated_by bigint,
    d_updated_on timestamp with time zone
);


ALTER TABLE public.tr_nomax OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 1158002)
-- Dependencies: 188
-- Data for Name: tm_api_hit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_api_hit VALUES (39, 1, '2024-08-05 00:01:35.245608+07', '967249489272742461272915600958810273');
INSERT INTO public.tm_api_hit VALUES (40, 1, '2024-08-05 00:27:39.188473+07', '967249489272742461272915600958810274');
INSERT INTO public.tm_api_hit VALUES (41, 1, '2024-08-05 00:28:14.250722+07', '967249489272742461272915600958810275');
INSERT INTO public.tm_api_hit VALUES (42, 1, '2024-08-05 01:13:54.316465+07', '967249489272742461272915600958810276');
INSERT INTO public.tm_api_hit VALUES (43, 1, '2024-08-05 05:37:46.325834+07', '967249489272742461272915600958810277');
INSERT INTO public.tm_api_hit VALUES (44, 1, '2024-08-05 05:51:33.914737+07', '967249489272742461272915600958810278');
INSERT INTO public.tm_api_hit VALUES (45, 1, '2024-08-05 06:03:49.909914+07', '967249489272742461272915600958810279');
INSERT INTO public.tm_api_hit VALUES (46, 1, '2024-08-05 06:45:45.870187+07', '967249489272742461272915600958810280');
INSERT INTO public.tm_api_hit VALUES (47, 1, '2024-08-05 06:47:21.929675+07', '967249489272742461272915600958810281');
INSERT INTO public.tm_api_hit VALUES (48, 1, '2024-08-05 10:42:52.231244+07', '967249489272742461272915600958810282');
INSERT INTO public.tm_api_hit VALUES (49, 1, '2024-08-05 10:45:11.058076+07', '967249489272742461272915600958810283');
INSERT INTO public.tm_api_hit VALUES (50, 1, '2024-08-05 10:48:19.716785+07', '967249489272742461272915600958810284');
INSERT INTO public.tm_api_hit VALUES (51, 1, '2024-08-05 10:52:12.812127+07', '967249489272742461272915600958810285');
INSERT INTO public.tm_api_hit VALUES (52, 1, '2024-08-05 10:54:37.202325+07', '967249489272742461272915600958810286');
INSERT INTO public.tm_api_hit VALUES (53, 1, '2024-08-05 10:56:04.374522+07', '967249489272742461272915600958810287');
INSERT INTO public.tm_api_hit VALUES (54, 1, '2024-08-05 10:57:26.512761+07', '967249489272742461272915600958810288');
INSERT INTO public.tm_api_hit VALUES (55, 1, '2024-08-05 11:00:33.774821+07', '967249489272742461272915600958810289');
INSERT INTO public.tm_api_hit VALUES (56, 1, '2024-08-05 11:03:00.482751+07', '967249489272742461272915600958810290');
INSERT INTO public.tm_api_hit VALUES (57, 1, '2024-08-05 11:06:37.745623+07', '967249489272742461272915600958810291');
INSERT INTO public.tm_api_hit VALUES (58, 1, '2024-08-05 11:09:48.527751+07', '967249489272742461272915600958810292');
INSERT INTO public.tm_api_hit VALUES (59, 1, '2024-08-05 11:11:14.351663+07', '967249489272742461272915600958810293');
INSERT INTO public.tm_api_hit VALUES (60, 1, '2024-08-05 11:13:29.05675+07', '967249489272742461272915600958810294');
INSERT INTO public.tm_api_hit VALUES (61, 1, '2024-08-05 11:14:40.460659+07', '967249489272742461272915600958810295');
INSERT INTO public.tm_api_hit VALUES (62, 1, '2024-08-05 11:17:25.004255+07', '967249489272742461272915600958810296');
INSERT INTO public.tm_api_hit VALUES (63, 1, '2024-08-05 11:21:11.238159+07', '967249489272742461272915600958810297');
INSERT INTO public.tm_api_hit VALUES (64, 1, '2024-08-05 11:39:38.094775+07', '967249489272742461272915600958810298');
INSERT INTO public.tm_api_hit VALUES (65, 1, '2024-08-05 11:42:13.450539+07', '967249489272742461272915600958810299');
INSERT INTO public.tm_api_hit VALUES (66, 1, '2024-08-05 11:48:18.89402+07', '967249489272742461272915600958810301');
INSERT INTO public.tm_api_hit VALUES (67, 1, '2024-08-05 11:50:00.304954+07', '967249489272742461272915600958810302');
INSERT INTO public.tm_api_hit VALUES (68, 1, '2024-08-05 13:14:07.91511+07', '967249489272742461272915600958810303');
INSERT INTO public.tm_api_hit VALUES (69, 1, '2024-08-05 14:07:59.327654+07', '967249489272742461272915600958810304');
INSERT INTO public.tm_api_hit VALUES (70, 1, '2024-08-05 14:08:37.437911+07', '967249489272742461272915600958810305');
INSERT INTO public.tm_api_hit VALUES (71, 1, '2024-08-05 14:09:04.810471+07', '967249489272742461272915600958810306');
INSERT INTO public.tm_api_hit VALUES (72, 1, '2024-08-05 14:59:04.111827+07', '967249489272742461272915600958810307');
INSERT INTO public.tm_api_hit VALUES (73, 1, '2024-08-05 15:02:34.867238+07', '967249489272742461272915600958810308');
INSERT INTO public.tm_api_hit VALUES (74, 1, '2024-08-05 15:06:10.122561+07', '967249489272742461272915600958810309');
INSERT INTO public.tm_api_hit VALUES (75, 1, '2024-08-05 15:08:22.593611+07', '967249489272742461272915600958810310');
INSERT INTO public.tm_api_hit VALUES (76, 1, '2024-08-05 15:09:20.445598+07', '967249489272742461272915600958810311');
INSERT INTO public.tm_api_hit VALUES (77, 1, '2024-08-05 15:23:09.061069+07', '967249489272742461272915600958810312');
INSERT INTO public.tm_api_hit VALUES (78, 1, '2024-08-05 15:48:57.163232+07', '967249489272742461272915600958810313');
INSERT INTO public.tm_api_hit VALUES (79, 1, '2024-08-05 15:55:25.630747+07', '967249489272742461272915600958810314');
INSERT INTO public.tm_api_hit VALUES (80, 1, '2024-08-05 15:56:03.873376+07', '967249489272742461272915600958810315');
INSERT INTO public.tm_api_hit VALUES (81, 1, '2024-08-05 16:51:00.77002+07', '967249489272742123412915600958810315');
INSERT INTO public.tm_api_hit VALUES (82, 1, '2024-08-05 16:51:50.615791+07', '967249489272742461272915608492758375');
INSERT INTO public.tm_api_hit VALUES (83, 1, '2024-08-05 16:53:11.746448+07', '967249489272742461272915608492754425');
INSERT INTO public.tm_api_hit VALUES (84, 1, '2024-08-05 17:01:39.297505+07', '967249489272742461272915608492792847');
INSERT INTO public.tm_api_hit VALUES (85, 1, '2024-08-05 17:07:11.701187+07', '967249489272742461272915608492794251');


--
-- TOC entry 3060 (class 0 OID 1145142)
-- Dependencies: 185
-- Data for Name: tm_app; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3055 (class 0 OID 1119718)
-- Dependencies: 180
-- Data for Name: tm_app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_app_user VALUES (3, 2, 'bdkiapps', 0, 0, '12345678', 10, '12345678', 'd0561382-3e94-4f73-823a-e7119d5b9024', '1WgosHEQrszpP4zpMAOGLSLgE6AHsaxn', '1', 1, '2024-08-05 00:41:12.113807+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (5, 2, 'last-test-apps', 0, 0, '12345678', 10, '12345678', '9f33b24e-e7f7-4d39-af8c-f6e52e1c99c5', 'sFm6H11VhDLVULVO0UcIUvnnxgX77UIQ', '1', 1, '2024-08-05 07:04:33.418781+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (6, 94, 'testing_Poc', 0, 0, '12345678', 10, '12345678', 'c4306c1e-df94-4baf-a6a3-5700a9811d13', 'lOuzHtQJvwCm0gSfHY6z8ZLvXHk5yLRH', '1', 1, '2024-08-05 08:50:25.558788+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (7, 94, '123456', 4, 1, '123456', 50, '12345678', '8900e49d-7dbb-4444-9d09-a97421d08cfa', 'PucNc677HY1CG01AhAPviUUWrKcqJclA', '1', 1, '2024-08-05 09:04:07.682275+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (8, 95, 'Test API', 0, 0, '12345678', 10, '12345678', '098acdc4-2c98-4be4-b012-ffd9ffe1f8e5', 'E8nrRVc94y0bUU0tVUXDbmbq2gMtpcY8', '1', 1, '2024-08-05 09:10:34.988968+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (13, 99, 'poc_felix', 0, 0, '12345678', 3, '12345678', 'f4042349-cdcf-4bc7-8160-11813a3942e4', 'pu1fa8CeAyD5IG1CKWgkcUx0cogysRGT', '1', 1, '2024-08-05 16:26:17.685776+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (4, 2, 'bdkiapps2', 0, 0, '12345678', 176, '12345678', '125becdf-2058-4949-91f1-a1f039739409', 'eR8KP3OELUik5B6d5N20NEmGjwEMJanS', '1', 1, '2024-08-05 01:33:58.904344+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (2, 2, 'primaapps', 0, 0, '12345678', 110, '12345678', 'b74755b1-685e-4fce-9a41-e2c5edc1c908', '0yoPIQYcTnwGPaxOPwadsHnuEDCRHICm', '1', 1, '2024-08-04 22:28:30.511192+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (9, 97, 'testing_poc2', 0, 0, '12345678', 9, '12345678', '929ba766-2401-4977-a62b-9222465eb15a', 'A4iqjAUr419HbicDbPSOvR3LjA7YnVDN', '1', 1, '2024-08-05 11:07:26.219195+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (10, 98, 'bjbs-poc', 0, 0, '12345678', 9, '12345678', 'acf0b77a-8d6a-4caf-9268-c64f4c3034a8', 'C76A7WAWlnc0X7LeXOYEehbQKBb6t1qI', '1', 1, '2024-08-05 11:30:40.056473+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (11, 99, 'poc_etikakl', 0, 0, '12345678', 10, '12345678', '12d88afe-b258-455c-a07f-3a4b08948a99', 'jcoe0PLKOTyt8uiJlU50OZbGTjxePcWv', '1', 1, '2024-08-05 11:45:12.928954+07', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_app_user VALUES (12, 100, 'FelixApps', 0, 0, '12345678', 1006, '12345678', 'ca70e316-dbc9-49d7-a2e0-65a6826d333c', 'nA1nonTh6zz9KDvXkh1hPr9n0xWuzjGE', '1', 1, '2024-08-05 13:35:50.332322+07', NULL, NULL, NULL, NULL);


--
-- TOC entry 3061 (class 0 OID 1153023)
-- Dependencies: 186
-- Data for Name: tm_app_user_hit_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_app_user_hit_log VALUES (2, 2, 100, '0001-01-01 07:07:12+07:07:12', 1, '2024-08-05 05:32:24.79224+07', NULL, NULL, NULL, '1');
INSERT INTO public.tm_app_user_hit_log VALUES (3, 4, 100, '0001-01-01 07:07:12+07:07:12', 1, '2024-08-05 05:32:48.987089+07', NULL, NULL, NULL, '1');
INSERT INTO public.tm_app_user_hit_log VALUES (4, 12, 1000, '0001-01-01 07:07:12+07:07:12', 1, '2024-08-05 16:33:47.474031+07', NULL, NULL, NULL, '1');
INSERT INTO public.tm_app_user_hit_log VALUES (5, 4, 100, '0001-01-01 07:07:12+07:07:12', 1, '2024-08-06 14:19:01.0936+07', NULL, NULL, NULL, '1');


--
-- TOC entry 3051 (class 0 OID 1119571)
-- Dependencies: 176
-- Data for Name: tm_app_user_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_app_user_product VALUES (2, 2, 36, 1, '2024-08-04 22:28:30.543717+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (3, 3, 38, 1, '2024-08-05 00:41:12.143412+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (4, 4, 39, 1, '2024-08-05 01:33:58.938698+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (5, 5, 41, 1, '2024-08-05 07:04:33.440379+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (6, 6, 5, 1, '2024-08-05 08:50:25.563576+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (7, 7, 5, 1, '2024-08-05 09:04:07.686419+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (8, 7, 39, 1, '2024-08-05 09:04:07.690217+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (9, 8, 5, 1, '2024-08-05 09:10:34.993271+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (10, 9, 39, 1, '2024-08-05 11:07:26.223888+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (11, 10, 42, 1, '2024-08-05 11:30:40.060986+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (12, 12, 42, 1, '2024-08-05 13:35:50.336031+07', NULL, NULL, NULL);
INSERT INTO public.tm_app_user_product VALUES (13, 13, 43, 1, '2024-08-05 16:26:17.689806+07', NULL, NULL, NULL);


--
-- TOC entry 3058 (class 0 OID 1126093)
-- Dependencies: 183
-- Data for Name: tm_app_user_request; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3059 (class 0 OID 1126160)
-- Dependencies: 184
-- Data for Name: tm_app_user_request_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_app_user_request_log VALUES (2, 1, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-04 22:29:31.166829+07', 1, '2024-08-04 22:29:31.166829+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (3, 1, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-04 22:31:03.932989+07', 1, '2024-08-04 22:31:03.932989+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (4, 1, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-04 22:39:03.481896+07', 1, '2024-08-04 22:39:03.481896+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (5, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 01:34:42.171721+07', 1, '2024-08-05 01:34:42.171721+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (6, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 01:37:06.551958+07', 1, '2024-08-05 01:37:06.551958+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (7, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 01:37:52.649719+07', 1, '2024-08-05 01:37:52.649719+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (8, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 01:42:37.9644+07', 1, '2024-08-05 01:42:37.9644+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (9, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 01:52:18.148386+07', 1, '2024-08-05 01:52:18.148386+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (10, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 02:37:35.856755+07', 1, '2024-08-05 02:37:35.856755+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (11, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 02:37:56.627811+07', 1, '2024-08-05 02:37:56.627811+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (12, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 02:41:22.379253+07', 1, '2024-08-05 02:41:22.379253+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (13, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:27:35.775567+07', 1, '2024-08-05 05:27:35.775567+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (14, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:28:55.74897+07', 1, '2024-08-05 05:28:55.74897+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (15, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:32:53.697148+07', 1, '2024-08-05 05:32:53.697148+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (16, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:39:22.359919+07', 1, '2024-08-05 05:39:22.359919+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (17, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:39:29.689072+07', 1, '2024-08-05 05:39:29.689072+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (18, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:40:08.618148+07', 1, '2024-08-05 05:40:08.618148+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (19, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:40:59.439704+07', 1, '2024-08-05 05:40:59.439704+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (20, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:46:40.24846+07', 1, '2024-08-05 05:46:40.24846+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (21, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:57:23.706331+07', 1, '2024-08-05 05:57:23.706331+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (22, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 05:59:55.46622+07', 1, '2024-08-05 05:59:55.46622+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (23, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 06:02:47.057991+07', 1, '2024-08-05 06:02:47.057991+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (24, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 06:08:06.917357+07', 1, '2024-08-05 06:08:06.917357+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (25, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 06:09:13.209346+07', 1, '2024-08-05 06:09:13.209346+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (26, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 06:09:53.962756+07', 1, '2024-08-05 06:09:53.962756+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (27, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 06:11:08.530593+07', 1, '2024-08-05 06:11:08.530593+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (28, 1, 2, 'user', 5, NULL, NULL, NULL, 1, '2024-08-05 07:04:51.564904+07', 1, '2024-08-05 07:04:51.564904+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (29, 1, 2, 'user', 5, NULL, NULL, NULL, 1, '2024-08-05 07:20:26.792375+07', 1, '2024-08-05 07:20:26.792375+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (30, 1, 2, 'user', 5, NULL, NULL, NULL, 1, '2024-08-05 07:20:42.859792+07', 1, '2024-08-05 07:20:42.859792+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (31, 1, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-05 07:24:14.146713+07', 1, '2024-08-05 07:24:14.146713+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (32, 1, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-05 07:25:03.970689+07', 1, '2024-08-05 07:25:03.970689+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (33, 1, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-05 07:27:22.776251+07', 1, '2024-08-05 07:27:22.776251+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (34, 2, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-05 07:27:33.736157+07', 1, '2024-08-05 07:27:33.736157+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (35, 3, 2, 'user', 2, NULL, NULL, NULL, 1, '2024-08-05 07:27:50.139154+07', 1, '2024-08-05 07:27:50.139154+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (36, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 08:50:42.540761+07', 1, '2024-08-05 08:50:42.540761+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (37, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 08:51:13.123412+07', 1, '2024-08-05 08:51:13.123412+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (38, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 08:51:51.603035+07', 1, '2024-08-05 08:51:51.603035+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (39, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 08:57:57.233513+07', 1, '2024-08-05 08:57:57.233513+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (40, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:06:49.869704+07', 1, '2024-08-05 09:06:49.869704+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (41, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:07:04.07046+07', 1, '2024-08-05 09:07:04.07046+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (42, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:10:47.190932+07', 1, '2024-08-05 09:10:47.190932+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (43, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:16:03.985697+07', 1, '2024-08-05 09:16:03.985697+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (44, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:16:38.599927+07', 1, '2024-08-05 09:16:38.599927+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (45, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:20:46.442146+07', 1, '2024-08-05 09:20:46.442146+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (46, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:23:05.234008+07', 1, '2024-08-05 09:23:05.234008+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (47, 2, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:23:18.488887+07', 1, '2024-08-05 09:23:18.488887+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (48, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:24:21.955576+07', 1, '2024-08-05 09:24:21.955576+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (49, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:26:10.916825+07', 1, '2024-08-05 09:26:10.916825+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (50, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:29:29.478703+07', 1, '2024-08-05 09:29:29.478703+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (51, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:31:09.658199+07', 1, '2024-08-05 09:31:09.658199+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (52, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 09:33:04.772363+07', 1, '2024-08-05 09:33:04.772363+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (53, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:33:45.92772+07', 1, '2024-08-05 09:33:45.92772+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (54, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:34:05.135306+07', 1, '2024-08-05 09:34:05.135306+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (55, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:35:31.745526+07', 1, '2024-08-05 09:35:31.745526+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (56, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 09:36:55.679936+07', 1, '2024-08-05 09:36:55.679936+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (57, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 09:42:37.260386+07', 1, '2024-08-05 09:42:37.260386+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (58, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 09:48:47.259342+07', 1, '2024-08-05 09:48:47.259342+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (59, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:06:31.991808+07', 1, '2024-08-05 10:06:31.991808+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (60, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:08:20.695616+07', 1, '2024-08-05 10:08:20.695616+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (61, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:09:17.375614+07', 1, '2024-08-05 10:09:17.375614+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (62, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:10:02.325647+07', 1, '2024-08-05 10:10:02.325647+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (63, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:17:20.288378+07', 1, '2024-08-05 10:17:20.288378+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (64, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:19:26.362102+07', 1, '2024-08-05 10:19:26.362102+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (65, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 10:22:42.883161+07', 1, '2024-08-05 10:22:42.883161+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (66, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:36:36.685267+07', 1, '2024-08-05 10:36:36.685267+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (67, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 10:39:06.455549+07', 1, '2024-08-05 10:39:06.455549+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (68, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 10:40:17.304495+07', 1, '2024-08-05 10:40:17.304495+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (69, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 10:41:16.256564+07', 1, '2024-08-05 10:41:16.256564+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (70, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 10:42:40.053327+07', 1, '2024-08-05 10:42:40.053327+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (71, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-05 10:44:02.73203+07', 1, '2024-08-05 10:44:02.73203+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (72, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 10:44:40.302221+07', 1, '2024-08-05 10:44:40.302221+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (73, 1, 94, 'user', 6, NULL, NULL, NULL, 1, '2024-08-05 11:04:35.51074+07', 1, '2024-08-05 11:04:35.51074+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (74, 39, 97, 'user', 9, NULL, NULL, NULL, 1, '2024-08-05 11:07:56.447757+07', 1, '2024-08-05 11:07:56.447757+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (75, 42, 98, 'user', 10, NULL, NULL, NULL, 1, '2024-08-05 11:35:45.352185+07', 1, '2024-08-05 11:35:45.352185+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (76, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 12:08:45.901077+07', 1, '2024-08-05 12:08:45.901077+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (77, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 12:08:58.140225+07', 1, '2024-08-05 12:08:58.140225+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (82, 42, 100, 'user', 12, NULL, NULL, NULL, 1, '2024-08-05 14:14:13.245205+07', 1, '2024-08-05 14:14:13.245205+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (87, 43, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:42:54.029222+07', 1, '2024-08-05 16:42:54.029222+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (92, 43, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 17:01:39.244332+07', 1, '2024-08-05 17:01:39.244332+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (78, 1, 95, 'user', 8, NULL, NULL, NULL, 1, '2024-08-05 12:09:10.069965+07', 1, '2024-08-05 12:09:10.069965+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (79, 42, 100, 'user', 12, NULL, NULL, NULL, 1, '2024-08-05 13:40:40.771391+07', 1, '2024-08-05 13:40:40.771391+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (83, 1, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:26:36.761228+07', 1, '2024-08-05 16:26:36.761228+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (88, 43, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:51:00.724512+07', 1, '2024-08-05 16:51:00.724512+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (91, 43, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:53:11.731805+07', 1, '2024-08-05 16:53:11.731805+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (80, 42, 100, 'user', 12, NULL, NULL, NULL, 1, '2024-08-05 13:56:26.543439+07', 1, '2024-08-05 13:56:26.543439+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (81, 42, 100, 'user', 12, NULL, NULL, NULL, 1, '2024-08-05 13:58:50.904997+07', 1, '2024-08-05 13:58:50.904997+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (84, 1, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:27:34.940962+07', 1, '2024-08-05 16:27:34.940962+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (85, 2, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:27:48.179595+07', 1, '2024-08-05 16:27:48.179595+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (86, 3, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:41:02.155614+07', 1, '2024-08-05 16:41:02.155614+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (89, 43, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:51:50.527188+07', 1, '2024-08-05 16:51:50.527188+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (90, 43, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 16:52:54.860127+07', 1, '2024-08-05 16:52:54.860127+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (93, 43, 99, 'user', 13, NULL, NULL, NULL, 1, '2024-08-05 17:07:11.611144+07', 1, '2024-08-05 17:07:11.611144+07', NULL, NULL);
INSERT INTO public.tm_app_user_request_log VALUES (94, 39, 2, 'user', 4, NULL, NULL, NULL, 1, '2024-08-06 14:17:35.992881+07', 1, '2024-08-06 14:17:35.992881+07', NULL, NULL);


--
-- TOC entry 3046 (class 0 OID 1119483)
-- Dependencies: 171
-- Data for Name: tm_authority_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_authority_menu VALUES (224, 2, 1, 1, '2024-07-24 21:55:16.331865+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (225, 2, 6, 1, '2024-07-24 21:55:16.469047+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (226, 2, 7, 1, '2024-07-24 21:55:16.474463+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (232, 2, 14, 1, '2024-07-24 21:55:16.646228+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (233, 2, 3, 1, '2024-07-24 21:55:16.681882+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (250, 1, 1, 1, '2024-07-29 15:23:55.006176+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (251, 1, 2, 1, '2024-07-29 15:23:55.01237+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (252, 1, 4, 1, '2024-07-29 15:23:55.017798+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (253, 1, 5, 1, '2024-07-29 15:23:55.022919+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (254, 1, 6, 1, '2024-07-29 15:23:55.029032+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (255, 1, 7, 1, '2024-07-29 15:23:55.03409+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (261, 1, 14, 1, '2024-07-29 15:23:55.16865+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (262, 1, 15, 1, '2024-07-29 15:23:55.174142+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (263, 1, 16, 1, '2024-07-29 15:23:55.180203+07', NULL, NULL);
INSERT INTO public.tm_authority_menu VALUES (264, 1, 3, 1, '2024-07-29 15:23:55.185932+07', NULL, NULL);


--
-- TOC entry 3056 (class 0 OID 1119786)
-- Dependencies: 181
-- Data for Name: tm_cms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_cms VALUES (78, 0, 1, 24, 'Registrasi', '', '', 'Daftarkan akun Anda untuk mengakses dan mencoba BJBS API.', '1', '2024-08-01 00:00:00+07', '2025-12-31 00:00:00+07', 1, '2024-08-05 13:55:23.553691+07', NULL, NULL, '\x', 'openapi');
INSERT INTO public.tm_cms VALUES (80, 0, 2, 23, 'Otomasi Lebih Fleksibel dan Efisien', 'https://192.168.100.251:39000/openapi/a48eea92-fe00-41fc-8046-17ecb4215188', 'a48eea92-fe00-41fc-8046-17ecb4215188', 'Akses informasi dan transaksi perbankan langsung dari platform kamu sehingga biaya operasionalmu menjadi lebih efisien untuk kembangkan bisnismu', '1', '2024-08-05 00:00:00+07', '2024-08-31 00:00:00+07', 1, '2024-08-05 14:28:20.494048+07', NULL, NULL, '\x', 'openapi');
INSERT INTO public.tm_cms VALUES (79, 0, 1, 25, 'Langkah - langkah ZURI API', 'https://192.168.100.251:39000/openapi/942c5b90-0752-43b9-911a-7a763b916e4c', '942c5b90-0752-43b9-911a-7a763b916e4c', 'BJBS API adalah layanan Bank BJB Syariah untuk memberikan kemudahan dalam menjalankan berbagai instruksi transaksi keuangan, seperti pengecekan rekening tabungan, cek mutasi rekening, transfer, dan lain-lain, langsung dari paltform/aplikasi/website kamu.', '1', '2024-08-01 00:00:00+07', '2025-12-31 00:00:00+07', 1, '2024-08-05 14:05:09.098816+07', NULL, NULL, '\x', 'openapi');
INSERT INTO public.tm_cms VALUES (77, 0, 2, 18, 'ZURI', 'https://192.168.100.251:39000/openapi/b7f1c20d-8d80-48f8-bce5-f57beab85e52', 'b7f1c20d-8d80-48f8-bce5-f57beab85e52', 'Partnership BJBS', '1', '2024-08-05 00:00:00+07', '2024-08-05 00:00:00+07', 1, '2024-08-05 11:54:17.131085+07', NULL, NULL, '\x', 'openapi');
INSERT INTO public.tm_cms VALUES (42, 0, 1, 18, 'pegadaian', 'https://192.168.100.251:39000/openapi/7a71c200-a98c-4d1a-a7b9-e7c21ba330cd', '7a71c200-a98c-4d1a-a7b9-e7c21ba330cd', 'pegadaian', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-07 04:57:04.980068+07', NULL, NULL, NULL, 'openapi');
INSERT INTO public.tm_cms VALUES (43, 0, 1, 18, 'gojek', 'https://192.168.100.251:39000/openapi/90022237-c7f1-4dc8-822a-3407a24cc721', '90022237-c7f1-4dc8-822a-3407a24cc721', 'gojek', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-07 05:00:13.421329+07', NULL, NULL, NULL, 'openapi');
INSERT INTO public.tm_cms VALUES (44, 0, 1, 18, 'kitabisa', 'https://192.168.100.251:39000/openapi/ba17a64d-54ba-4a3a-9e4c-1483e73bf5d0', 'ba17a64d-54ba-4a3a-9e4c-1483e73bf5d0', 'kitabisa', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-07 05:01:03.893591+07', NULL, NULL, NULL, 'openapi');
INSERT INTO public.tm_cms VALUES (45, 0, 1, 18, 'kredivo', 'https://192.168.100.251:39000/openapi/8eb576e6-8e4c-44b6-910b-41915a6cd8e9', '8eb576e6-8e4c-44b6-910b-41915a6cd8e9', 'kredivo', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-07 05:01:42.272021+07', NULL, NULL, NULL, 'openapi');
INSERT INTO public.tm_cms VALUES (46, 0, 1, 23, 'Otomasi Lebih Fleksibel dan Efisien', 'https://192.168.100.251:39000/openapi/91857c05-33cc-4698-9388-a5540fd21dbe', '91857c05-33cc-4698-9388-a5540fd21dbe', 'Akses informasi dan transaksi perbankan langsung dari platform kamu sehingga biaya operasionalmu menjadi lebih efisien untuk kembangkan bisnismu', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-07 06:04:28.096308+07', NULL, NULL, NULL, 'openapi');
INSERT INTO public.tm_cms VALUES (47, 0, 1, 23, 'Tidak Terbatas & Keamanan Tinggi', 'https://192.168.100.251:39000/openapi/024b9752-d482-4160-8c36-3be4eb8d9ba6', '024b9752-d482-4160-8c36-3be4eb8d9ba6', 'Layanan open banking dengan volume transaksi aplikasi nasabah yang tidak terbatas, didukung berbagai fitur keamanan dengan harga yang kompetitif', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-07 06:06:59.98813+07', NULL, NULL, NULL, 'openapi');
INSERT INTO public.tm_cms VALUES (48, 0, 1, 23, 'Integrasi Lebih Mudah dan Cepat', 'https://192.168.100.251:39000/openapi/d5618848-3b45-49ff-b1fd-5d5086ca1daf', 'd5618848-3b45-49ff-b1fd-5d5086ca1daf', 'Integrasi Open API lebih mudah dan lebih cepat karena menggunakan standar teknis integrasi yang sudah berlaku umum.', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-07 06:08:23.538618+07', NULL, NULL, NULL, 'openapi');
INSERT INTO public.tm_cms VALUES (56, 0, 1, 24, 'Create Apps', 'https://192.168.100.251:39000/openapi/36dced31-5403-4c2a-bb6d-3bec82859482', '36dced31-5403-4c2a-bb6d-3bec82859482', 'Pelajari dan temukan menu API yang paling cocok untuk bisnis Anda.', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-10 09:14:49.829912+07', NULL, NULL, '\x', 'openapi');
INSERT INTO public.tm_cms VALUES (57, 0, 1, 24, 'SIT Request', 'https://192.168.100.251:39000/openapi/fab7dd6b-2b39-4596-9318-3cee7311f562', 'fab7dd6b-2b39-4596-9318-3cee7311f562', 'Coba Open API dengan Get Token untuk membuat aplikasi bisnis anda.', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-10 09:15:31.658032+07', NULL, NULL, '\x', 'openapi');
INSERT INTO public.tm_cms VALUES (58, 0, 1, 24, 'Integrasi', 'https://192.168.100.251:39000/openapi/9addc285-1bed-40af-9c3d-c9aadee9363e', '9addc285-1bed-40af-9c3d-c9aadee9363e', 'Integrasikan Open API di platform bisnis Anda dengan kemudahannya dan selesai', '1', '2024-07-01 00:00:00+07', '2024-12-31 00:00:00+07', 1, '2024-07-10 09:16:23.972938+07', NULL, NULL, '\x', 'openapi');


--
-- TOC entry 3052 (class 0 OID 1119578)
-- Dependencies: 177
-- Data for Name: tm_sig_gen; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3062 (class 0 OID 1153484)
-- Dependencies: 187
-- Data for Name: tm_upstream; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_upstream VALUES (6, 'test-save', 'test-desc', '{"nodes":[{"host":"10.2.0.170","port":30120,"weight":1}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"builder-test","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (7, 'bjbs-upstream-tes-tdi', 'test-desc', '{"nodes":[{"host":"3453","port":34,"weight":45,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"bjbs-upstream-tes-tdi","keepalive_pool":{"idle_timeout":345,"requests":23345,"size":345}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (1, 'test-save-100', 'test-desc', '{"nodes":[{"host":"10.2.0.170","port":30120,"weight":1,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"test-save-100","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (5, 'test-save-201', 'test-desc', '{"nodes":[{"host":"10.2.0.170","port":30120,"weight":1,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"test-save-201","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (11, 'bjbs-upstream-tes-BA', 'test-desc', '{"nodes":[{"host":"3453","port":34,"weight":45,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"bjbs-upstream-tes-BA","keepalive_pool":{"idle_timeout":345,"requests":23345,"size":345}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (12, 'builder-testing-add-sore-tdi', 'test-desc', '{"nodes":[{"host":"10.2.0.170","port":30120,"weight":1,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"builder-testing-add-sore-tdi","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (14, 'bjbs-upstream-tes-api', 'test-desc', '{"nodes":[{"host":"3453","port":34,"weight":45,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"bjbs-upstream-tes-api","keepalive_pool":{"idle_timeout":345,"requests":23345,"size":345}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (15, 'api-middleware-tomcat', 'test-desc', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1,"priority":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"api-middleware-tomcat","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (16, 'bjbs-upstream-tes-sore-tdi', 'test-desc', '{"nodes":[{"host":"56756","port":23,"weight":34,"priority":34}],"timeout":{"connect":60,"send":60,"read":60},"type":"least_conn","scheme":"http","pass_host":"pass","name":"bjbs-upstream-tes-sore-tdi","keepalive_pool":{"idle_timeout":3,"requests":232,"size":34}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (17, 'bjbs-upstream-tes-bjbs222', 'test-desc', '{"nodes":[{"host":"234","port":43,"weight":34,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"bjbs-upstream-tes-bjbs2","keepalive_pool":{"idle_timeout":23,"requests":34,"size":42}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (18, 'builder-testing-tdi-v233', 'open api description', '{"nodes":[{"host":"12321","port":80,"weight":8,"priority":1}],"timeout":{"connect":60,"send":60,"read":60},"type":"ip_hash","scheme":"http","pass_host":"node","name":"builder-testing-tdi-v233","keepalive_pool":{"idle_timeout":3,"requests":1143,"size":45}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (23, 'api-middleware-tomcat-pre-poc-1', 'pre poc 1', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-tomcat-pre-poc-1","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (19, 'test-save-143', 'open api description', '{"nodes":[{"host":"12454","port":54,"weight":54,"priority":1}],"timeout":{"connect":60,"send":60,"read":60},"type":"ip_hash","scheme":"https","pass_host":"pass","name":"test-save-143","keepalive_pool":{"idle_timeout":43,"requests":432,"size":23}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (9, 'bjbs-upstream-tes-simpanv2', 'test-desc', '{"nodes":[{"host":"3453","port":34,"weight":45,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"bjbs-upstream-tes-simpanv2","keepalive_pool":{"idle_timeout":345,"requests":23345,"size":345}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (24, 'upstream-bank-dki-test-1', 'poc', '{"nodes":[{"host":"x8ki-letl-twmt.n7.xano.io","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"upstream-bank-dki-test-1","keepalive_pool":{"idle_timeout":"60","requests":"1000","size":"320"}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (20, 'api-middleware-tomcat-pre-poc-1', 'pre poc 1', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-tomcat-pre-poc-1","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (21, 'api-middleware-tomcat-pre-poc-2', 'pre poc 2', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-tomcat-pre-poc-2","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (13, 'bjbs-upstream-saving', 'test-desc', '{"nodes":[{"host":"3453","port":34,"weight":45,"priority":0}],"timeout":{"connect":60,"send":60,"read":60},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"bjbs-upstream-saving","keepalive_pool":{"idle_timeout":345,"requests":23345,"size":345}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (22, 'api-middleware-tomcat-pre-poc-1', 'Upstream Middle Tomcat', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-tomcat-pre-poc-1","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (25, 'upstream-bank-dki-test-1', 'poc', '{"nodes":[{"host":"x8ki-letl-twmt.n7.xano.io","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"upstream-bank-dki-test-1","keepalive_pool":{"idle_timeout":"60","requests":"1000","size":"320"}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (26, 'upstream-bank-dki-test-2', 'pre poc 1', '{"nodes":[{"host":"x8ki-letl-twmt.n7.xano.io","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"upstream-bank-dki-test-2","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (27, 'bank-dki-upstream-1', 'poc', '{"nodes":[{"host":"x8ki-letl-twmt.n7.xano.io","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"bank-dki-upstream-1","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (28, 'bank-dki-upstream-2', 'poc', '{"nodes":[{"host":"x8ki-letl-twmt.n7.xano.io","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"bank-dki-upstream-2","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (29, 'api-middleware-poc', 'poc', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-poc","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (30, 'api-middleware-tomcat-pre-poc-1', 'pre poc 1', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-tomcat-pre-poc-1","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (31, 'api-middleware-tomcat-pre-poc-1', 'pre poc 1', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-tomcat-pre-poc-1","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (32, 'api-middleware-tomcat-pre-poc-1', 'pre poc 1', '{"nodes":[{"host":"api-middleware","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"api-middleware-tomcat-pre-poc-1","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (33, 'bank-dki-upstream', 'Upstream Untuk Bank DKI', '{"nodes":[{"host":"x8ki-letl-twmt.n7.xano.io","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"bank-dki-upstream","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (34, 'middleware', 'upstream middleware', '{"nodes":[{"host":"api-middleware","port":8080,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"pass","name":"middleware","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);
INSERT INTO public.tm_upstream VALUES (35, 'upstream-bank-dki', 'upstream bank dki', '{"nodes":[{"host":"x8ki-letl-twmt.n7.xano.io","port":80,"weight":1}],"timeout":{"connect":6,"send":6,"read":6},"type":"roundrobin","scheme":"http","pass_host":"node","name":"upstream-bank-dki","keepalive_pool":{"idle_timeout":60,"requests":1000,"size":320}}', NULL, NULL, NULL, NULL);


--
-- TOC entry 3050 (class 0 OID 1119549)
-- Dependencies: 175
-- Data for Name: tm_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_user VALUES (2, 'prima27', 'prima27', 'prima27', '$2a$10$yxw1/1PHcEJugKB4Gb/4pubkoR52nFjdfUr2Ks5xJJTz8wy.Dg60K', 'prima27@gmail.com', '082123', 'PT Prima', 'Jalan Prima', '1', 1, '2024-08-04 22:15:42.929298+07', NULL, NULL, '939cf969-b8a4-4d17-9194-ebd48e9526aa');
INSERT INTO public.tm_user VALUES (92, 'tabeldata2024', 'tabeldata2024', 'tabeldata2024', '$2a$10$YxwLofKAO4ta2vCWQ18XzeLfUO7dFnZuVQFkWIUFzFDntsZhABfAe', 'tabeldata@gmail.com', '082128372817', 'tabel data informatika', 'pratisata raya', '1', 1, '2024-08-05 02:52:14.057435+07', NULL, NULL, '1e1cf66e-bf46-4652-b866-1a4f2a39856c');
INSERT INTO public.tm_user VALUES (94, 'Testing POC 2', 'poc', 'testing_poc2', '$2a$10$KUJjqZovu2xw5sySDGrJNe9cSJh9Vx1VZKvhLNQR.Z3DU7vZuQlhS', 'poc2@gmail.com', '0866877787756', 'Tabel Data Informatika', 'Jl.Pratista Raya', '1', 1, '2024-08-05 08:49:53.653425+07', NULL, NULL, '235a2ef8-12ce-4c2b-af8b-af43761850bf');
INSERT INTO public.tm_user VALUES (95, 'Prima Tenant', 'prima', 'prima_tenant', '$2a$10$woV4pfm0515Qa5XsJeZIjuzO8kmc0ju5NCwkjhFMCWO7gtc/kd/sK', 'prima@gmail.com', '085875074351', 'PT. Tabeldata Informatika', 'Jalan. Pratista', '1', 1, '2024-08-05 09:10:00.529592+07', NULL, NULL, '1064c3c4-2ed7-49a4-876d-0b009d73a8a7');
INSERT INTO public.tm_user VALUES (96, 'tenant-tdi', 'tenant-tdi', 'tenant-tdi', '$2a$10$9sru3gtu.GOFE6E4bfXPUOkDEfGTgAdatc1FiOLcnIUVJzgdXEoQW', 'tenant@gmail.com', '0821837192', 'PT Tabel Data', 'Jalan Pratista Raya', '1', 1, '2024-08-05 10:04:48.030741+07', NULL, NULL, '1164c3c4-2ed7-49a4-876d-0b009d73a8a7');
INSERT INTO public.tm_user VALUES (97, 'Etika ', 'POC', 'poc_etika2', '$2a$10$KSmm8f0fp/mohN0Yd8/OGurx2WhaP9OoJu7NUUVgxLJHGM/BZPX6K', 'etikapoc@gmail.com', '08564379869', 'Tabel Data Informatika', 'Jl.Pratista Raya', '1', 1, '2024-08-05 11:06:45.23245+07', NULL, NULL, '1264c3c4-2ed7-49a4-876d-0b009d73a8a7');
INSERT INTO public.tm_user VALUES (98, 'shafira', 'bjbs', 'bjbs_shafira', '$2a$10$uZT78oB.Haq4A/2KGOI3iOCYzOP..kaSL9lVrvkwOx02ZEL1rTYai', 'shafira@gmail.com', '0876754678', 'BJBS', 'Jl.Braga', '1', 1, '2024-08-05 11:28:07.85841+07', NULL, NULL, '245a2ef8-12ce-4c2b-af8b-af43761850bf');
INSERT INTO public.tm_user VALUES (99, 'Etika Khusnul Laelii', 'Laelii', 'bjbs_tenants_poc', '$2a$10$B/DrdVFwQloiQi78FGExSedrCd7aeaZNNiZpVah3gKdTx3k5jHvnu', 'etikakl@gmail.com', '086543565676', 'tabel data informatika', 'pratisata raya', '1', 1, '2024-08-05 11:44:13.082919+07', NULL, NULL, '255a2ef8-12ce-4c2b-af8b-af43761850bf');
INSERT INTO public.tm_user VALUES (100, 'Felix Noviantoro', 'Noviantoro', 'tenant_felix', '$2a$10$esrE.ALAL7TLZujwfuaj5uPv1.Da3NDQ/us957c5GBubxlddNJf8C', 'felix@gmail.com', '082198453645', 'Tabel Data Informatika', 'Jl.Pratista Raya', '1', 1, '2024-08-05 13:35:20.634693+07', NULL, NULL, '265a2ef8-12ce-4c2b-af8b-af43761850bf');
INSERT INTO public.tm_user VALUES (101, 'Prima Jatnika', 'prima', 'prima271995', '$2a$10$ghz4Cwe2XrBqtpQr/p0On.awF.oLXeGAh..rJ.ntR5HI7lIM4xbHm', 'prima_jatnika@gmail.com', '0899937172723', 'PT. Tabeldata Informatika', 'Jalan. Pratista Raya', '1', 1, '2024-08-07 12:09:59.06494+07', NULL, NULL, 'cb3cd8e7-edad-49d3-aa72-dcf27a5ff14c');


--
-- TOC entry 3047 (class 0 OID 1119500)
-- Dependencies: 172
-- Data for Name: tm_user_authority; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_user_authority VALUES (1, 2, 2, 1, '2024-08-04 22:15:42.934285+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (4, 92, 1, 1, '2024-08-05 02:52:14.079774+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (6, 94, 2, 1, '2024-08-05 08:49:53.658452+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (7, 95, 2, 1, '2024-08-05 09:10:00.534665+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (8, 96, 2, 1, '2024-08-05 10:04:48.035629+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (9, 97, 2, 1, '2024-08-05 11:06:45.237284+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (10, 98, 2, 1, '2024-08-05 11:28:07.864124+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (11, 99, 2, 1, '2024-08-05 11:44:13.088161+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (12, 100, 2, 1, '2024-08-05 13:35:20.639234+07', NULL, NULL);
INSERT INTO public.tm_user_authority VALUES (13, 101, 2, 1, '2024-08-07 12:09:59.517411+07', NULL, NULL);


--
-- TOC entry 3053 (class 0 OID 1119588)
-- Dependencies: 178
-- Data for Name: tm_user_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tm_user_key VALUES (1, 2, '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAv32wOoN2Yn0YDGlM1pVQSjKWKaPXPCeWkwl5E1+8UM0RPFuX
k4wMqWM1+8nklom/Le6X3GTyQ1ZwD+lDOqsTCqgjG2E4ZMHsSghXxcF7Y64lIRrL
sHLk3xSptkLLP7bztccHY/upfGKd9IyLFup/fSf2+Y9FSXa7IMuf1r5I+ZxhCQIx
Kviojw/mWT9F2qBtyil5rE36DRNyWIQcwyh5Qw/7uWM6pNVp2znVl7APCPwTj+qx
4Rqjk1qO3MHhOAhIFG0iN5d18UR8xwFMPHhGcWH+sCc+7G3kWAPECF4El6R0aRsF
mBA+TvwBq9kw330KAF74a8gjqYWDpJ7jERO8xQIDAQABAoIBADuChRT6K/1ZoPKi
euWpC4WziOUx7L7eErZpWD5EH1MBF90pHccV3A18LpesW6TI9CgDISC2Im/42eSn
+mOuLMHAFQD6SrtNZPBw/U4Q3hbRVOqf2DNi0WvekQt6YI3RfpW8X7ibykVEpJAO
aV9ayvoLRH60HrVA99CuV2M2SZmAjSMt2qdJ7y96F9IuPlrVqXHkDJ948Dt8WGSG
IpBmC1gW6zIb9zy/ZTstOimGVlEitToud+HS4jp0zh9umkWrKhlcpCqjHLW6Nbyx
kvwK1cqh6r+Z30WDA+7wyOKBrV5HOLwIfcKOLQ+PYIaUUfwp8s3WUB7fM2VMr6iD
1SZOv4ECgYEA2BoH3K3QhVXBozyUwnfLrggpbo0gvNdwPuWhbYHODzAPjDHnK667
FPHKqnAJZqYArZcGLVxzXRn4QkSO7tJZbx9D5JMsWGmFOplDN6iYZ7d5tMz6aaLa
A+hKYRmeovw8VlE7poGEfooANL5KlJdbivHAqMmxOd6V4o/5ysYwwSECgYEA4thw
7InenQ2siocQmENE6hjV6sY3YuMZkW50Vk7Oq+kq52cd0lfL5jGdQZG0df178/6n
Oos66gwksISU6oZ+/7cFf93ekrQrD1ysLFA6f0TG+ZzuBpRfzxDt/cvCkBoF4BXf
BagTHP/qcO70RuEmpnCIPWSIiW4Fugc9Y66GcyUCgYAq3OboT5WHjN3uicqb0/UT
XM0S/20Z58V8xEFDnjaH7ql2zkMi9/Jlkhv3uGc09AI4bDcuciLzuX3zbvPGzPQu
RU5LHSHzm2JwoAukE42/LLY4NVwJ7eI+Wim+nr1HaK5zFIO3YAMusiKeU4wpcugW
ZCMpl2/OoaarHJGYNb1f4QKBgChpPHy29uRtmi43b3pgiXdWo00msJk6McTZs3no
oiK37/+3O/XL1DQW5JfYuBhI5vsJg4sHYKBvN14G0GyTNy6g0Sb9RHhIBl+/N6DR
Tgp8GyI+lZywc/z0XCFZWjjHmgJYgxmD3pvM71vdBcFWvMbrxymArl4lLnn8bjBC
2ArNAoGAF9cgBnQgFs0pWQms3cKT5baZjiKKdNXGnuX/eu1avJ1jyOgUx/1zudWk
dVKC7mQHfLhD+Hyza7e5XqR0j3eQQoHnPqv4jU4ELAJ8g/RFWXHaEivDP3mE8Nt8
AJFd4hrpAuY6+okOrERs5P+ES1tGsUnK8s54CKfEkC4BgTebgxw=
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAv32wOoN2Yn0YDGlM1pVQSjKWKaPXPCeWkwl5E1+8UM0RPFuXk4wM
qWM1+8nklom/Le6X3GTyQ1ZwD+lDOqsTCqgjG2E4ZMHsSghXxcF7Y64lIRrLsHLk
3xSptkLLP7bztccHY/upfGKd9IyLFup/fSf2+Y9FSXa7IMuf1r5I+ZxhCQIxKvio
jw/mWT9F2qBtyil5rE36DRNyWIQcwyh5Qw/7uWM6pNVp2znVl7APCPwTj+qx4Rqj
k1qO3MHhOAhIFG0iN5d18UR8xwFMPHhGcWH+sCc+7G3kWAPECF4El6R0aRsFmBA+
TvwBq9kw330KAF74a8gjqYWDpJ7jERO8xQIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-04 22:15:43.72293+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (4, 92, '-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA0KMDc71gGe4h2WuylYlCL4ehEu1+vhlKEYy3JgZZyy3mrMqe
cOEL0ajJtQj9Pv1ZQzJJHM7Hdn9bct05j0MLYrVh33OI0Tj9sK5eojkoxikHpE/1
muGsQY8cVQWAqd/MHDtXPKKCuSd9orB8uBUj0EYn6DZMcP4/8RzezWfHCnfWTOJs
U4Fv8A5BR7SUth2a3xeEgSXbOfFQEFbgYVZsOSOVGf0p8bwO2wmsFVR+/0hRRGYx
oSTpxHj4eD/9wSGEaIv/nBFvhwBD47TsiG+NhABU3nuoT22vNvwYPkOCjO/ThNI4
GClCAFWF0qmAIOtn2qDlt/NWKCtHmfuzHfbrFQIDAQABAoIBAEJyKD9MKLcZaB5e
dlm5hSKuB1aH3L2eQECmmA28KAzVaYnOXfeFNMZpAxRs8HqHJU6JTU+na08J8I38
dsBxkca2DZ2kpgY8KE+EuQ7hNWMm3hAuhwH0rW+TrGpHflqbs92p6HafKxLcyN5v
ZskZsnY6YatK3718u9CGaU7xpipmvNc2CXL6Btqb0/5h7hQlfav01wkfTKNIL+IA
rg7uz8xFX8inmmxNS6I3uZbMQBBOor4I2WTeip9LywOBkZYnkLnEURVI2Yp12tzt
ojtPfy5+T4/lWcYD+/ymZo9cSVBUZ7x8I3HeiGMbnppiGfLAE79jfY9QXu8j1BQd
RUp+jAECgYEA6vTrhYfi1AC5tTEJb28xypZ5VY42B4L+gFVhBV5tV8JSCFsdDvxj
GE4XV4d4MLO+UrA0Dn04sB5Bd8jf3SCwQ0mrn6jOZ1NLffKMBfsa+KY3tPoLMEYD
GGU7Lig/aRY8e9EKJjtdYUbImBQHwXy2wMgTAOXiDFEXoIMVnjcf9+ECgYEA41Kh
beWUSKuw/sQTS9zOv0pzj9H9ALiOsDTSI24ZE71OBEhA6fKagmFW28jCnKN44kMz
hJp0bLL9+ZRvE9/QpIByJiMGA77y0a65pAOLyycDbGZ9GywUtTq29vepVBV9X+7/
5ujXVJYtb2NerKAoZ+N3EaC807UXu/13+L5dybUCgYASlc0LgvQuUOBftMFKT0Fh
BQYT/mvHrFT1Ucua4R1FE9npT0u9I7my8npmMhEPySgE4ms7uiwBwmLrVrhehXdr
2yf4OSIaijwuekEZOAOqJ3vAlQbNirwz8c38mLJrXZbrNF3ZKFj6mN7FKNB0Pak3
FpxqNcTrtH5p8/SBz1p4AQKBgBmYTSrFhaulATm+M/n/s5ugM2DHIPh6zz4RxHNO
yy4Iy4b5560vrqvtb80xTpA6a7r2HA/bIC64/JWkW9leAuzytWeL2/qB/m8TgD1y
VMQb8Wu8Imvzy6UYJk+qVPttq/8oNtH194DDo/v9sUQ4iDQiTV7DvV8M7c4x3Nc5
/+9dAoGBALpEvnbftTZvLlG9vYdvmjMY1CF/Cnj8MMXGjepBNoxsHItP+clnNs3y
KrUdBrmwRrMkHlpbbL98kV7PNej5yjgZzgxyPsFsZ6SV0eUIc2USqtAAFPCf2Ilm
9F1bzY/V9Nc4KHhrVu6K+0QD99bdt+qGhQX7YLCqEg4JzqBLxG4s
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEA0KMDc71gGe4h2WuylYlCL4ehEu1+vhlKEYy3JgZZyy3mrMqecOEL
0ajJtQj9Pv1ZQzJJHM7Hdn9bct05j0MLYrVh33OI0Tj9sK5eojkoxikHpE/1muGs
QY8cVQWAqd/MHDtXPKKCuSd9orB8uBUj0EYn6DZMcP4/8RzezWfHCnfWTOJsU4Fv
8A5BR7SUth2a3xeEgSXbOfFQEFbgYVZsOSOVGf0p8bwO2wmsFVR+/0hRRGYxoSTp
xHj4eD/9wSGEaIv/nBFvhwBD47TsiG+NhABU3nuoT22vNvwYPkOCjO/ThNI4GClC
AFWF0qmAIOtn2qDlt/NWKCtHmfuzHfbrFQIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 02:52:14.390212+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (6, 94, '-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA3eGBpxpdUft0C7Ho/l02MgQ/B0MNlkkunynUinNxWEEBCjiW
Ug1Wkc/nkOk8MQxsp/0X6ygpfGwGTtv1c/HKn/EntUeE1mVkNTNUfIX0llOQ3SOL
5mn0WvbqXIRq2cx8iSb9R/3F+C7ji7p7cEWaaEPWLd7TfF1N/BpOu7IukDDhGBwD
8Blu84qtS6cx/Oyde6aWPaNKkVMQPnGfPQIf+XwBNX9suY6192+Zg0bHczANR1y5
ypMXE4+zFD1iccGPnUkYZGDg4Jszox2QmxCvJP+zAAoOIDOv8txEZHk1xQBZxXms
aDdCyLXyEo2t8DLHOUpkURrFoGxRk/PPEzXTrQIDAQABAoIBAQCNkytgTYFII1Mr
dyy8yQsgpPb2kkFkKHP4GP/GC91Bu9CHDg5UcrBPP8J5A2llvpDCK8sMQEcgXek0
fkNC5QAuR/jXQbgv+OgUzhjVj7+9/7pKcDj/H5JMTIrD17Y6HLFF7jvkqLeeIYUN
jkLfI3pflxFdmXWGQB7Xgo3EU/BEDcvjU9wA4RwWYseE8SLE+ieFj8ORTRbAI4w7
KT14DFXP9qjadJknY1z5srfjgSp2rNJFCYZTAPwzVp1EX5/NCu9nc7CXDy39GZjH
vn+Efl5wsTLz7nVT+2RXp9TtyTG9tiz+Gt0qk1Hlt+9yp3HyjdR+KJC4EAMsWL8a
e1XkUCchAoGBAOVPP9TcKr7o7pL1WtSNL3GrwKfFARNOkL6jR05AXR9F/Sxvs18l
eX4OVpzpruiavrMssKaaevUFQehTrdSFGvwYck6AU5ssPxBqRzXvz6UbAWwux0ji
YBraFYIRn0r16dJN+kWbE3gKXjtOvxlNOcxRTPnU+B7YcwIh0CI/PA+FAoGBAPe0
53oPhh6WgJ23DRWk5V7lI7NpqVwdAN7F59Wr5D/C2jhc+ya7xKCYSLvqG7l0LSXo
3ZSlC55b/GdR9oSMNSvUZ6nWiTwN/95tkdxRoUUb5u4JYk2H6/U3dVcWpDf9C7OJ
ZiWjErvBwOlurSIHPqc+hdTOcjRMl+VNgM4zYqgJAoGAYygArxfBOCpbN5r2+uBO
OrYNKb7Ld0DK4FSUeeblHafTEUr/4k2/Gl4y38lAw/5eJfZWMMSuFJOAa2j7yuD/
yTD9BKsC/B+G6Z87Sbx4Kqnh1Jjpvb991T6mfEcIfY6W3ESxyzWClq7NDpI/mj5F
lu80/Pc1j4kDOlHKwXRckU0CgYEAqeYcCt2Q+XPzPbnrMJhMdt0lso5bioGeMi5+
CFGBGba1ZIlp/jQ19ozc/n7hiz9DJEhniuf1YyXmpptSQbHFWo2ymIw8zsMvZ8mx
jPM0cSllKImpMlJzJltmkVhHRNu8ZeVs+Y2zcLLBdZrjB37+m0nIE6GSNYr/eFjD
aytVlLkCgYBBilH/hJsHZdYkuWZ3Vtd5QDTZ97Q9r4luWZZ60Pte4tCw4IIIxjhT
TtAnuQCMCsW1mBA1HA5+aSQLxOOfxCLivWQt2kkso/EUvRSYvsv8avItyPVkEZyR
CEDi/TgAc3tBP6887ZecnhWWvpK7Pc3ifXIjWqLjbJhW/ttwJ0Mh0w==
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEA3eGBpxpdUft0C7Ho/l02MgQ/B0MNlkkunynUinNxWEEBCjiWUg1W
kc/nkOk8MQxsp/0X6ygpfGwGTtv1c/HKn/EntUeE1mVkNTNUfIX0llOQ3SOL5mn0
WvbqXIRq2cx8iSb9R/3F+C7ji7p7cEWaaEPWLd7TfF1N/BpOu7IukDDhGBwD8Blu
84qtS6cx/Oyde6aWPaNKkVMQPnGfPQIf+XwBNX9suY6192+Zg0bHczANR1y5ypMX
E4+zFD1iccGPnUkYZGDg4Jszox2QmxCvJP+zAAoOIDOv8txEZHk1xQBZxXmsaDdC
yLXyEo2t8DLHOUpkURrFoGxRk/PPEzXTrQIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 08:49:54.15998+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (7, 95, '-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAww1McGJ7RZrxcwnlG93hnPJWBVLWQlc9Gu1LDywW5nvFSIgb
omfb++lQT2kchHZDZwkUfQOWmYnzru4WRHTgDLlvuDOvnJhIb046zgJIUA3SVUEY
AGO8wR97vpslNG36tNdBpey0JUqdKp1mRV/TaDueBkgtWOHT3P3hA0ZXBROe1zKQ
fHwKWLp8hIS6ZZJCOjt5DVT6loQz3F47HhKyGiObVVS2iMWNV4jvfE/2kCaeF2jw
hpSgG/m+2UQb1XIp0mGSRknanoB+A3LuAV2TAErTk+re5TmvxZEl0DB1hH+IHsMQ
G1oyr3uCI+DN1wxhsFo0ivoDewfwcbv3Va89EwIDAQABAoIBAQCu/IBGFuP2tyHE
De2ACZf9gJ9RmVZlH/TO8nGzQ9+rmQCNqKX6FmkR3+fPxkHySFMB3fCGkzCJwGxg
1HIfqibS443p2FzFBQ1+5dT1urB7OVsoZwSMXO4a6A7RGkjPd5dCpBbeL7QR/JVx
hNIajPSRf2KuyhP8uGSkzxMOKA2rm7P0seBPXPpXDH+NEvqfjdewfvrBkudPTAOg
PrPPe2n9BEs/1nlry1nJK5uP0WeXnBYOcHxuNVf2+/zpf/udcmZODl0o77UunMsj
F02A0dnMbYdyB1GaTi99CnHlvxP1o2e9+EmCQvkS1t5RqnST887MYnJqPwZGa3HH
8sy2SezhAoGBANLH6ZHndRxbLU4y1nktRf/tYjuHarRSVBrCDzYnC4VTln3QiH/n
OxPRHwAPOD1OnlkjPHgeu/W3Gu8alOEOJHjd22GHITOuU6g9MbW4G5su6J1jIQOj
uudrevkkjkyCBtL+PJ7F+jBBxHAGy2n2hmI37AooDu/trtn/b1tumigjAoGBAOzl
jTyG7D+65ST6HOKmkFEp5S2elkaEnUBqN99o8ZSwXsKhZHHxCg5t1mW4nWkXpat1
2q3NK/+JiVqS1st/pdZCXBbuDH5ZBs/K2c2CfsvwuABVB196keKQCwYdK950l1iD
cjPlA9ypbXsxg5d2eRbNo6TF6nFYswVfTvYxiO5RAoGAC5kAWwzXPsYtif32GxjI
nzpai1f6IQ3entJKr/oaAi4FO8r7l74LXB3HjONJfuYShGkR7LIUOYLnsnxN8Mws
aZIbfhRHWWagJ8OmNo94xWMhXXeU23Ro1k7tp0PBqKgG5BklEL9n8rvLqTZWfvAX
mNPm4vAtUjpLwqbxY6CETu0CgYBHnU2JErCww2sqNoIs8nWGU8f4doyvXL+9DV8+
ppcBgB/lbqzS1S9ZFVNPBPRxJLjskIA/MlsusQFY5DMS6c/UadM1C1mziG5KuuQF
AIIcXPUDBLFp57/aYfkzK/ZrFYv7MiGAFqeIOZ/jMiC51RLeFeR2l248PbhA04Mn
YeonQQKBgDnYZznPCllJgnAy7g6t96pFTtAWrEb5bl/4Q34O9i95hFiddD5PVq6B
3FcFtkykxWe9r6kOXtVuo1HqU43P2s0aHNr9P84de/Ydz6XRiVsOS1cgrfQ1ZVnV
JpdE2FzJhnSDRXXih3EDLQt3YL6bXQsfHKjkc75+v9ssrC1bIEML
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAww1McGJ7RZrxcwnlG93hnPJWBVLWQlc9Gu1LDywW5nvFSIgbomfb
++lQT2kchHZDZwkUfQOWmYnzru4WRHTgDLlvuDOvnJhIb046zgJIUA3SVUEYAGO8
wR97vpslNG36tNdBpey0JUqdKp1mRV/TaDueBkgtWOHT3P3hA0ZXBROe1zKQfHwK
WLp8hIS6ZZJCOjt5DVT6loQz3F47HhKyGiObVVS2iMWNV4jvfE/2kCaeF2jwhpSg
G/m+2UQb1XIp0mGSRknanoB+A3LuAV2TAErTk+re5TmvxZEl0DB1hH+IHsMQG1oy
r3uCI+DN1wxhsFo0ivoDewfwcbv3Va89EwIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 09:10:01.503844+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (8, 96, '-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAzgmFs6IHX+zkhAtpZoXFtvR0AopWHp+nTOYXAlbTBkiDUuhA
GqSU//KMRwzxVXrN6aUNWRuMA/tLAS8ZM39hfj3iZfC28W1hoM7L+Ppr3BAvc7dL
XU4a0aDTogvL2W5lHCf+T40GGpyB3imSygezGmpaOoYSLF2Z/t8NhfxyMexQKCKQ
erw5iC/a2EPZpUl5MbvEXNRj7l7buLseqbmaipIdSkq2aTE3gO8hEG/2e2zwUp8o
lnXKdawiAyS1XReRwfxezx6Geg7qhoidkm3cTCAntHeTWQ2+4VcRLXeNtLbwKQUQ
ufgvfyXfr2pfldROOm+6goTgem5RJRi8SRxKJQIDAQABAoIBAQCXF6yQurWlxtcd
bjDxGhCPxlx8sG3PL01Eu0cMVBeUeAC1/9Nitmb9+ySbxgYEpXXzbTKIsgbPtKyg
RaW5eiRIq6EnGItQKOJ7RquV/i6yxrvFpBkEZ46LQ+Fu6C+pV6eWKk34kHZ1dWhX
Py2CMntJV8yrNj6Fgm631WLZavNjX5M/TWhw0QRkfYeJm+tfMQcUJfjjh1Hgt6Cj
XrY9chlc2T4edjR0yqyXM3ZkoHksx78Z8POAHd+UqSIV+6LMrrlVSnXKT3I1pi5K
Wrr7xt43FGzi+c6t1lt9bJsJf87nVZAnfzoj2vObOsUaBwINxxxtuhBkBVGi0JKq
GSNVqOFRAoGBAPQqKb5m5A4ew1Qem7kMTRqYgn5aNz6HESZbbK6JE5TD1EVXEYQj
xadqb+Ek8Re4jLwLdI3ZayUrRi89lx05b5aaHXerSbsd/rJ8s0ccTGR40rwzst3Y
ub+r9DPoQJDkqXJjCiMtNECMa8zoCbLXYAEf4HJJ3kk8NNL4SWjCoJEXAoGBANgG
PEdsR9/JSzlHqzYqKuQp+dEMu8Gfwh78tI1sZFyV3xZmz3/lllbekRMs5FK0o1Tj
uk96PN3+3Lfy14uxyPlzfUJZj2VLcSoqNs8LRIyyEjrn1frbQnRVJ2qLPBlY0WNI
kn69FUkFcVoRGSXTZIBMnf5nXgLntSYqBQ3b26wjAoGANlKvKOqRcMbNZIjO0rP2
76Tg26XMxr+cRDFxE7/xuFZ9gtPlVMX0stPOgoQKk+F+hlPyIaEu4n0nR1lnppvh
xNsTFU3pwJTi1ulBpd+Y632qPS8va4ZNhWSHl4jj3JjTTlzUo5DqIDZdwaAakEy0
0ms6L5NZvmeDxTByfLlYqg8CgYAgnOBg0AIR0OvgW+eHJ9qN06B5ZPi7hIjj8La5
WxHTwHSLhz3wSxLlTniMcoyNx+OYn0CzWvrxcNaVlr3fwxlaP4s7hxXU7wzIltLr
cwIIU6HY7sMpOgzQT0LCHP8XvIbv/DbRl24tNfsk48vuH/nePLLlg2l3+s8oUdOt
gfGqDQKBgEb0HbzD2+jpGiF64zn8BwCGkBLJgKrXoKb39+Nuf8UQiJVtuHTbfjtT
EVN1/EE2vVet+5JYM1ZUf+jtGJ1oRPdjYWmipPBk0c72EWOFjvnJg0D229XLcePY
2tXOMehy2FGy9wzoRu2qqkoYh6vedn3FDLtgtzg8Bn6cEgfDi5jV
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAzgmFs6IHX+zkhAtpZoXFtvR0AopWHp+nTOYXAlbTBkiDUuhAGqSU
//KMRwzxVXrN6aUNWRuMA/tLAS8ZM39hfj3iZfC28W1hoM7L+Ppr3BAvc7dLXU4a
0aDTogvL2W5lHCf+T40GGpyB3imSygezGmpaOoYSLF2Z/t8NhfxyMexQKCKQerw5
iC/a2EPZpUl5MbvEXNRj7l7buLseqbmaipIdSkq2aTE3gO8hEG/2e2zwUp8olnXK
dawiAyS1XReRwfxezx6Geg7qhoidkm3cTCAntHeTWQ2+4VcRLXeNtLbwKQUQufgv
fyXfr2pfldROOm+6goTgem5RJRi8SRxKJQIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 10:04:48.932953+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (9, 97, '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAuOfiXbO3XP4LmLKGm4cu/bhR8G026rWqg917hwvMaTpoo5Eu
X4UZRP7T0A54M8ra3I/iL2REUKs2+/VhzEonIAaBKkRDR2YPGyhzcskx9GCVec6q
ooPMY+HNOLbrFcWcnsDfn+MhxY+AVzmZ6Pp54+VM/6bO/0ED/5MQOQcZ85btEGOv
sY0GnMFx/XBRLBJTbATN47twEd6NYpPXFU8PLbi/BY57V5PNHXFM086iElUHOw0L
5pu9Dh+IdBCACFgsJjAhat62IMaD8IQqF7yLaZBHkpEMuEatTCnCS8uIawWit6mT
gOeZ9lS3W8eqUsY4N7JwwsqFIgCTwtF+99BOlwIDAQABAoIBAEEwN0Uzs+SMCAiY
gA5a9X0ru2+ZAXB0BZ6huggdZ759giCQcZnpccQ6VvCV+VjBHrH95A8zOUZ7ZlIj
64u7ZNnMkUMWd+W3HIJFm5YPSpZOasRb0Rqkfq2EEPb6vhyZ46KweuaCjAh7lBKs
Uw+pJsnqsF+9LmMdR8yVy3VfhI20wUjhUxrg4Kmq/F4ENW4yXlgFI3xJ3wHMqRDj
jlK7g/fFVoBry89EVbK4WScMATUnPYul9gGRJbI/TzgypK/AZcxXNs+WedFgidXQ
SrP3ewm3K8TwZIJRd1+wtHSebLLCIl9mKh0S0SjtqjgFmuXRUVqmlQTSGibWPea/
dH8ipWkCgYEA5rYHOv8hDs3fWTXg7rycgEOaeUSwo4oqr9oIYhSU3g10zIpOjcRz
XLPwL5TH8QpM4/sp8MqC5XdpHLcwOTOs1o+9TDFEjZZkJSw4RASu5hvkbseP7EnP
SGizDFPPHmFpUuOPN1bjd4xq0xAv7K2I4vkzK8wCWXRX1BR5F6ehNgsCgYEAzSyE
XZqzMcLEBpNHanmROvudOc2j3SR2y3HprYHD21qNmmCLQeRGIhaJs9mqeJmVNbAK
+ZwIzoKMFF4W5tHGyLt/3HOGQ/nVIgjB6mSIUmEuOqvS6zIuYZtuxqmWFpfYMm2C
N4U57K3j9mGOEajIYhuyL1qTqds8wZ7AhKsU3SUCgYBJaMASOJ3XLRCVPTyOGjud
4GTlk0K1NsBwZerm8m+P3C4+6v8lws2GQMb7DNc1zjY7EG7+7CEMTJuIhI12lge3
2dK8zKxodOL2pQReODNCirt7uEoGQFIRUyctk/lCTHKL6lZmoGIOZwKSmAL3xxvY
RLzQgcB5oDhWBhGlwjPckwKBgF8UyUajoXVm//bYG9lw+uetoQAfl1etRUwkvxkE
MOKfhU3MfdyMUCAN98ScE48OBYK60Ws5by9celQaAlz3TDrMAYYFF2y7A5VhH5Rj
AHXEyWqxI+6Q88OSB3UTNBXGSo+cBiN6nwxazXDpZrAyWqJ0mU+ulw25Jt/HlQom
SmXtAoGATocsJ8QXpQ4I2U7E8TkRBcW3iqZHpxpOQc5hMIuOZ0w9F+iI+ZOFQkxQ
1ITfaY4B+4Us8zWANrGWP/+IAB4w2BZooy9qfSl2xYpdLZkHuwELk3Y8TH1rAwpS
GdN6fmo/MKsdial/QzcTpaxLrenuJqVWb5PQSxcNiEdA1h8QHFo=
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAuOfiXbO3XP4LmLKGm4cu/bhR8G026rWqg917hwvMaTpoo5EuX4UZ
RP7T0A54M8ra3I/iL2REUKs2+/VhzEonIAaBKkRDR2YPGyhzcskx9GCVec6qooPM
Y+HNOLbrFcWcnsDfn+MhxY+AVzmZ6Pp54+VM/6bO/0ED/5MQOQcZ85btEGOvsY0G
nMFx/XBRLBJTbATN47twEd6NYpPXFU8PLbi/BY57V5PNHXFM086iElUHOw0L5pu9
Dh+IdBCACFgsJjAhat62IMaD8IQqF7yLaZBHkpEMuEatTCnCS8uIawWit6mTgOeZ
9lS3W8eqUsY4N7JwwsqFIgCTwtF+99BOlwIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 11:06:46.025257+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (10, 98, '-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA2sKXSvWEeHv+DwEht1IHRFXMYNVPkrISF0htQ8rmJEfFYWXG
Ew6OYoo98D0f6xg7/fT8ihRqRsmCNIdRIplZWK6ghp21eAmm436zvMF6Q1jHCjQa
2910TBMY4e9SMVE+5/FghnWFvICT08qggvYBxE7R7qiqilCfS0qwH7uyznYgUSH/
7ejflQTj19geCeaYVlWowsOLl3fWrNz4JjAxYz8COX2/qodaqKNPxwtPwrRCNqCg
RMkje/Z60uQhoRCIl0pWnun8wUAl7Kzj+7KYlLgjE0wXBBlS1nRU2e6/xM+0cBXW
yQSfBFIFwZfrgssgk88VL+69Hp0Ugnnsw1UYmQIDAQABAoIBAH3QhKr74aBZz5hZ
kkaYys0me1EF3aoE+Bqj8ROYUhxzmrWVjwHO0V0jHNRak0zmtzor+EKB0026/0Ou
v58iixxR8sj5UzEie/VDHaRlsiehm3fm17uz9fr60MjAl4j9rSxAyr8KQExVtq+M
ThyD2ChLHLoiD1NVYwgugHT/wqqyfTOqMeEGMluYVgqRSvWi0kw8HkFc/UIKUqIK
PFIYIBY039IE/3R5J7o6p//YeL3hOCZtgSJFLUy1R79HIf318hvxconXva0ynUkH
sklJ22bS5bLB+eAeR1/JqM7lw7vvHU0XuHQpL7GmJ5UDHU2t5Pf/eJami+C/4oPe
FD5ZpHECgYEA5VTub0pUT3mpdBkP6rZzrONjsLahluEa+DH7k/kKUufNiP4Gqj0B
idA14yBc7KRQs0oQPvvV0PWvnZ4fo14hy0ae9aro7yCUmOu4otxmjjlR2DyBx/7E
SI8TS24aJwaXqmMeDnligNsO7p0sfUg3uPoZI1PwyiWZVmgextS/0asCgYEA9DLy
u5GtJ10cj0RelvvgMCmFoop+f32qugu7ZR/+7FJi88rueaOVAEi/yAabT8Jp0fnd
Zy6OGVLwk6jjrEagtrpMyqPKO3rnvL1Tzq+OTCb6TDaczHdoYwxkKDLC1p6FrQAV
YnXtq/vaPg1IH8poBvrN++yR8NvBuvr5NVVDgssCgYAKPgvUHp67WfSugbwLQJDU
BOfb6Zw379/Te+//gNzsLPwqBSZpDgZ2kD0H4tcjnocYKtOk7Hx1M7PfN0O0eSzL
NmE9GaADphHc7pI1e+B8s6SrIrCtLPy5POKguM8kNRArBPg/rz4uARqen5hwE/yh
H1JmGIalkJ5TlJzjRnc2twKBgH3Dn28qX1regU7njy+DGLq1J7XGTc+rELowQJqc
F9XtuDiGUrsinCJBVUPW4zX4kjcpz/TL7TLtnCjv2hFnbm2tFM9n+0cWzTJO71KK
52YgzNdjaO2EsaYRQ6PQQLf3fDDU0i6bPYRNeOBsRrDYtSqjEGKmO6MoCmYZyy7E
crhxAoGBAOQqUyvrTM/s/FyCJOvsOrWFEy5R4/JOtSuWQNJ59Z61OmMYkJxDjONP
irqJ3jUksqS2YStFB+tJ6LCoU8xYCIfacz0fA1FLR063gwMvILloOwGYY1Zo5F2u
Ap4Nn+SMChD3IPCnZbe4WBCnvR8a5JbdzKEiIqYHJmLBfBMlb3gK
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEA2sKXSvWEeHv+DwEht1IHRFXMYNVPkrISF0htQ8rmJEfFYWXGEw6O
Yoo98D0f6xg7/fT8ihRqRsmCNIdRIplZWK6ghp21eAmm436zvMF6Q1jHCjQa2910
TBMY4e9SMVE+5/FghnWFvICT08qggvYBxE7R7qiqilCfS0qwH7uyznYgUSH/7ejf
lQTj19geCeaYVlWowsOLl3fWrNz4JjAxYz8COX2/qodaqKNPxwtPwrRCNqCgRMkj
e/Z60uQhoRCIl0pWnun8wUAl7Kzj+7KYlLgjE0wXBBlS1nRU2e6/xM+0cBXWyQSf
BFIFwZfrgssgk88VL+69Hp0Ugnnsw1UYmQIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 11:28:08.156735+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (11, 99, '-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAyGriE/6j4zJD3rke4Dum9/xC4NM/Eu3I8jESRWFU1u6A26h+
miCy9FdvTmIKGe/hPsxxB4FE4/ryKwceS2uLVc7FfkBc4R/TCKJ/VSMqnFG26sV4
JIdyBytFLGSvwmnSGyXp22BOt06B2yFu+Hy2ztYRTN1A1g3gvcTo3A0aFvfmvPwe
/L1DQBEbDWSwJfJ3yFVx7bAV1Dcca4odpxabWK3HcNnc9WMWGH+8IhLaksqiWTFw
RhJRQWQq4hQn2T54KneelYVqQkwt3h6MgHlOsbgyhpRBK/CgDmSfNOtU6MyYajVP
n1RcbtgZNnLUFAY+MKL+s15Xqe2y/0Xl2HJJ7QIDAQABAoIBAQDAwpRI+Nw18611
dQVuU9FmqDjGtkbu9McVsf7JvjB0PJaxLiD+Kr8T5ViHwiHHCoHQ/Z8kwb85qq3q
loEbtwcfc61dnZf3ar11i5z+jME58hoFOgIw2BjjLknsxbaKPW84b0G6nql3AspA
sapi0sicrSWckR0AA/8JZm803mEefoKfYNqnMWXABueXwebdKp0NIXtlyKAQgAY7
BLQF9kNd4sb1WTYdzMkk4FGNWxl9WXT78CXJAC54V41+YJlUxxX2xen1SBC5VCA8
gV7LBOdBxRun8uBfwl1Wo8zHJX3RdZXjP+UR8WmBkdzszT8aTyTP9EJvRg1xlsWF
oz233oKBAoGBAN4Jdvh5lyoQAUSLYUrFX0pDfKmzWr4sYuhSo8BPjI7m1aJf5lqD
eOT3s7QG/MB7KMAJAtw96anHcIQSq3oO37YnXpnPrECD2DSd23WMZevSvFZx/6n4
3P1xMxyp2pRSITETKG3DmbfEPqukz3TQQ2ZeP4EUUrOTybuALoLLNa2NAoGBAOcS
16xVhfNtcVMMAyqB6rH9UBYuPRBuUMl2Px0HDMptNrn6zcxCnuDQ5Vk1YYrasiPs
RqF6e3ezTmdJYzalEJgIzvocaHbX4sosVaUTQpcgOV8TTpuhx0PRVSejTn9ToYqQ
nv0R800vR08rwx/PzdhEp6OKQeblu3J18jUupQXhAoGBALs0j7KAEgvM4sTAH4/D
Scx7iigqqF+fXOU0iAwlBgWWapk08itungevMTygh4piTMFc16SKLvCOzzcL5rhK
wiP6nbBhgIIEp831Kou5jFWAoHriMwVEZk7pmoaYT0qu1H1kAbpKKNjgBVcC5kc/
MRSmcjSKxg/Sk0wbjxuH6gIhAoGBAIRhrSHUFVuytZvoY9/0cirqfvlWIDHLoYjp
r5rHsTI/g3zlDQYanL8brml/RZSxWiFuecCFVTrshNxzlN13j5wqX7m2kLqVUB6X
a7GY6St/kJ7BhuVut6RIx0pgKtaTaRbjZ9KAeC0eCvJ2leEhwkJGguwUh1DrCIq4
u7xwLqbBAoGARyM0K0F+xM02gpgZn0KrjLkL6wV+hfQ/z7VsuPiXKqUZd/eAH1YD
UoajD8ORYC1+PAKmY5QnKCxXG3P5+7W5/JBHGzaoTzKw+Pk8uTPpTPytWsfyqolc
iGJ23Xu8OB04QTKECrQtitDRrPYaAXqaU1l2/jx3HAQxwR5LKaXZtHw=
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAyGriE/6j4zJD3rke4Dum9/xC4NM/Eu3I8jESRWFU1u6A26h+miCy
9FdvTmIKGe/hPsxxB4FE4/ryKwceS2uLVc7FfkBc4R/TCKJ/VSMqnFG26sV4JIdy
BytFLGSvwmnSGyXp22BOt06B2yFu+Hy2ztYRTN1A1g3gvcTo3A0aFvfmvPwe/L1D
QBEbDWSwJfJ3yFVx7bAV1Dcca4odpxabWK3HcNnc9WMWGH+8IhLaksqiWTFwRhJR
QWQq4hQn2T54KneelYVqQkwt3h6MgHlOsbgyhpRBK/CgDmSfNOtU6MyYajVPn1Rc
btgZNnLUFAY+MKL+s15Xqe2y/0Xl2HJJ7QIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 11:44:13.651555+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (12, 100, '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvKJme0tA7yKSisvsHJNIUq6Y24A+Siokntate/XANNaWEzfO
4qeHIRpCv45VjmQ+LwzolspmKA245Zq91Dzc/PFe8eDtWMcWVWs7wV4r/rcYBV2X
QFPy9LqPtZe7SzcW+zCNYN4matFPNbgGAJ7yqdWrcy5y5CLsaIkt40ETfTyTA1RX
pROiQ+FsKoqMTJ2Y6bLFgj2wp3+ep/Ep01quawav5PnKadZFnyx3XHrQW5kPX4HZ
B4AvXmVHqaDGiwtdua653qiAWlE3igdGtQJhzuj8lT1pxWFcdG9Ego4+wQC9UF+S
rd6/r1+vEF4gI7JSmworS1hFh1zx9v//mmRfyQIDAQABAoIBAFdGhEfzT33U7xxM
sVefRU0L/yk/spI54WukQ+wgjedkiVcm8Q+pFzpXnh5mymrxMlwuisaJqq5Jewyw
hbfW2SAmxRkASpBSvKCU1rbmzVAygmipHrvim3xjfO4137AzMuzRT/hLkFbHtPBT
zmMnJ3swovzNttaa2eqb3aFRkKTWPwYibcAOPNhDEkX/D+VKyYQofYRnCVlm7aDU
d3L4sGOc4OxLa/mBHPz5YrRYP4ECYnEOFWuf8oEYCn3ADm5H+x8n84zfDa0BTDq9
PxTFTFoG1RGYF4J1zy9MIjKuMn4grzAKd2hAC5RLF/Oh+OtH582BjrdNN3mB5h0w
tXp4zyECgYEA+GngBZsd5vvJst639jSGpgfesuLtt/Y3N8/HepEdEdnjdmBrgYPa
9MbFDnbi9juiZdbo+UzCR9Vg6N9uyp1xdFhSBZ8BVSP/cXlY+DAL4qamkcQTVFSM
p+ei4fl/D+Cbf2xRSzCOxJ75qk0v3kUI2BVOmB183PKdEbi5D6Ktse0CgYEAwmUq
McRKa9ksSSap02bwV4LmAf/gH9zt523RTc0BA+LnLPH0HlbaA3m9tsIB7XcGlv+E
TbCZWKz6epoVg4Ppbh+8fTqdtVWiOOtm+/MRzs/AvqqfPg/7V5Ybpj005S+PspAj
W1/ebXoUJ+27jMej5bL9tpj2P/LXJbNjMqwH2c0CgYBqr33Iqo+zDdvX+BLlqDVT
xPl9tjwFz7ZzP8cZ+oyTiBJKWqqRGwHEMkGbLq/WtFHQjvXLa43cr+VI3fyFBA0f
vHatd1ZpLGaeY1E0dd4E3zGWVLFAfHdT/QVVK4PIW9wsY2aediI6i1QKMdAnE1rz
AmOYrMFdWszeOYkxD9qtGQKBgDbAvci0q+2Chtm3vR+hH9LWOKiZhGwVEyEbKlfK
hR2uHETphUPCXLeb45aFQHu9CasgHwiu1BJI7mf33FVloyr0X2e6Sc9YZk+35hLS
3NIua/CIKEAXykhaLEF/fdWLtuKpfHvxHboiJ2kzqZ62YHCDILj8jmdmo7intSoB
kFiFAoGAbWiR8Cx6OMWalEpFeQfpZrjWMDVB0BCWF83YMtL14XO6auB85wTlL61j
KUR93Sv2Peo7Q0KJxkyKvYA79sTYm9RwP5TwkChd3F45PwXCCZ6zHklGF6s5zQFQ
VXXHm9gT3pgQ5t48z1SunEwr1O1zEVioP62jkTL0zElCvDfrWtU=
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAvKJme0tA7yKSisvsHJNIUq6Y24A+Siokntate/XANNaWEzfO4qeH
IRpCv45VjmQ+LwzolspmKA245Zq91Dzc/PFe8eDtWMcWVWs7wV4r/rcYBV2XQFPy
9LqPtZe7SzcW+zCNYN4matFPNbgGAJ7yqdWrcy5y5CLsaIkt40ETfTyTA1RXpROi
Q+FsKoqMTJ2Y6bLFgj2wp3+ep/Ep01quawav5PnKadZFnyx3XHrQW5kPX4HZB4Av
XmVHqaDGiwtdua653qiAWlE3igdGtQJhzuj8lT1pxWFcdG9Ego4+wQC9UF+Srd6/
r1+vEF4gI7JSmworS1hFh1zx9v//mmRfyQIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-05 13:35:20.742156+07', NULL, '0001-01-01 07:07:12+07:07:12');
INSERT INTO public.tm_user_key VALUES (13, 101, '-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA5I45ZmYw3DwEDBeeiGJqCUmxZGIxfjbwj9hll+eyANma0qdT
vc/SkIQW2afaN+c88Xv8KwonkVC4Aey+c1XEP87ClCheoaQHQfEesga8/MttgJPA
vY5Dro8g0kMBRDi2YKWyePYDfUJUxWjbLtQtDnoxcxYEXEIi2ymYcKQbitORC28l
c4YxnN7+sFhSMLzcVGc90+qDXc+qZKAmNQdrAX/qZQ4KEs88y1SN+HnrZOUcVMAG
x/Ja8VC75Z+2kHeL8yIo3eJxTlqzl+CNRWto/zBvhwYzO9wKgoCMVTHQY+0rePBh
m1qjWzA7rVTBQLFeOWQrAgG6P87Z63GX7Om5dQIDAQABAoIBAAFzZangvC6pstzg
yYDUHxgv/5BDj0zdzGkdVofAUMDwoKr1pPJvf0arj/mRtzDjpt9hihg72ERz3rck
aZER2k0NYu7N0svz3pfsj+VRZaG1KNzIE1Egtg1Fm0+6XSextHaolplt9le1NBSM
tdd2QVL2M5onaZ+sS8xYVz9fy0z2R8NFX9iLJliEbJpB5nqWV1ReLfEN+k/yXTNG
BcnY2O3go4x/rDBKKe93ayu8NRqxf3Suz9wppIvbV4N0v+JpAZnX9aMePfpOyWKw
3piYIb2elNJTG3WWag+719OeVMoZbWOb7CnBZ0sAaLjM0nV4WiURBSsabXyUFMvx
wXAIR4ECgYEA8NapoIOuhK6PXLXMY2eBoWlT4rNf/cGDODgG1unZYV0DjzVQ/kNU
Fc6YyRFO+MIvQxlvrtQuj0pWgDrZpwqmeGuwbMWgnDjMWASKl71TfYSYM1bCGJsS
5yGXKFBmbGLIsL/XX+Qmk+47E0hfUtJFYRelH9KFBueU7VzM6aclA/sCgYEA8vGc
N3LsDSLCoso8td7hb2eveSMNX4DOM6DE9sIsVEX7enyGeCQv79SD/goDC+1qrgsm
KdBg5c5uUBlhix3iTNotIZXeskjHKW98jT8HtrV5Mcjs2jNTM0mV+ArZ6Kmf3wIi
/jizakDVU/U9RaLYiJEHg7mU8/TMxSgmSrXxTU8CgYBdixMhjGQJlv+KA/baGUbp
Wc7CO+ep2TLNcD1/1h6fyY/rXMsTpzUOr0r6teVVi57t0gBmCHX5I+eLMNB/KAzW
swU4il5Cr3D3MvRd0aSPGSRAtI75Hapu6cYbW3cc3BWVST4vOZ+eT6bUa4TS12cp
OhTh0lPnBaX7t9LDYi9nZwKBgAuTreEKjesWU/YT8w6rn0yCwV7hZ7q8VZcqOxiT
Ki+d4hz1ICdLeilQlDWf3oNL/gBrMZdega+Rxbn1a6uIcgc9glcOYD1YsHzt/h5w
+XogbbUMoRTIy1cvU4EtazLmGmMzI92/b/VJP6Evl4rg9raTSqthRZLWgIeIoUKA
Jw6LAoGBAKvH6iwIynPTXUg2Rjc7NaB2//A8pLdzC/o2z+cdlNx4z262289CpU8M
g+zhm+fPQz5elSH4PqXATqNT+xWyi47SxFQtY0zSMK1j3+rXEd/zAKxaXN6lohdY
ax+NQ57YrcVstkzJ2X0B9hKddlkTdo8tl8FlKGPmJoNPfVmCG1Sa
-----END RSA PRIVATE KEY-----
', '-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEA5I45ZmYw3DwEDBeeiGJqCUmxZGIxfjbwj9hll+eyANma0qdTvc/S
kIQW2afaN+c88Xv8KwonkVC4Aey+c1XEP87ClCheoaQHQfEesga8/MttgJPAvY5D
ro8g0kMBRDi2YKWyePYDfUJUxWjbLtQtDnoxcxYEXEIi2ymYcKQbitORC28lc4Yx
nN7+sFhSMLzcVGc90+qDXc+qZKAmNQdrAX/qZQ4KEs88y1SN+HnrZOUcVMAGx/Ja
8VC75Z+2kHeL8yIo3eJxTlqzl+CNRWto/zBvhwYzO9wKgoCMVTHQY+0rePBhm1qj
WzA7rVTBQLFeOWQrAgG6P87Z63GX7Om5dQIDAQAB
-----END RSA PUBLIC KEY-----
', '', 1, '2024-08-07 12:10:00.585196+07', NULL, '0001-01-01 07:07:12+07:07:12');


--
-- TOC entry 3057 (class 0 OID 1121964)
-- Dependencies: 182
-- Data for Name: tr_api_katalog; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tr_api_katalog VALUES (1, 5, 'mid-bjbs-sig-auth', 'Authorization', '', '/v1/utilities/signature-auth', NULL, 1, '2024-06-25 14:13:48.195388+07', NULL, NULL, '{
  "X-TIMESTAMP": { "values": "2020-01-01T00:00:00+07:01" },
  "X-CLIENT-KEY": { "values": "primaapps" },
  "X-PRIVATE-KEY": { "values": "MIIEogIBAAKCAQEAv32wOoN2Yn0YDGlM1pVQSjKWKaPXPCeWkwl5E1+8UM0RPFuXk4wMqWM1+8nklom/Le6X3GTyQ1ZwD+lDOqsTCqgjG2E4ZMHsSghXxcF7Y64lIRrLsHLk3xSptkLLP7bztccHY/upfGKd9IyLFup/fSf2+Y9FSXa7IMuf1r5I+ZxhCQIxKviojw/mWT9F2qBtyil5rE36DRNyWIQcwyh5Qw/7uWM6pNVp2znVl7APCPwTj+qx4Rqjk1qO3MHhOAhIFG0iN5d18UR8xwFMPHhGcWH+sCc+7G3kWAPECF4El6R0aRsFmBA+TvwBq9kw330KAF74a8gjqYWDpJ7jERO8xQIDAQABAoIBADuChRT6K/1ZoPKieuWpC4WziOUx7L7eErZpWD5EH1MBF90pHccV3A18LpesW6TI9CgDISC2Im/42eSn+mOuLMHAFQD6SrtNZPBw/U4Q3hbRVOqf2DNi0WvekQt6YI3RfpW8X7ibykVEpJAOaV9ayvoLRH60HrVA99CuV2M2SZmAjSMt2qdJ7y96F9IuPlrVqXHkDJ948Dt8WGSGIpBmC1gW6zIb9zy/ZTstOimGVlEitToud+HS4jp0zh9umkWrKhlcpCqjHLW6NbyxkvwK1cqh6r+Z30WDA+7wyOKBrV5HOLwIfcKOLQ+PYIaUUfwp8s3WUB7fM2VMr6iD1SZOv4ECgYEA2BoH3K3QhVXBozyUwnfLrggpbo0gvNdwPuWhbYHODzAPjDHnK667FPHKqnAJZqYArZcGLVxzXRn4QkSO7tJZbx9D5JMsWGmFOplDN6iYZ7d5tMz6aaLaA+hKYRmeovw8VlE7poGEfooANL5KlJdbivHAqMmxOd6V4o/5ysYwwSECgYEA4thw7InenQ2siocQmENE6hjV6sY3YuMZkW50Vk7Oq+kq52cd0lfL5jGdQZG0df178/6nOos66gwksISU6oZ+/7cFf93ekrQrD1ysLFA6f0TG+ZzuBpRfzxDt/cvCkBoF4BXfBagTHP/qcO70RuEmpnCIPWSIiW4Fugc9Y66GcyUCgYAq3OboT5WHjN3uicqb0/UTXM0S/20Z58V8xEFDnjaH7ql2zkMi9/Jlkhv3uGc09AI4bDcuciLzuX3zbvPGzPQuRU5LHSHzm2JwoAukE42/LLY4NVwJ7eI+Wim+nr1HaK5zFIO3YAMusiKeU4wpcugWZCMpl2/OoaarHJGYNb1f4QKBgChpPHy29uRtmi43b3pgiXdWo00msJk6McTZs3nooiK37/+3O/XL1DQW5JfYuBhI5vsJg4sHYKBvN14G0GyTNy6g0Sb9RHhIBl+/N6DRTgp8GyI+lZywc/z0XCFZWjjHmgJYgxmD3pvM71vdBcFWvMbrxymArl4lLnn8bjBC2ArNAoGAF9cgBnQgFs0pWQms3cKT5baZjiKKdNXGnuX/eu1avJ1jyOgUx/1zudWkdVKC7mQHfLhD+Hyza7e5XqR0j3eQQoHnPqv4jU4ELAJ8g/RFWXHaEivDP3mE8Nt8AJFd4hrpAuY6+okOrERs5P+ES1tGsUnK8s54CKfEkC4BgTebgxw=" },
  "target-uri": { "values" : "/api/v1/utilities/signature-auth"} 
}
', NULL, '{
    "Content-Type": {
      "pattern": "^application/json$",
      "type": "string"
    },
    "X-TIMESTAMP": {
      "type": "string"
    },
    "X-CLIENT-KEY": {
      "type": "string"
    },
    "X-PRIVATE-KEY": {
      "type": "string"
    }
 }', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.tr_api_katalog VALUES (3, 5, 'mid-bjbs-sig-svc', 'Transaction', NULL, '/v1/utilities/signature-service', NULL, 1, '2024-06-25 14:29:28.416+07', NULL, NULL, '{
  "X-TIMESTAMP": {
    "values": "2020-01-01T00:00:00+07:00"
  },
  "X-CLIENT-SECRET": {
    "values" : "0txg085Zu7BCBEICYYMxPWxtqdHBuSVy"
  },
  "HttpMethod": {
    "values" : "POST"
  },
  "EndpoinUrl": {
    "values" : "/api/v1.0/account-inquiry-internal"
  },
  "AccessToken": {
    "values" : ""
  },
  "target-uri": {
    "values" : "/api/v1/utilities/signature-service"
  }
}', '{
    "accountNo": "2000200202",
    "clientId": "962489e9-de5d-4eb7-92a4-b07d44d64bf4",
    "beneficiaryAccountNo": "8888",
    "reqMsgId": "{\"partnerReferenceNo\":\"2020102900000000000001\",\"beneficiaryAccountNo\": \"888801000157508\",\"additionalInfo\": {\"deviceId\": \"12345679237\",\"channel\": \"mobilephone\"}}"
}', '{
  "X-TIMESTAMP": {
    "type": "string"
  },
  "X-CLIENT-SECRET": {
    "type" : "string"
  },
  "HttpMethod": {
    "type" : "string"
  },
  "EndpoinUrl": {
    "type" : "string"
  },
  "AccessToken": {
    "type" : "string"
  }
}', '{
  "accountNo": "string",
  "clientId": "string",
  "beneficiaryAccountNo": "string",
  "reqMsgId": "string"
}', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.tr_api_katalog VALUES (2, 5, 'mid-bjbs-acc-token', 'Authorization', NULL, '/v1/access-token/b2b', NULL, 1, '2024-06-25 14:23:20.385+07', NULL, NULL, '{
  "X-CLIENT-KEY": {
    "values": "primaapps"
  },
  "X-SIGNATURE": {
    "values": ""
  },
  "X-TIMESTAMP": {
    "values": "2020-01-01T00:00:00+07:01"
  },
  "target-uri": {
     "values" : "/api/v1/access-token/b2b"
  } 
}', '', '{
  "X-SIGNATURE": {
    "type": "string"
  },
  "X-CLIENT-KEY": {
    "type": "string"
  },
  "Content-Type": {
    "pattern": "^application/json$",
    "type": "string"
  },
  "X-TIMESTAMP": {
    "type": "string"
  }
}', '', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.tr_api_katalog VALUES (43, 5, 'transfer-interbank', 'Service', 'Informasi Transfer Interbank', '/v1.0/transfer-interbank', '', 1, '2024-08-05 16:25:37.46273+07', NULL, NULL, '{"X-TIMESTAMP":{"values":""},"X-SIGNATURE":{"values":""},"target-uri":{"values":""},"X-EXTERNAL-ID":{"values":""},"X-PARTNER-ID":{"values":""},"CHANNEL-ID":{"values":""},"Authorization":{"values":""}}', '{"partnerReferenceNo":"","amount":"","beneficiaryAccountNo":"","beneficiaryEmail":"","currency":"","customerReference":"","feeType":"","remark":"","sourceAccountNo":"","transactionDate":"","additionalInfo":""}', '{"X-TIMESTAMP":{"type":"string"},"X-SIGNATURE":{"type":"string"},"target-uri":{"type":"string"},"X-EXTERNAL-ID":{"type":"string"},"X-PARTNER-ID":{"type":"string"},"CHANNEL-ID":{"type":"string"},"Authorization":{"type":"string"}}', '{"partnerReferenceNo":"string","amount":"string","beneficiaryAccountNo":"string","beneficiaryEmail":"string","currency":"string","customerReference":"string","feeType":"string","remark":"string","sourceAccountNo":"string","transactionDate":"string","additionalInfo":"string"}', 1, 3, '{"uri":"/api-camel/v1.0/transfer-interbank","name":"transfer-interbank","methods":["POST"],"upstream_id":34,"status":1,"plugins":{"clickhouse-logger":{"_meta":{"disable":false},"batch_max_size":1000,"buffer_duration":60,"database":"testing","endpoint_addrs":["http://10.2.0.111:8546"],"inactive_timeout":5,"include_req_body":true,"include_resp_body":true,"logtable":"bjbs","max_retry_count":0,"name":"clickhouse-logger","password":"ANSKk08aPEDbFjDO","retry_delay":1,"ssl_verify":true,"timeout":3,"user":"tdi"},"ext-plugin-post-resp":{"_meta":{"disable":false},"allow_degradation":false,"conf":[{"name":"Encryptor","value":"{\"enable\":\"feature\"}"}]},"ext-plugin-pre-req":{"_meta":{"disable":false},"allow_degradation":false,"conf":[{"name":"Decryptor","value":"{\"enable\":\"feature\"}"}]},"key-auth":{"_meta":{"disable":false},"header":"apikey","hide_credentials":false,"query":"apikey"},"proxy-rewrite":{"headers":{"add":{"target-uri":"/api/v1/utilities/signature-auth","time-iso8601":"$time_iso8601"}},"uri":"/api/gateway","use_real_request_uri_unsafe":false},"real-ip":{"_meta":{"disable":false},"recursive":false,"source":"http_x_forwarded_for"},"response-rewrite":{"_meta":{"disable":false},"body_base64":false,"headers":{"remote_addr":"$remote_addr","remote_port":"$remote_port"}}}}', 'mid-bjbs-account-tdi', 'https://192.168.100.251:39000/openapi/331b00f8-d3cf-4967-b961-478f205a3a4c', 34, 1);
INSERT INTO public.tr_api_katalog VALUES (5, 5, 'mid-account-saving', 'Service', NULL, '/v1/account-saving', NULL, 1, '2024-06-25 14:29:28.416+07', NULL, NULL, '{
  "X-TIMESTAMP": {
    "values": "2020-01-01T00:00:00+07:00"
  },
  "X-SIGNATURE": {
    "values" : ""
  },
  "target-uri": {
    "values" : "/api/v1.0/account-inquiry-internal"
  },
  "X-EXTERNAL-ID": {
    "values" : "967249489272742461272915600958810273"
  },
  "X-PARTNER-ID": {
    "values" : "565a80e75e584870ad773d0be3453b81"
  },
  "CHANNEL-ID": {
    "values" : "95051"
  },
  "Authorization": {
    "values" : "Bearer "
  }
}', '{
    "accountNo": "2000200202",
    "clientId": "962489e9-de5d-4eb7-92a4-b07d44d64bf4",
    "beneficiaryAccountNo" : "8888",
    "reqMsgId": "{\"partnerReferenceNo\":\"2020102900000000000001\",\"beneficiaryAccountNo\": \"888801000157508\",\"additionalInfo\": {\"deviceId\": \"12345679237\",\"channel\": \"mobilephone\"}}"
}', '{
  "X-TIMESTAMP": {
    "type": "string"
  },
  "X-SIGNATURE": {
    "type" : "string"
  },
  "target-uri": {
    "type" : "string"
  },
  "Authorization": {
    "type" : "string"
  }
}', '{
    "accountNo": "string",
    "clientId": "string",
    "beneficiaryAccountNo" : "string",
    "reqMsgId": "string"
}', 1, 3, NULL, NULL, NULL, 1, 1);
INSERT INTO public.tr_api_katalog VALUES (44, 5, 'bank-dki-inquiry-va', 'Service', 'Informasi Pembayaran VA Bank DKI', '/api:hnNslTnj/v2/inquiry/bdkiva', '', 1, '2024-08-06 14:08:53.015174+07', NULL, NULL, '{"Authorization":{"values":""}}', '{"PRODUCT_CODE":"","partnerServiceId":"","customerNo":"","virtualAccountNo":""}', '{"Authorization":{"type":"string"}}', '{"PRODUCT_CODE":"string","partnerServiceId":"string","customerNo":"string","virtualAccountNo":"string"}', 1, 0, '{"uri":"/api-camel/api:hnNslTnj/v2/inquiry/bdkiva","name":"bank-dki-inquiry-va","methods":["POST"],"upstream_id":35,"status":1,"plugins":{"clickhouse-logger":{"_meta":{"disable":false},"batch_max_size":1000,"buffer_duration":60,"database":"testing","endpoint_addrs":["http://10.2.0.111:8546"],"inactive_timeout":5,"include_req_body":true,"include_resp_body":true,"logtable":"bjbs","max_retry_count":0,"name":"clickhouse-logger","password":"ANSKk08aPEDbFjDO","retry_delay":1,"ssl_verify":true,"timeout":3,"user":"tdi"},"proxy-rewrite":{"uri":"/api:hnNslTnj/v2/inquiry/bdkiva","use_real_request_uri_unsafe":false}}}', 'mid-bjbs-account-tdi', 'https://192.168.100.251:39000/openapi/331b00f8-d3cf-4967-b961-478f205a3a4c', 35, 0);
INSERT INTO public.tr_api_katalog VALUES (39, 5, 'inquiry-va-bdki', 'Service', 'Informasi Pengecekan Pembayaran VA', '/api:hnNslTnj/v2/inquiry/bdkiva', '', 1, '2024-08-05 01:32:10.360641+07', NULL, NULL, '{"Authorization":{"values":""}}', '{"PAN":"","AMOUNT":"","TRANSMISSION_DATETIME":"","STAN":"","EXPIRED_DATE":"","SETTLEMENT_DATE":"","RETRIEVAL_REFERENCE_NUMBER":"","CA_TERMINAL_ID":"","CA_ID":"","LOCATION_NAME":"","PRIVATE_48":"","TRANSMISSION_YEAR":"","PRODUCT_CODE":"","priv48":"","virtualAccountNo":"","partnerServiceId":"","customerNo":""}', '{"Authorization":{"type":"string"}}', '{"PAN":"string","AMOUNT":"string","TRANSMISSION_DATETIME":"string","STAN":"string","EXPIRED_DATE":"string","SETTLEMENT_DATE":"string","RETRIEVAL_REFERENCE_NUMBER":"string","CA_TERMINAL_ID":"string","CA_ID":"string","LOCATION_NAME":"string","PRIVATE_48":"string","TRANSMISSION_YEAR":"string","PRODUCT_CODE":"string","priv48":"string","virtualAccountNo":"string","partnerServiceId":"string","customerNo":"string"}', 1, 0, '{"uri":"/api-camel/api:hnNslTnj/inquiry/bdkiva","name":"bdki-1","methods":["POST"],"upstream_id":28,"status":1,"plugins":{"clickhouse-logger":{"_meta":{"disable":false},"batch_max_size":1000,"buffer_duration":60,"database":"testing","endpoint_addrs":["http://10.2.0.111:8546"],"inactive_timeout":5,"include_req_body":true,"include_resp_body":true,"logtable":"bjbs","max_retry_count":0,"name":"clickhouse-logger","password":"ANSKk08aPEDbFjDO","retry_delay":1,"ssl_verify":true,"timeout":3,"user":"tdi"}}}', 'mid-bjbs-account-tdi', 'https://192.168.100.251:39000/openapi/331b00f8-d3cf-4967-b961-478f205a3a4c', 28, 0);


--
-- TOC entry 3049 (class 0 OID 1119527)
-- Dependencies: 174
-- Data for Name: tr_app_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tr_app_product VALUES (1, 'V1.0-Account-Inquiry-External', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (2, 'V1.0-Balance-Inquiry', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (3, 'V1.0-Account-Inquiry-Internal', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (4, 'V1.0-IntraBank-Transfer', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (5, 'V1.0-InterBank-Transfer', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (6, 'V1.0-Status-Transfer', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (7, 'V1.0-Transaction-History-List', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (8, 'V1.0-Transaction-History-Details', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (9, 'V2.0-Account-Inquiry-External', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (10, 'V2.0-Balance-Inquiry', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (11, 'V2.0-Account-Inquiry-Internal', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (12, 'V2.0-IntraBank-Transfer', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (13, 'V2.0-InterBank-Transfer', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (14, 'V2.0-Status-Transfer', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (31, 'V2.0-Transaction-History-List', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (32, 'V2.0-Transaction-History-Details', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);
INSERT INTO public.tr_app_product VALUES (34, 'V2.0-Transaction-History-Details', NULL, 1, '2024-04-01 15:13:31.528832+07', NULL, NULL);


--
-- TOC entry 3044 (class 0 OID 1119467)
-- Dependencies: 169
-- Data for Name: tr_authority; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tr_authority VALUES (1, 'Admin', 1, '2024-04-03 10:54:43.569599+07', NULL, NULL);
INSERT INTO public.tr_authority VALUES (2, 'Tenant', 1, '2024-04-03 10:54:44.533179+07', NULL, NULL);


--
-- TOC entry 3048 (class 0 OID 1119517)
-- Dependencies: 173
-- Data for Name: tr_literal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tr_literal VALUES (1, 'API Version', 'V1.0', 'V1.0', 1, '1', 1, '2024-04-01 15:50:10.019998+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (2, 'API Version', 'V2.0', 'V2.0', 2, '1', 1, '2024-04-01 15:50:10.022463+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (3, 'API Type', 'Authorization', 'Authorization', 1, '1', 1, '2024-04-01 15:51:23.268299+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (4, 'API Type', 'Transaction', 'Transaction', 2, '1', 1, '2024-04-01 15:51:23.269882+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (5, 'API Method', 'POST', 'POST', 1, '1', 1, '2024-04-01 15:52:16.338318+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (6, 'API Method', 'GET', 'GET', 2, '1', 1, '2024-04-01 15:52:16.340194+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (7, 'API Method', 'PUT', 'PUT', 3, '1', 1, '2024-04-01 15:52:16.341803+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (8, 'SIT Request Status', 'Requested', 'Requested', 1, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (9, 'SIT Request Status', 'Aggreement Reviewed', 'Aggreement Reviewed', 2, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (10, 'SIT Request Status', 'Aggreement Completed', 'Aggreement Completed', 3, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (11, 'SIT Request Status', 'SIT Requested', 'SIT Requested', 4, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (12, 'SIT Request Status', 'SIT Reviewed', 'SIT Reviewed', 5, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (13, 'SIT Request Status', 'SIT Revision', 'SIT Revision', 6, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (14, 'SIT Request Status', 'SIT Completed', 'SIT Completed', 7, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (15, 'SIT Request Status', 'Rejected', 'Rejected', 8, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (16, 'SIT Request Status', 'Cancelled', 'Cancelled', 9, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (17, 'SIT Request Status', 'Accepted', 'Accepted', 10, '1', 1, '2024-04-04 10:57:48.739515+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (19, 'API Method', 'DELETE', 'DELETE ', 4, '1', 1, '2024-04-17 14:42:07.891217+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (20, 'API Method', 'PATCH', 'PATCH', 5, '1', 1, '2024-04-17 14:42:07.902864+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (21, 'API Method', 'HEAD', 'HEAD', 6, '1', 1, '2024-04-17 14:42:07.922342+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (22, 'SIT Type', 'Production', 'Production', 1, '1', 1, '2024-04-30 10:34:39.532986+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (18, 'CMS Type', 'Partnership', 'Partnership', 1, '1', 1, '2024-04-04 14:01:36.66865+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (23, 'CMS Type', 'Advantage', 'Advantage', 2, '1', 1, '2024-04-04 14:01:36.66865+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (24, 'CMS Type', 'Process', 'Process', 3, '1', 1, '2024-04-04 14:01:36.66865+07', NULL, NULL);
INSERT INTO public.tr_literal VALUES (25, 'CMS Type', 'description_process', 'description_process', 4, '1', 1, '2024-04-04 14:01:36.66865+07', NULL, NULL);


--
-- TOC entry 3045 (class 0 OID 1119476)
-- Dependencies: 170
-- Data for Name: tr_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tr_menu VALUES (13, NULL, 'FAQs', NULL, '/faqs', 'fa-solid fa-t fa-fw', '1', 1, '2024-04-03 10:57:27.192633+07', NULL, NULL, '0');
INSERT INTO public.tr_menu VALUES (1, NULL, 'Home', NULL, '/home', 'fa-solid fa-house', '1', 1, '2024-04-03 10:55:20.45751+07', NULL, NULL, '0');
INSERT INTO public.tr_menu VALUES (2, NULL, 'User Management', NULL, '', 'fa-regular fa-user fa-fw', '1', 1, '2024-04-03 10:55:52.137112+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (3, 2, 'Users', NULL, '/user-management', 'fa-solid fa-user-plus', '1', 1, '2024-04-03 10:55:52.166147+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (4, 2, 'Authority', NULL, '/authority', 'fa-solid fa-at', '1', 1, '2024-04-03 10:56:33.426864+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (5, NULL, 'CMS', NULL, '/cms', 'fa-solid fa-newspaper fa-fw', '1', 1, '2024-04-03 10:56:33.440775+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (6, NULL, 'Profile', NULL, '/profile', 'fa-regular fa-user fa-fw', '1', 1, '2024-04-03 10:56:33.442639+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (7, NULL, 'Apps', NULL, '/apps', 'fa-solid fa-table-cells-large fa-fw', '1', 1, '2024-04-03 10:56:54.924131+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (8, NULL, 'SIT-Request', NULL, '/sit-request', 'fa-brands fa-dropbox fa-fw', '1', 1, '2024-04-03 10:56:54.928319+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (9, NULL, 'SignatureGen', NULL, '/signature-gen', 'fa-solid fa-file-contract fa-fw', '1', 1, '2024-04-03 10:57:10.908323+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (11, NULL, 'Katalog API', NULL, '/katalog-api', 'fa-solid fa-layer-group fa-fw', '1', 1, '2024-04-03 10:57:27.192633+07', NULL, NULL, '0');
INSERT INTO public.tr_menu VALUES (12, NULL, 'Testing API', NULL, '/testing-api', 'fa-regular fa-square-check fa-fw', '1', 1, '2024-04-03 10:57:27.192633+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (10, NULL, 'Documentation API', NULL, '/documentation', 'fa-regular fa-file fa-fw', '1', 1, '2024-04-03 10:57:27.192633+07', NULL, NULL, '0');
INSERT INTO public.tr_menu VALUES (15, NULL, 'Monitoring', NULL, '/monitoring-apisix', 'fa-solid fa-chart-bar', '1', 1, '2024-04-03 10:57:27.192633+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (16, NULL, 'Billing', '', '/billing', 'fa-brands fa-dropbox fa-fw', '1', 1, '2024-07-11 11:18:23.550119+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (17, NULL, 'API', '', '', 'fa-solid fa-box', '1', 1, '2024-07-11 11:18:23.550119+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (19, 17, 'Route', '', '/route-api', 'fa-regular fa-circle', '1', 1, '2024-07-11 11:18:23.550119+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (20, 17, 'Upstream', '', '/upstream-api', 'fa-regular fa-circle', '1', 1, '2024-07-11 11:18:23.550119+07', NULL, NULL, '1');
INSERT INTO public.tr_menu VALUES (14, NULL, 'Audit Trail', NULL, '/log-status', 'fa-solid fa-arrow-right-arrow-left fa-fw', '1', 1, '2024-04-03 10:57:27.192633+07', NULL, NULL, '1');


--
-- TOC entry 3054 (class 0 OID 1119642)
-- Dependencies: 179
-- Data for Name: tr_nomax; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tr_nomax VALUES (11, 'tr_menu', 21, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (4, 'tm_sig_gen', 2, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (14, 'tm_app_user_request', 2, 1, '2024-04-30 13:18:25.425844+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (8, 'tr_app_product', 2, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (18, 'tm_api_hit', 86, 1, '2024-07-16 09:31:20.351833+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (17, 'tm_upstream', 36, 1, '2024-07-16 09:31:20.351833+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (13, 'tr_api_katalog', 45, 1, '2024-04-30 13:17:50.518329+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (15, 'tm_app_user_request_log', 95, 1, '2024-04-30 13:18:25.43032+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (16, 'tm_app_user_hit_log', 6, 1, '2024-07-16 09:31:20.351833+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (5, 'tm_user', 102, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (6, 'tm_user_authority', 14, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (7, 'tm_user_key', 14, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (9, 'tr_authority', 51, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (12, 'tm_cms', 81, 1, '2024-04-04 14:17:36.418036+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (3, 'tm_authority_menu', 265, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (10, 'tr_literal', 25, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (1, 'tm_app_user', 14, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);
INSERT INTO public.tr_nomax VALUES (2, 'tm_app_user_product', 14, 1, '2024-04-03 14:37:17.505896+07', NULL, NULL);


--
-- TOC entry 2917 (class 2606 OID 1158006)
-- Name: tm_api_hit tm_api_hit_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_api_hit
    ADD CONSTRAINT tm_api_hit_pk PRIMARY KEY (i_id);


--
-- TOC entry 2911 (class 2606 OID 1145149)
-- Name: tm_app tm_app_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app
    ADD CONSTRAINT tm_app_pk PRIMARY KEY (i_id);


--
-- TOC entry 2913 (class 2606 OID 1153029)
-- Name: tm_app_user_hit_log tm_app_user_hit_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_hit_log
    ADD CONSTRAINT tm_app_user_hit_pk PRIMARY KEY (i_id);


--
-- TOC entry 2899 (class 2606 OID 1119725)
-- Name: tm_app_user tm_app_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user
    ADD CONSTRAINT tm_app_user_pk PRIMARY KEY (i_id);


--
-- TOC entry 2885 (class 2606 OID 1119577)
-- Name: tm_app_user_product tm_app_user_product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_product
    ADD CONSTRAINT tm_app_user_product_pk PRIMARY KEY (i_id);


--
-- TOC entry 2909 (class 2606 OID 1126171)
-- Name: tm_app_user_request_log tm_app_user_request_log_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_request_log
    ADD CONSTRAINT tm_app_user_request_log_pk PRIMARY KEY (i_id);


--
-- TOC entry 2907 (class 2606 OID 1126104)
-- Name: tm_app_user_request tm_app_user_request_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_request
    ADD CONSTRAINT tm_app_user_request_pk PRIMARY KEY (i_id);


--
-- TOC entry 2901 (class 2606 OID 1145274)
-- Name: tm_app_user tm_app_user_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user
    ADD CONSTRAINT tm_app_user_unique UNIQUE (n_app_name);


--
-- TOC entry 2868 (class 2606 OID 1119489)
-- Name: tm_authority_menu tm_authority_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_authority_menu
    ADD CONSTRAINT tm_authority_menu_pkey PRIMARY KEY (i_id);


--
-- TOC entry 2887 (class 2606 OID 1119587)
-- Name: tm_sig_gen tm_sig_gen_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_sig_gen
    ADD CONSTRAINT tm_sig_gen_pk PRIMARY KEY (i_id);


--
-- TOC entry 2915 (class 2606 OID 1153491)
-- Name: tm_upstream tm_upstream_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_upstream
    ADD CONSTRAINT tm_upstream_pk PRIMARY KEY (i_id);


--
-- TOC entry 2877 (class 2606 OID 1119561)
-- Name: tm_user tm_user_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user
    ADD CONSTRAINT tm_user_email_unique UNIQUE (n_email);


--
-- TOC entry 2889 (class 2606 OID 1119599)
-- Name: tm_user_key tm_user_key_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user_key
    ADD CONSTRAINT tm_user_key_pk PRIMARY KEY (i_id);


--
-- TOC entry 2891 (class 2606 OID 1125947)
-- Name: tm_user_key tm_user_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user_key
    ADD CONSTRAINT tm_user_key_unique UNIQUE (private_key);


--
-- TOC entry 2893 (class 2606 OID 1125949)
-- Name: tm_user_key tm_user_key_unique_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user_key
    ADD CONSTRAINT tm_user_key_unique_1 UNIQUE (public_key);


--
-- TOC entry 2879 (class 2606 OID 1119563)
-- Name: tm_user tm_user_phone_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user
    ADD CONSTRAINT tm_user_phone_unique UNIQUE (n_phone);


--
-- TOC entry 2881 (class 2606 OID 1119559)
-- Name: tm_user tm_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user
    ADD CONSTRAINT tm_user_pk PRIMARY KEY (i_id);


--
-- TOC entry 2883 (class 2606 OID 1145121)
-- Name: tm_user tm_user_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user
    ADD CONSTRAINT tm_user_unique UNIQUE (n_username);


--
-- TOC entry 2870 (class 2606 OID 1119506)
-- Name: tm_user_authority tm_user_web_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user_authority
    ADD CONSTRAINT tm_user_web_authority_pkey PRIMARY KEY (i_id);


--
-- TOC entry 2905 (class 2606 OID 1121973)
-- Name: tr_api_katalog tr_api_katalog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_api_katalog
    ADD CONSTRAINT tr_api_katalog_pkey PRIMARY KEY (i_id);


--
-- TOC entry 2875 (class 2606 OID 1119533)
-- Name: tr_app_product tr_app_product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_app_product
    ADD CONSTRAINT tr_app_product_pk PRIMARY KEY (i_id);


--
-- TOC entry 2862 (class 2606 OID 1119473)
-- Name: tr_authority tr_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_authority
    ADD CONSTRAINT tr_authority_pkey PRIMARY KEY (i_id);


--
-- TOC entry 2864 (class 2606 OID 1119475)
-- Name: tr_authority tr_authority_unique1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_authority
    ADD CONSTRAINT tr_authority_unique1 UNIQUE (n_auth_name);


--
-- TOC entry 2903 (class 2606 OID 1119795)
-- Name: tm_cms tr_cms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_cms
    ADD CONSTRAINT tr_cms_pkey PRIMARY KEY (i_id);


--
-- TOC entry 2873 (class 2606 OID 1119526)
-- Name: tr_literal tr_literal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_literal
    ADD CONSTRAINT tr_literal_pk PRIMARY KEY (i_id);


--
-- TOC entry 2866 (class 2606 OID 1119482)
-- Name: tr_menu tr_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_menu
    ADD CONSTRAINT tr_menu_pkey PRIMARY KEY (i_id);


--
-- TOC entry 2895 (class 2606 OID 1119648)
-- Name: tr_nomax tr_nomax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_nomax
    ADD CONSTRAINT tr_nomax_pkey PRIMARY KEY (i_id);


--
-- TOC entry 2897 (class 2606 OID 1119650)
-- Name: tr_nomax tr_nomax_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_nomax
    ADD CONSTRAINT tr_nomax_un UNIQUE (n_module_name);


--
-- TOC entry 2871 (class 1259 OID 1121987)
-- Name: tr_literal_n_category_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tr_literal_n_category_idx ON public.tr_literal USING btree (n_category);


--
-- TOC entry 2937 (class 2606 OID 1158028)
-- Name: tm_api_hit tm_api_hit_tr_api_katalog_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_api_hit
    ADD CONSTRAINT tm_api_hit_tr_api_katalog_fk FOREIGN KEY (i_id_api_katalog) REFERENCES public.tr_api_katalog(i_id);


--
-- TOC entry 2936 (class 2606 OID 1153030)
-- Name: tm_app_user_hit_log tm_app_user_hit_tm_app_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_hit_log
    ADD CONSTRAINT tm_app_user_hit_tm_app_user_fk FOREIGN KEY (i_id_app_user) REFERENCES public.tm_app_user(i_id);


--
-- TOC entry 2922 (class 2606 OID 1119731)
-- Name: tm_app_user_product tm_app_user_product_tm_app_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_product
    ADD CONSTRAINT tm_app_user_product_tm_app_user_fk FOREIGN KEY (i_id_app_user) REFERENCES public.tm_app_user(i_id);


--
-- TOC entry 2932 (class 2606 OID 1126105)
-- Name: tm_app_user_request tm_app_user_request_tm_app_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_request
    ADD CONSTRAINT tm_app_user_request_tm_app_user_fk FOREIGN KEY (i_id_app_user) REFERENCES public.tm_app_user(i_id);


--
-- TOC entry 2933 (class 2606 OID 1126110)
-- Name: tm_app_user_request tm_app_user_request_tm_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_request
    ADD CONSTRAINT tm_app_user_request_tm_user_fk FOREIGN KEY (i_id_user) REFERENCES public.tm_user(i_id);


--
-- TOC entry 2934 (class 2606 OID 1126115)
-- Name: tm_app_user_request tm_app_user_request_tr_literal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_request
    ADD CONSTRAINT tm_app_user_request_tr_literal_fk FOREIGN KEY (i_id_status) REFERENCES public.tr_literal(i_id);


--
-- TOC entry 2935 (class 2606 OID 1126121)
-- Name: tm_app_user_request tm_app_user_request_tr_literal_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user_request
    ADD CONSTRAINT tm_app_user_request_tr_literal_fk2 FOREIGN KEY (i_id_sit_type) REFERENCES public.tr_literal(i_id);


--
-- TOC entry 2928 (class 2606 OID 1119726)
-- Name: tm_app_user tm_app_user_tm_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_app_user
    ADD CONSTRAINT tm_app_user_tm_user_fk FOREIGN KEY (i_id_user) REFERENCES public.tm_user(i_id);


--
-- TOC entry 2918 (class 2606 OID 1119490)
-- Name: tm_authority_menu tm_authority_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_authority_menu
    ADD CONSTRAINT tm_authority_menu_fk FOREIGN KEY (i_id_authority) REFERENCES public.tr_authority(i_id);


--
-- TOC entry 2919 (class 2606 OID 1119495)
-- Name: tm_authority_menu tm_authority_menu_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_authority_menu
    ADD CONSTRAINT tm_authority_menu_fk_1 FOREIGN KEY (i_id_menu) REFERENCES public.tr_menu(i_id);


--
-- TOC entry 2929 (class 2606 OID 1126183)
-- Name: tm_cms tm_cms_tr_literal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_cms
    ADD CONSTRAINT tm_cms_tr_literal_fk FOREIGN KEY (i_id_cms_type) REFERENCES public.tr_literal(i_id);


--
-- TOC entry 2923 (class 2606 OID 1126193)
-- Name: tm_sig_gen tm_sig_gen_tm_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_sig_gen
    ADD CONSTRAINT tm_sig_gen_tm_user_fk FOREIGN KEY (i_id_user) REFERENCES public.tm_user(i_id);


--
-- TOC entry 2924 (class 2606 OID 1126198)
-- Name: tm_sig_gen tm_sig_gen_tr_literal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_sig_gen
    ADD CONSTRAINT tm_sig_gen_tr_literal_fk FOREIGN KEY (i_id_api_version) REFERENCES public.tr_literal(i_id);


--
-- TOC entry 2925 (class 2606 OID 1126203)
-- Name: tm_sig_gen tm_sig_gen_tr_literal_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_sig_gen
    ADD CONSTRAINT tm_sig_gen_tr_literal_fk_1 FOREIGN KEY (i_id_api_type) REFERENCES public.tr_literal(i_id);


--
-- TOC entry 2926 (class 2606 OID 1126208)
-- Name: tm_sig_gen tm_sig_gen_tr_literal_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_sig_gen
    ADD CONSTRAINT tm_sig_gen_tr_literal_fk_2 FOREIGN KEY (i_id_api_method) REFERENCES public.tr_literal(i_id);


--
-- TOC entry 2920 (class 2606 OID 1119610)
-- Name: tm_user_authority tm_user_authority_tm_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user_authority
    ADD CONSTRAINT tm_user_authority_tm_user_fk FOREIGN KEY (i_id_user) REFERENCES public.tm_user(i_id);


--
-- TOC entry 2921 (class 2606 OID 1119615)
-- Name: tm_user_authority tm_user_authority_tr_authority_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user_authority
    ADD CONSTRAINT tm_user_authority_tr_authority_fk FOREIGN KEY (i_id_authority) REFERENCES public.tr_authority(i_id);


--
-- TOC entry 2927 (class 2606 OID 1119604)
-- Name: tm_user_key tm_user_key_tm_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tm_user_key
    ADD CONSTRAINT tm_user_key_tm_user_fk FOREIGN KEY (i_id_user) REFERENCES public.tm_user(i_id);


--
-- TOC entry 2931 (class 2606 OID 1153500)
-- Name: tr_api_katalog tr_api_katalog_tm_upstream_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_api_katalog
    ADD CONSTRAINT tr_api_katalog_tm_upstream_fk FOREIGN KEY (i_id_upstream) REFERENCES public.tm_upstream(i_id);


--
-- TOC entry 2930 (class 2606 OID 1126188)
-- Name: tr_api_katalog tr_api_katalog_tr_literal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr_api_katalog
    ADD CONSTRAINT tr_api_katalog_tr_literal_fk FOREIGN KEY (i_id_api_method) REFERENCES public.tr_literal(i_id);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-07 12:45:23

--
-- PostgreSQL database dump complete
--

