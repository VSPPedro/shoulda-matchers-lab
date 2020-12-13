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
-- Name: system; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA system;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.applications (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.applications_id_seq OWNED BY public.applications.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: segments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.segments (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: segments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.segments_id_seq OWNED BY public.segments.id;


--
-- Name: applications; Type: TABLE; Schema: system; Owner: -
--

CREATE TABLE system.applications (
    id bigint NOT NULL,
    name character varying
);


--
-- Name: applications_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE system.applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE system.applications_id_seq OWNED BY system.applications.id;


--
-- Name: applications_segments; Type: TABLE; Schema: system; Owner: -
--

CREATE TABLE system.applications_segments (
    id bigint NOT NULL,
    application_id bigint,
    segment_id bigint
);


--
-- Name: applications_segments_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE system.applications_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: applications_segments_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE system.applications_segments_id_seq OWNED BY system.applications_segments.id;


--
-- Name: segments; Type: TABLE; Schema: system; Owner: -
--

CREATE TABLE system.segments (
    id bigint NOT NULL,
    name character varying
);


--
-- Name: segments_id_seq; Type: SEQUENCE; Schema: system; Owner: -
--

CREATE SEQUENCE system.segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: segments_id_seq; Type: SEQUENCE OWNED BY; Schema: system; Owner: -
--

ALTER SEQUENCE system.segments_id_seq OWNED BY system.segments.id;


--
-- Name: applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applications ALTER COLUMN id SET DEFAULT nextval('public.applications_id_seq'::regclass);


--
-- Name: segments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.segments ALTER COLUMN id SET DEFAULT nextval('public.segments_id_seq'::regclass);


--
-- Name: applications id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.applications ALTER COLUMN id SET DEFAULT nextval('system.applications_id_seq'::regclass);


--
-- Name: applications_segments id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.applications_segments ALTER COLUMN id SET DEFAULT nextval('system.applications_segments_id_seq'::regclass);


--
-- Name: segments id; Type: DEFAULT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.segments ALTER COLUMN id SET DEFAULT nextval('system.segments_id_seq'::regclass);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: segments segments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.segments
    ADD CONSTRAINT segments_pkey PRIMARY KEY (id);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: applications_segments applications_segments_pkey; Type: CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.applications_segments
    ADD CONSTRAINT applications_segments_pkey PRIMARY KEY (id);


--
-- Name: segments segments_pkey; Type: CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.segments
    ADD CONSTRAINT segments_pkey PRIMARY KEY (id);


--
-- Name: index_system.applications_segments_on_application_id; Type: INDEX; Schema: system; Owner: -
--

CREATE INDEX "index_system.applications_segments_on_application_id" ON system.applications_segments USING btree (application_id);


--
-- Name: index_system.applications_segments_on_segment_id; Type: INDEX; Schema: system; Owner: -
--

CREATE INDEX "index_system.applications_segments_on_segment_id" ON system.applications_segments USING btree (segment_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public,system;

INSERT INTO "schema_migrations" (version) VALUES
('20201205230409'),
('20201205230540'),
('20201206011043');


