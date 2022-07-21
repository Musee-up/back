--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    user_id integer,
    role_id integer
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    size integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_experience_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_experience_links (
    booking_id integer,
    experience_id integer
);


ALTER TABLE public.bookings_experience_links OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_id_seq OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: bookings_slot_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_slot_links (
    booking_id integer,
    slot_id integer
);


ALTER TABLE public.bookings_slot_links OWNER TO postgres;

--
-- Name: bookings_user_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_user_links (
    booking_id integer,
    user_id integer
);


ALTER TABLE public.bookings_user_links OWNER TO postgres;

--
-- Name: experience_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experience_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.experience_types OWNER TO postgres;

--
-- Name: experience_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experience_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experience_types_id_seq OWNER TO postgres;

--
-- Name: experience_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experience_types_id_seq OWNED BY public.experience_types.id;


--
-- Name: experience_types_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experience_types_localizations_links (
    experience_type_id integer,
    inv_experience_type_id integer
);


ALTER TABLE public.experience_types_localizations_links OWNER TO postgres;

--
-- Name: experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences (
    id integer NOT NULL,
    language character varying(255),
    transportation character varying(255),
    duration time without time zone,
    price numeric(10,2),
    description text,
    title character varying(255),
    stars numeric(10,2),
    handifriendly boolean,
    group_size integer,
    location character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.experiences OWNER TO postgres;

--
-- Name: experiences_guide_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences_guide_links (
    experience_id integer,
    guide_id integer
);


ALTER TABLE public.experiences_guide_links OWNER TO postgres;

--
-- Name: experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiences_id_seq OWNER TO postgres;

--
-- Name: experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiences_id_seq OWNED BY public.experiences.id;


--
-- Name: experiences_languages_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences_languages_links (
    experience_id integer,
    language_id integer
);


ALTER TABLE public.experiences_languages_links OWNER TO postgres;

--
-- Name: experiences_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences_localizations_links (
    experience_id integer,
    inv_experience_id integer
);


ALTER TABLE public.experiences_localizations_links OWNER TO postgres;

--
-- Name: experiences_themes_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences_themes_links (
    experience_id integer,
    theme_id integer
);


ALTER TABLE public.experiences_themes_links OWNER TO postgres;

--
-- Name: experiences_types_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences_types_links (
    experience_id integer,
    experience_type_id integer
);


ALTER TABLE public.experiences_types_links OWNER TO postgres;

--
-- Name: favorite_places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_places (
    id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.favorite_places OWNER TO postgres;

--
-- Name: favorite_places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorite_places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_places_id_seq OWNER TO postgres;

--
-- Name: favorite_places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorite_places_id_seq OWNED BY public.favorite_places.id;


--
-- Name: favorite_places_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_places_localizations_links (
    favorite_place_id integer,
    inv_favorite_place_id integer
);


ALTER TABLE public.favorite_places_localizations_links OWNER TO postgres;

--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- Name: guides; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guides (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    headline character varying(255),
    description text,
    background text,
    interests jsonb,
    specialties jsonb,
    work_experiences jsonb,
    location character varying(255)
);


ALTER TABLE public.guides OWNER TO postgres;

--
-- Name: guides_favorite_place_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guides_favorite_place_links (
    guide_id integer,
    favorite_place_id integer
);


ALTER TABLE public.guides_favorite_place_links OWNER TO postgres;

--
-- Name: guides_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guides_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guides_id_seq OWNER TO postgres;

--
-- Name: guides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guides_id_seq OWNED BY public.guides.id;


--
-- Name: guides_languages_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guides_languages_links (
    guide_id integer,
    language_id integer
);


ALTER TABLE public.guides_languages_links OWNER TO postgres;

--
-- Name: guides_user_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guides_user_links (
    guide_id integer,
    user_id integer
);


ALTER TABLE public.guides_user_links OWNER TO postgres;

--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    value character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: languages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages_localizations_links (
    language_id integer,
    inv_language_id integer
);


ALTER TABLE public.languages_localizations_links OWNER TO postgres;

--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: rooms_owners_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_owners_links (
    room_id integer,
    user_id integer
);


ALTER TABLE public.rooms_owners_links OWNER TO postgres;

--
-- Name: slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slots (
    id integer NOT NULL,
    start timestamp(6) without time zone,
    "end" timestamp(6) without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.slots OWNER TO postgres;

--
-- Name: slots_experience_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slots_experience_links (
    slot_id integer,
    experience_id integer
);


ALTER TABLE public.slots_experience_links OWNER TO postgres;

--
-- Name: slots_guide_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slots_guide_links (
    slot_id integer,
    guide_id integer
);


ALTER TABLE public.slots_guide_links OWNER TO postgres;

--
-- Name: slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slots_id_seq OWNER TO postgres;

--
-- Name: slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slots_id_seq OWNED BY public.slots.id;


--
-- Name: strapi-stripe_strapi-stripe-payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."strapi-stripe_strapi-stripe-payment" (
    id integer NOT NULL,
    txn_date timestamp(6) without time zone,
    transaction_id character varying(255),
    is_txn_successful boolean,
    txn_message character varying(255),
    txn_error_message character varying(255),
    txn_amount numeric(10,2),
    customer_name character varying(255),
    customer_email character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public."strapi-stripe_strapi-stripe-payment" OWNER TO postgres;

--
-- Name: strapi-stripe_strapi-stripe-payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."strapi-stripe_strapi-stripe-payment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."strapi-stripe_strapi-stripe-payment_id_seq" OWNER TO postgres;

--
-- Name: strapi-stripe_strapi-stripe-payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."strapi-stripe_strapi-stripe-payment_id_seq" OWNED BY public."strapi-stripe_strapi-stripe-payment".id;


--
-- Name: strapi-stripe_strapi-stripe-product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."strapi-stripe_strapi-stripe-product" (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    description character varying(255),
    price numeric(10,2),
    currency character varying(255),
    is_subscription boolean,
    "interval" character varying(255),
    trial_period_days integer,
    stripe_product_id character varying(255),
    stripe_price_id character varying(255),
    stripe_plan_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public."strapi-stripe_strapi-stripe-product" OWNER TO postgres;

--
-- Name: strapi-stripe_strapi-stripe-product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."strapi-stripe_strapi-stripe-product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."strapi-stripe_strapi-stripe-product_id_seq" OWNER TO postgres;

--
-- Name: strapi-stripe_strapi-stripe-product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."strapi-stripe_strapi-stripe-product_id_seq" OWNED BY public."strapi-stripe_strapi-stripe-product".id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_stripe_strapi_stripe_payment_stripe_product_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_stripe_strapi_stripe_payment_stripe_product_links (
    strapi_stripe_payment_id integer,
    strapi_stripe_product_id integer
);


ALTER TABLE public.strapi_stripe_strapi_stripe_payment_stripe_product_links OWNER TO postgres;

--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- Name: themes_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes_localizations_links (
    theme_id integer,
    inv_theme_id integer
);


ALTER TABLE public.themes_localizations_links OWNER TO postgres;

--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    socket_id character varying(255),
    phone character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    location character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- Name: up_users_friends_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_friends_links (
    user_id integer,
    inv_user_id integer
);


ALTER TABLE public.up_users_friends_links OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    user_id integer,
    role_id integer
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: experience_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_types ALTER COLUMN id SET DEFAULT nextval('public.experience_types_id_seq'::regclass);


--
-- Name: experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences ALTER COLUMN id SET DEFAULT nextval('public.experiences_id_seq'::regclass);


--
-- Name: favorite_places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_places ALTER COLUMN id SET DEFAULT nextval('public.favorite_places_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: guides id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides ALTER COLUMN id SET DEFAULT nextval('public.guides_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots ALTER COLUMN id SET DEFAULT nextval('public.slots_id_seq'::regclass);


--
-- Name: strapi-stripe_strapi-stripe-payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-payment" ALTER COLUMN id SET DEFAULT nextval('public."strapi-stripe_strapi-stripe-payment_id_seq"'::regclass);


--
-- Name: strapi-stripe_strapi-stripe-product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-product" ALTER COLUMN id SET DEFAULT nextval('public."strapi-stripe_strapi-stripe-product_id_seq"'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
4	plugin::content-manager.explorer.create	api::experience-type.experience-type	{"fields": ["name"]}	[]	2022-06-21 11:16:39.623	2022-06-21 11:16:39.623	\N	\N
6	plugin::content-manager.explorer.create	api::language.language	{"fields": ["value"]}	[]	2022-06-21 11:16:39.627	2022-06-21 11:16:39.627	\N	\N
7	plugin::content-manager.explorer.create	api::room.room	{"fields": ["owners"]}	[]	2022-06-21 11:16:39.629	2022-06-21 11:16:39.629	\N	\N
9	plugin::content-manager.explorer.create	api::theme.theme	{"fields": ["name"]}	[]	2022-06-21 11:16:39.633	2022-06-21 11:16:39.633	\N	\N
13	plugin::content-manager.explorer.read	api::experience-type.experience-type	{"fields": ["name"]}	[]	2022-06-21 11:16:39.641	2022-06-21 11:16:39.641	\N	\N
15	plugin::content-manager.explorer.read	api::language.language	{"fields": ["value"]}	[]	2022-06-21 11:16:39.645	2022-06-21 11:16:39.645	\N	\N
16	plugin::content-manager.explorer.read	api::room.room	{"fields": ["owners"]}	[]	2022-06-21 11:16:39.647	2022-06-21 11:16:39.647	\N	\N
18	plugin::content-manager.explorer.read	api::theme.theme	{"fields": ["name"]}	[]	2022-06-21 11:16:39.651	2022-06-21 11:16:39.651	\N	\N
22	plugin::content-manager.explorer.update	api::experience-type.experience-type	{"fields": ["name"]}	[]	2022-06-21 11:16:39.658	2022-06-21 11:16:39.658	\N	\N
24	plugin::content-manager.explorer.update	api::language.language	{"fields": ["value"]}	[]	2022-06-21 11:16:39.662	2022-06-21 11:16:39.662	\N	\N
25	plugin::content-manager.explorer.update	api::room.room	{"fields": ["owners"]}	[]	2022-06-21 11:16:39.664	2022-06-21 11:16:39.664	\N	\N
27	plugin::content-manager.explorer.update	api::theme.theme	{"fields": ["name"]}	[]	2022-06-21 11:16:39.668	2022-06-21 11:16:39.668	\N	\N
5	plugin::content-manager.explorer.create	api::guide.guide	{"fields": ["experiences", "user"]}	[]	2022-06-21 11:16:39.625	2022-07-20 15:37:01.113	\N	\N
14	plugin::content-manager.explorer.read	api::guide.guide	{"fields": ["experiences", "user"]}	[]	2022-06-21 11:16:39.643	2022-07-20 15:37:01.113	\N	\N
23	plugin::content-manager.explorer.update	api::guide.guide	{"fields": ["experiences", "user"]}	[]	2022-06-21 11:16:39.66	2022-07-20 15:37:01.113	\N	\N
32	plugin::content-manager.explorer.delete	api::guide.guide	{}	[]	2022-06-21 11:16:39.678	2022-06-21 11:16:39.678	\N	\N
34	plugin::content-manager.explorer.delete	api::room.room	{}	[]	2022-06-21 11:16:39.682	2022-06-21 11:16:39.682	\N	\N
39	plugin::upload.read	\N	{}	[]	2022-06-21 11:16:39.693	2022-06-21 11:16:39.693	\N	\N
40	plugin::upload.assets.create	\N	{}	[]	2022-06-21 11:16:39.696	2022-06-21 11:16:39.696	\N	\N
41	plugin::upload.assets.update	\N	{}	[]	2022-06-21 11:16:39.698	2022-06-21 11:16:39.698	\N	\N
42	plugin::upload.assets.download	\N	{}	[]	2022-06-21 11:16:39.701	2022-06-21 11:16:39.701	\N	\N
43	plugin::upload.assets.copy-link	\N	{}	[]	2022-06-21 11:16:39.703	2022-06-21 11:16:39.703	\N	\N
128	plugin::content-manager.collection-types.configure-view	\N	{}	[]	2022-06-21 11:16:39.991	2022-06-21 11:16:39.991	\N	\N
2	plugin::content-manager.explorer.create	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide"]}	[]	2022-06-21 11:16:39.618	2022-07-20 15:33:34.843	\N	\N
20	plugin::content-manager.explorer.update	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide"]}	[]	2022-06-21 11:16:39.654	2022-07-20 15:33:34.843	\N	\N
45	plugin::content-manager.explorer.create	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide"]}	["admin::is-creator"]	2022-06-21 11:16:39.709	2022-07-20 15:33:34.843	\N	\N
11	plugin::content-manager.explorer.read	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide"]}	[]	2022-06-21 11:16:39.637	2022-07-20 15:33:34.843	\N	\N
47	plugin::content-manager.explorer.create	api::experience-type.experience-type	{"fields": ["name"]}	["admin::is-creator"]	2022-06-21 11:16:39.713	2022-06-21 11:16:39.713	\N	\N
49	plugin::content-manager.explorer.create	api::language.language	{"fields": ["value"]}	["admin::is-creator"]	2022-06-21 11:16:39.717	2022-06-21 11:16:39.717	\N	\N
50	plugin::content-manager.explorer.create	api::room.room	{"fields": ["owners"]}	["admin::is-creator"]	2022-06-21 11:16:39.72	2022-06-21 11:16:39.72	\N	\N
48	plugin::content-manager.explorer.create	api::guide.guide	{"fields": ["experiences", "user"]}	["admin::is-creator"]	2022-06-21 11:16:39.715	2022-07-20 15:37:01.113	\N	\N
52	plugin::content-manager.explorer.create	api::theme.theme	{"fields": ["name"]}	["admin::is-creator"]	2022-06-21 11:16:39.725	2022-06-21 11:16:39.725	\N	\N
57	plugin::content-manager.explorer.read	api::guide.guide	{"fields": ["experiences", "user"]}	["admin::is-creator"]	2022-06-21 11:16:39.809	2022-07-20 15:37:01.113	\N	\N
56	plugin::content-manager.explorer.read	api::experience-type.experience-type	{"fields": ["name"]}	["admin::is-creator"]	2022-06-21 11:16:39.806	2022-06-21 11:16:39.806	\N	\N
58	plugin::content-manager.explorer.read	api::language.language	{"fields": ["value"]}	["admin::is-creator"]	2022-06-21 11:16:39.81	2022-06-21 11:16:39.81	\N	\N
59	plugin::content-manager.explorer.read	api::room.room	{"fields": ["owners"]}	["admin::is-creator"]	2022-06-21 11:16:39.812	2022-06-21 11:16:39.812	\N	\N
66	plugin::content-manager.explorer.update	api::guide.guide	{"fields": ["experiences", "user"]}	["admin::is-creator"]	2022-06-21 11:16:39.827	2022-07-20 15:37:01.113	\N	\N
61	plugin::content-manager.explorer.read	api::theme.theme	{"fields": ["name"]}	["admin::is-creator"]	2022-06-21 11:16:39.817	2022-06-21 11:16:39.817	\N	\N
65	plugin::content-manager.explorer.update	api::experience-type.experience-type	{"fields": ["name"]}	["admin::is-creator"]	2022-06-21 11:16:39.825	2022-06-21 11:16:39.825	\N	\N
67	plugin::content-manager.explorer.update	api::language.language	{"fields": ["value"]}	["admin::is-creator"]	2022-06-21 11:16:39.83	2022-06-21 11:16:39.83	\N	\N
68	plugin::content-manager.explorer.update	api::room.room	{"fields": ["owners"]}	["admin::is-creator"]	2022-06-21 11:16:39.832	2022-06-21 11:16:39.832	\N	\N
70	plugin::content-manager.explorer.update	api::theme.theme	{"fields": ["name"]}	["admin::is-creator"]	2022-06-21 11:16:39.835	2022-06-21 11:16:39.835	\N	\N
75	plugin::content-manager.explorer.delete	api::guide.guide	{}	["admin::is-creator"]	2022-06-21 11:16:39.845	2022-06-21 11:16:39.845	\N	\N
77	plugin::content-manager.explorer.delete	api::room.room	{}	["admin::is-creator"]	2022-06-21 11:16:39.85	2022-06-21 11:16:39.85	\N	\N
80	plugin::upload.read	\N	{}	["admin::is-creator"]	2022-06-21 11:16:39.856	2022-06-21 11:16:39.856	\N	\N
81	plugin::upload.assets.create	\N	{}	[]	2022-06-21 11:16:39.858	2022-06-21 11:16:39.858	\N	\N
82	plugin::upload.assets.update	\N	{}	["admin::is-creator"]	2022-06-21 11:16:39.861	2022-06-21 11:16:39.861	\N	\N
83	plugin::upload.assets.download	\N	{}	[]	2022-06-21 11:16:39.862	2022-06-21 11:16:39.862	\N	\N
84	plugin::upload.assets.copy-link	\N	{}	[]	2022-06-21 11:16:39.864	2022-06-21 11:16:39.864	\N	\N
129	plugin::content-manager.components.configure-layout	\N	{}	[]	2022-06-21 11:16:39.993	2022-06-21 11:16:39.993	\N	\N
130	plugin::content-type-builder.read	\N	{}	[]	2022-06-21 11:16:39.996	2022-06-21 11:16:39.996	\N	\N
131	plugin::email.settings.read	\N	{}	[]	2022-06-21 11:16:39.998	2022-06-21 11:16:39.998	\N	\N
54	plugin::content-manager.explorer.read	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide"]}	["admin::is-creator"]	2022-06-21 11:16:39.802	2022-07-20 15:33:34.843	\N	\N
63	plugin::content-manager.explorer.update	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide"]}	["admin::is-creator"]	2022-06-21 11:16:39.82	2022-07-20 15:33:34.843	\N	\N
236	plugin::content-manager.explorer.create	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide", "bookings", "slots"], "locales": ["en"]}	[]	2022-07-20 16:20:27.044	2022-07-20 16:20:27.044	\N	\N
237	plugin::content-manager.explorer.create	api::guide.guide	{"fields": ["experiences", "user", "headline", "description", "background", "languages", "interests", "specialties", "workExperiences", "favorite_place", "location", "slots"]}	[]	2022-07-20 16:20:27.049	2022-07-20 16:20:27.049	\N	\N
89	plugin::content-manager.explorer.create	api::experience-type.experience-type	{"fields": ["name"], "locales": ["en"]}	[]	2022-06-21 11:16:39.901	2022-06-21 11:16:39.901	\N	\N
91	plugin::content-manager.explorer.create	api::language.language	{"fields": ["value"], "locales": ["en"]}	[]	2022-06-21 11:16:39.905	2022-06-21 11:16:39.905	\N	\N
92	plugin::content-manager.explorer.create	api::room.room	{"fields": ["owners"]}	[]	2022-06-21 11:16:39.907	2022-06-21 11:16:39.907	\N	\N
239	plugin::content-manager.explorer.read	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide", "bookings", "slots"], "locales": ["en"]}	[]	2022-07-20 16:20:27.055	2022-07-20 16:20:27.055	\N	\N
94	plugin::content-manager.explorer.create	api::theme.theme	{"fields": ["name"], "locales": ["en"]}	[]	2022-06-21 11:16:39.91	2022-06-21 11:16:39.91	\N	\N
240	plugin::content-manager.explorer.read	api::guide.guide	{"fields": ["experiences", "user", "headline", "description", "background", "languages", "interests", "specialties", "workExperiences", "favorite_place", "location", "slots"]}	[]	2022-07-20 16:20:27.057	2022-07-20 16:20:27.057	\N	\N
242	plugin::content-manager.explorer.update	api::experience.experience	{"fields": ["language", "transportation", "duration", "price", "description", "title", "stars", "handifriendly", "photos", "languages", "groupSize", "themes", "location", "types", "guide", "bookings", "slots"], "locales": ["en"]}	[]	2022-07-20 16:20:27.063	2022-07-20 16:20:27.063	\N	\N
243	plugin::content-manager.explorer.update	api::guide.guide	{"fields": ["experiences", "user", "headline", "description", "background", "languages", "interests", "specialties", "workExperiences", "favorite_place", "location", "slots"]}	[]	2022-07-20 16:20:27.066	2022-07-20 16:20:27.066	\N	\N
99	plugin::content-manager.explorer.read	api::experience-type.experience-type	{"fields": ["name"], "locales": ["en"]}	[]	2022-06-21 11:16:39.922	2022-06-21 11:16:39.922	\N	\N
101	plugin::content-manager.explorer.read	api::language.language	{"fields": ["value"], "locales": ["en"]}	[]	2022-06-21 11:16:39.928	2022-06-21 11:16:39.928	\N	\N
102	plugin::content-manager.explorer.read	api::room.room	{"fields": ["owners"]}	[]	2022-06-21 11:16:39.931	2022-06-21 11:16:39.931	\N	\N
245	plugin::content-manager.explorer.delete	api::slot.slot	{}	[]	2022-07-20 16:20:27.071	2022-07-20 16:20:27.071	\N	\N
104	plugin::content-manager.explorer.read	api::theme.theme	{"fields": ["name"], "locales": ["en"]}	[]	2022-06-21 11:16:39.938	2022-06-21 11:16:39.938	\N	\N
109	plugin::content-manager.explorer.update	api::experience-type.experience-type	{"fields": ["name"], "locales": ["en"]}	[]	2022-06-21 11:16:39.951	2022-06-21 11:16:39.951	\N	\N
111	plugin::content-manager.explorer.update	api::language.language	{"fields": ["value"], "locales": ["en"]}	[]	2022-06-21 11:16:39.956	2022-06-21 11:16:39.956	\N	\N
112	plugin::content-manager.explorer.update	api::room.room	{"fields": ["owners"]}	[]	2022-06-21 11:16:39.957	2022-06-21 11:16:39.957	\N	\N
114	plugin::content-manager.explorer.update	api::theme.theme	{"fields": ["name"], "locales": ["en"]}	[]	2022-06-21 11:16:39.961	2022-06-21 11:16:39.961	\N	\N
115	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2022-06-21 11:16:39.963	2022-06-21 11:16:39.963	\N	\N
117	plugin::content-manager.explorer.delete	api::experience.experience	{"locales": ["en"]}	[]	2022-06-21 11:16:39.967	2022-06-21 11:16:39.967	\N	\N
119	plugin::content-manager.explorer.delete	api::experience-type.experience-type	{"locales": ["en"]}	[]	2022-06-21 11:16:39.971	2022-06-21 11:16:39.971	\N	\N
120	plugin::content-manager.explorer.delete	api::guide.guide	{}	[]	2022-06-21 11:16:39.973	2022-06-21 11:16:39.973	\N	\N
121	plugin::content-manager.explorer.delete	api::language.language	{"locales": ["en"]}	[]	2022-06-21 11:16:39.975	2022-06-21 11:16:39.975	\N	\N
122	plugin::content-manager.explorer.delete	api::room.room	{}	[]	2022-06-21 11:16:39.977	2022-06-21 11:16:39.977	\N	\N
124	plugin::content-manager.explorer.delete	api::theme.theme	{"locales": ["en"]}	[]	2022-06-21 11:16:39.981	2022-06-21 11:16:39.981	\N	\N
125	plugin::content-manager.explorer.publish	api::experience.experience	{"locales": ["en"]}	[]	2022-06-21 11:16:39.985	2022-06-21 11:16:39.985	\N	\N
127	plugin::content-manager.single-types.configure-view	\N	{}	[]	2022-06-21 11:16:39.989	2022-06-21 11:16:39.989	\N	\N
132	plugin::upload.read	\N	{}	[]	2022-06-21 11:16:40	2022-06-21 11:16:40	\N	\N
133	plugin::upload.assets.create	\N	{}	[]	2022-06-21 11:16:40.002	2022-06-21 11:16:40.002	\N	\N
134	plugin::upload.assets.update	\N	{}	[]	2022-06-21 11:16:40.004	2022-06-21 11:16:40.004	\N	\N
135	plugin::upload.assets.download	\N	{}	[]	2022-06-21 11:16:40.006	2022-06-21 11:16:40.006	\N	\N
136	plugin::upload.assets.copy-link	\N	{}	[]	2022-06-21 11:16:40.009	2022-06-21 11:16:40.009	\N	\N
137	plugin::upload.settings.read	\N	{}	[]	2022-06-21 11:16:40.011	2022-06-21 11:16:40.011	\N	\N
138	plugin::i18n.locale.create	\N	{}	[]	2022-06-21 11:16:40.014	2022-06-21 11:16:40.014	\N	\N
139	plugin::i18n.locale.read	\N	{}	[]	2022-06-21 11:16:40.017	2022-06-21 11:16:40.017	\N	\N
140	plugin::i18n.locale.update	\N	{}	[]	2022-06-21 11:16:40.019	2022-06-21 11:16:40.019	\N	\N
141	plugin::i18n.locale.delete	\N	{}	[]	2022-06-21 11:16:40.022	2022-06-21 11:16:40.022	\N	\N
142	plugin::users-permissions.roles.create	\N	{}	[]	2022-06-21 11:16:40.024	2022-06-21 11:16:40.024	\N	\N
143	plugin::users-permissions.roles.read	\N	{}	[]	2022-06-21 11:16:40.026	2022-06-21 11:16:40.026	\N	\N
144	plugin::users-permissions.roles.update	\N	{}	[]	2022-06-21 11:16:40.029	2022-06-21 11:16:40.029	\N	\N
145	plugin::users-permissions.roles.delete	\N	{}	[]	2022-06-21 11:16:40.031	2022-06-21 11:16:40.031	\N	\N
146	plugin::users-permissions.providers.read	\N	{}	[]	2022-06-21 11:16:40.033	2022-06-21 11:16:40.033	\N	\N
147	plugin::users-permissions.providers.update	\N	{}	[]	2022-06-21 11:16:40.036	2022-06-21 11:16:40.036	\N	\N
148	plugin::users-permissions.email-templates.read	\N	{}	[]	2022-06-21 11:16:40.038	2022-06-21 11:16:40.038	\N	\N
149	plugin::users-permissions.email-templates.update	\N	{}	[]	2022-06-21 11:16:40.04	2022-06-21 11:16:40.04	\N	\N
150	plugin::users-permissions.advanced-settings.read	\N	{}	[]	2022-06-21 11:16:40.041	2022-06-21 11:16:40.041	\N	\N
151	plugin::users-permissions.advanced-settings.update	\N	{}	[]	2022-06-21 11:16:40.043	2022-06-21 11:16:40.043	\N	\N
152	admin::marketplace.read	\N	{}	[]	2022-06-21 11:16:40.045	2022-06-21 11:16:40.045	\N	\N
153	admin::marketplace.plugins.install	\N	{}	[]	2022-06-21 11:16:40.047	2022-06-21 11:16:40.047	\N	\N
154	admin::marketplace.plugins.uninstall	\N	{}	[]	2022-06-21 11:16:40.052	2022-06-21 11:16:40.052	\N	\N
155	admin::webhooks.create	\N	{}	[]	2022-06-21 11:16:40.054	2022-06-21 11:16:40.054	\N	\N
156	admin::webhooks.read	\N	{}	[]	2022-06-21 11:16:40.056	2022-06-21 11:16:40.056	\N	\N
157	admin::webhooks.update	\N	{}	[]	2022-06-21 11:16:40.059	2022-06-21 11:16:40.059	\N	\N
158	admin::webhooks.delete	\N	{}	[]	2022-06-21 11:16:40.061	2022-06-21 11:16:40.061	\N	\N
159	admin::users.create	\N	{}	[]	2022-06-21 11:16:40.063	2022-06-21 11:16:40.063	\N	\N
160	admin::users.read	\N	{}	[]	2022-06-21 11:16:40.066	2022-06-21 11:16:40.066	\N	\N
161	admin::users.update	\N	{}	[]	2022-06-21 11:16:40.068	2022-06-21 11:16:40.068	\N	\N
162	admin::users.delete	\N	{}	[]	2022-06-21 11:16:40.07	2022-06-21 11:16:40.07	\N	\N
163	admin::roles.create	\N	{}	[]	2022-06-21 11:16:40.073	2022-06-21 11:16:40.073	\N	\N
164	admin::roles.read	\N	{}	[]	2022-06-21 11:16:40.075	2022-06-21 11:16:40.075	\N	\N
165	admin::roles.update	\N	{}	[]	2022-06-21 11:16:40.078	2022-06-21 11:16:40.078	\N	\N
166	admin::roles.delete	\N	{}	[]	2022-06-21 11:16:40.081	2022-06-21 11:16:40.081	\N	\N
167	admin::api-tokens.create	\N	{}	[]	2022-06-21 11:16:40.085	2022-06-21 11:16:40.085	\N	\N
168	admin::api-tokens.read	\N	{}	[]	2022-06-21 11:16:40.087	2022-06-21 11:16:40.087	\N	\N
169	admin::api-tokens.update	\N	{}	[]	2022-06-21 11:16:40.09	2022-06-21 11:16:40.09	\N	\N
170	admin::api-tokens.delete	\N	{}	[]	2022-06-21 11:16:40.092	2022-06-21 11:16:40.092	\N	\N
183	plugin::content-manager.explorer.delete	api::favorite-place.favorite-place	{"locales": ["en"]}	[]	2022-06-28 11:42:42.483	2022-06-28 11:42:42.483	\N	\N
184	plugin::content-manager.explorer.create	api::favorite-place.favorite-place	{"fields": ["picture", "title", "description", "guide"], "locales": ["en"]}	[]	2022-06-28 11:43:28.925	2022-06-28 11:43:28.925	\N	\N
186	plugin::content-manager.explorer.read	api::favorite-place.favorite-place	{"fields": ["picture", "title", "description", "guide"], "locales": ["en"]}	[]	2022-06-28 11:43:28.931	2022-06-28 11:43:28.931	\N	\N
188	plugin::content-manager.explorer.update	api::favorite-place.favorite-place	{"fields": ["picture", "title", "description", "guide"], "locales": ["en"]}	[]	2022-06-28 11:43:28.936	2022-06-28 11:43:28.936	\N	\N
202	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "guide", "friends", "socketID", "rooms", "phone", "firstname", "lastname", "location", "picture", "bookings"]}	[]	2022-07-20 15:22:09.859	2022-07-20 15:22:09.859	\N	\N
206	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "guide", "friends", "socketID", "rooms", "phone", "firstname", "lastname", "location", "picture", "bookings"]}	[]	2022-07-20 15:22:09.874	2022-07-20 15:22:09.874	\N	\N
249	plugin::content-manager.explorer.create	api::booking.booking	{"fields": ["user", "experience", "size", "slot"]}	[]	2022-07-20 16:32:36.352	2022-07-20 16:32:36.352	\N	\N
210	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "guide", "friends", "socketID", "rooms", "phone", "firstname", "lastname", "location", "picture", "bookings"]}	[]	2022-07-20 15:22:09.905	2022-07-20 15:22:09.905	\N	\N
250	plugin::content-manager.explorer.create	api::slot.slot	{"fields": ["start", "end", "experience", "guide", "bookings"]}	[]	2022-07-20 16:32:36.356	2022-07-20 16:32:36.356	\N	\N
251	plugin::content-manager.explorer.read	api::booking.booking	{"fields": ["user", "experience", "size", "slot"]}	[]	2022-07-20 16:32:36.358	2022-07-20 16:32:36.358	\N	\N
214	plugin::content-manager.explorer.delete	api::booking.booking	{}	[]	2022-07-20 15:22:09.918	2022-07-20 15:22:09.918	\N	\N
252	plugin::content-manager.explorer.read	api::slot.slot	{"fields": ["start", "end", "experience", "guide", "bookings"]}	[]	2022-07-20 16:32:36.361	2022-07-20 16:32:36.361	\N	\N
253	plugin::content-manager.explorer.update	api::booking.booking	{"fields": ["user", "experience", "size", "slot"]}	[]	2022-07-20 16:32:36.367	2022-07-20 16:32:36.367	\N	\N
254	plugin::content-manager.explorer.update	api::slot.slot	{"fields": ["start", "end", "experience", "guide", "bookings"]}	[]	2022-07-20 16:32:36.369	2022-07-20 16:32:36.369	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_links (permission_id, role_id) FROM stdin;
2	2
4	2
5	2
6	2
7	2
9	2
11	2
13	2
14	2
15	2
16	2
18	2
20	2
22	2
23	2
24	2
25	2
27	2
32	2
236	1
34	2
237	1
239	1
240	1
39	2
40	2
41	2
42	2
43	2
45	3
47	3
48	3
49	3
50	3
242	1
52	3
243	1
54	3
56	3
57	3
58	3
59	3
61	3
245	1
63	3
65	3
66	3
67	3
68	3
70	3
249	1
75	3
250	1
77	3
251	1
252	1
80	3
81	3
82	3
83	3
84	3
253	1
254	1
89	1
91	1
92	1
94	1
99	1
101	1
102	1
104	1
109	1
111	1
112	1
114	1
115	1
117	1
119	1
120	1
121	1
122	1
124	1
125	1
127	1
128	1
129	1
130	1
131	1
132	1
133	1
134	1
135	1
136	1
137	1
138	1
139	1
140	1
141	1
142	1
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	1
151	1
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1
161	1
162	1
163	1
164	1
165	1
166	1
167	1
168	1
169	1
170	1
183	1
184	1
186	1
188	1
202	1
206	1
210	1
214	1
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2022-06-21 11:16:39.592	2022-06-21 11:16:39.592	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2022-06-21 11:16:39.6	2022-06-21 11:16:39.6	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2022-06-21 11:16:39.603	2022-06-21 11:16:39.603	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Yoan	Garrot	\N	garrot.yoan1@gmail.com	$2a$10$igK/H1W2FRnaktWGW6MFtuA5UCA7uWOUF40vCA5ts/dc8QssK0cGa	\N	\N	t	f	\N	2022-06-21 11:16:55.727	2022-06-21 11:16:55.727	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_links (user_id, role_id) FROM stdin;
1	1
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, size, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: bookings_experience_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_experience_links (booking_id, experience_id) FROM stdin;
\.


--
-- Data for Name: bookings_slot_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_slot_links (booking_id, slot_id) FROM stdin;
\.


--
-- Data for Name: bookings_user_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_user_links (booking_id, user_id) FROM stdin;
\.


--
-- Data for Name: experience_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experience_types (id, name, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: experience_types_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experience_types_localizations_links (experience_type_id, inv_experience_type_id) FROM stdin;
\.


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences (id, language, transportation, duration, price, description, title, stars, handifriendly, group_size, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
15	\N	A pied	00:03:00	\N	Nous connaissons tous la place du Tertre, ses artistes, le Sacré-Coeur, la mythique place des Abbesses… \nNous vous proposons ici de découvrir le Montmartre caché, celui de ses habitants qui cache des recoins à la beauté authentique. Partez à la découverte des recoins cachés de Montmartre.\nCe quartier des plus mythiques de la capitale n’aura plus de secret pour vous. Vous arpenterez ses rues étroites et ses escaliers vertigineux sur les traces des illustres artistes qui les ont empruntés, loin des voies touristiques classiques qu’arpentent les touristes. Rendez-vous à la sortie du métro Lamarck-Caulaincourt pour une expérience découverte de qualité et authentique à Montmartre. 	toto	5.00	t	1	\N	2022-06-27 11:47:54.903	2022-07-01 16:07:00.56	2022-06-27 11:48:07.105	\N	1	en
18	\N	A pied	00:03:00	\N	\N	testrrr	5.00	t	1	\N	2022-06-27 12:14:45.917	2022-07-08 17:02:41.277	2022-07-05 12:11:29.78	\N	1	en
\.


--
-- Data for Name: experiences_guide_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences_guide_links (experience_id, guide_id) FROM stdin;
15	2
18	2
\.


--
-- Data for Name: experiences_languages_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences_languages_links (experience_id, language_id) FROM stdin;
18	1
\.


--
-- Data for Name: experiences_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences_localizations_links (experience_id, inv_experience_id) FROM stdin;
\.


--
-- Data for Name: experiences_themes_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences_themes_links (experience_id, theme_id) FROM stdin;
\.


--
-- Data for Name: experiences_types_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences_types_links (experience_id, experience_type_id) FROM stdin;
\.


--
-- Data for Name: favorite_places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_places (id, title, description, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	we	wewe	2022-06-28 13:07:03.568	2022-06-30 14:46:17.666	1	1	en
\.


--
-- Data for Name: favorite_places_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_places_localizations_links (favorite_place_id, inv_favorite_place_id) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	css-flexbox-poster.png	\N	\N	7200	10800	{"large": {"ext": ".png", "url": "/uploads/large_css_flexbox_poster_406ce7e866.png", "hash": "large_css_flexbox_poster_406ce7e866", "mime": "image/png", "name": "large_css-flexbox-poster.png", "path": null, "size": 470.03, "width": 667, "height": 1000}, "small": {"ext": ".png", "url": "/uploads/small_css_flexbox_poster_406ce7e866.png", "hash": "small_css_flexbox_poster_406ce7e866", "mime": "image/png", "name": "small_css-flexbox-poster.png", "path": null, "size": 190.84, "width": 333, "height": 500}, "medium": {"ext": ".png", "url": "/uploads/medium_css_flexbox_poster_406ce7e866.png", "hash": "medium_css_flexbox_poster_406ce7e866", "mime": "image/png", "name": "medium_css-flexbox-poster.png", "path": null, "size": 328.11, "width": 500, "height": 750}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_css_flexbox_poster_406ce7e866.png", "hash": "thumbnail_css_flexbox_poster_406ce7e866", "mime": "image/png", "name": "thumbnail_css-flexbox-poster.png", "path": null, "size": 34.44, "width": 104, "height": 156}}	css_flexbox_poster_406ce7e866	.png	image/png	1570.11	/uploads/css_flexbox_poster_406ce7e866.png	\N	local	\N	2022-06-27 09:49:55.52	2022-06-27 09:49:55.52	\N	\N
2	Screenshot 2021-11-09 at 12.44.04.png	\N	\N	1442	532	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_09_at_12_44_04_4cefff351a.png", "hash": "large_Screenshot_2021_11_09_at_12_44_04_4cefff351a", "mime": "image/png", "name": "large_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 122.26, "width": 1000, "height": 369}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_09_at_12_44_04_4cefff351a.png", "hash": "small_Screenshot_2021_11_09_at_12_44_04_4cefff351a", "mime": "image/png", "name": "small_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 47.02, "width": 500, "height": 184}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_09_at_12_44_04_4cefff351a.png", "hash": "medium_Screenshot_2021_11_09_at_12_44_04_4cefff351a", "mime": "image/png", "name": "medium_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 83.14, "width": 750, "height": 277}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_09_at_12_44_04_4cefff351a.png", "hash": "thumbnail_Screenshot_2021_11_09_at_12_44_04_4cefff351a", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 17.1, "width": 245, "height": 90}}	Screenshot_2021_11_09_at_12_44_04_4cefff351a	.png	image/png	42.41	/uploads/Screenshot_2021_11_09_at_12_44_04_4cefff351a.png	\N	local	\N	2022-06-27 11:18:16.583	2022-06-27 11:18:16.583	\N	\N
3	Screenshot 2021-11-08 at 14.54.27.png	\N	\N	4334	2030	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_08_at_14_54_27_c09332eb99.png", "hash": "large_Screenshot_2021_11_08_at_14_54_27_c09332eb99", "mime": "image/png", "name": "large_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 49.81, "width": 1000, "height": 468}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_08_at_14_54_27_c09332eb99.png", "hash": "small_Screenshot_2021_11_08_at_14_54_27_c09332eb99", "mime": "image/png", "name": "small_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 20.13, "width": 500, "height": 234}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_08_at_14_54_27_c09332eb99.png", "hash": "medium_Screenshot_2021_11_08_at_14_54_27_c09332eb99", "mime": "image/png", "name": "medium_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 33.06, "width": 750, "height": 351}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_08_at_14_54_27_c09332eb99.png", "hash": "thumbnail_Screenshot_2021_11_08_at_14_54_27_c09332eb99", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 8.82, "width": 245, "height": 115}}	Screenshot_2021_11_08_at_14_54_27_c09332eb99	.png	image/png	161.14	/uploads/Screenshot_2021_11_08_at_14_54_27_c09332eb99.png	\N	local	\N	2022-06-27 11:18:17.762	2022-06-27 11:18:17.762	\N	\N
4	Screenshot 2021-11-05 at 16.20.03.png	\N	\N	4372	2208	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_05_at_16_20_03_732a21cdc6.png", "hash": "large_Screenshot_2021_11_05_at_16_20_03_732a21cdc6", "mime": "image/png", "name": "large_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 50.52, "width": 1000, "height": 505}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_05_at_16_20_03_732a21cdc6.png", "hash": "small_Screenshot_2021_11_05_at_16_20_03_732a21cdc6", "mime": "image/png", "name": "small_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 19.27, "width": 500, "height": 253}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_05_at_16_20_03_732a21cdc6.png", "hash": "medium_Screenshot_2021_11_05_at_16_20_03_732a21cdc6", "mime": "image/png", "name": "medium_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 32.96, "width": 750, "height": 379}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_05_at_16_20_03_732a21cdc6.png", "hash": "thumbnail_Screenshot_2021_11_05_at_16_20_03_732a21cdc6", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 8.54, "width": 245, "height": 124}}	Screenshot_2021_11_05_at_16_20_03_732a21cdc6	.png	image/png	219.75	/uploads/Screenshot_2021_11_05_at_16_20_03_732a21cdc6.png	\N	local	\N	2022-06-27 11:18:18.258	2022-06-27 11:18:18.258	\N	\N
5	Screenshot 2021-11-24 at 17.38.26.png	\N	\N	3200	1820	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_24_at_17_38_26_c57af2b52e.png", "hash": "large_Screenshot_2021_11_24_at_17_38_26_c57af2b52e", "mime": "image/png", "name": "large_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 267.44, "width": 1000, "height": 569}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_24_at_17_38_26_c57af2b52e.png", "hash": "small_Screenshot_2021_11_24_at_17_38_26_c57af2b52e", "mime": "image/png", "name": "small_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 79.7, "width": 500, "height": 285}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_24_at_17_38_26_c57af2b52e.png", "hash": "medium_Screenshot_2021_11_24_at_17_38_26_c57af2b52e", "mime": "image/png", "name": "medium_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 159.53, "width": 750, "height": 427}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_24_at_17_38_26_c57af2b52e.png", "hash": "thumbnail_Screenshot_2021_11_24_at_17_38_26_c57af2b52e", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 24.21, "width": 245, "height": 139}}	Screenshot_2021_11_24_at_17_38_26_c57af2b52e	.png	image/png	561.35	/uploads/Screenshot_2021_11_24_at_17_38_26_c57af2b52e.png	\N	local	\N	2022-06-27 11:18:18.999	2022-06-27 11:18:18.999	\N	\N
21	portrait.png	portrait.png	portrait.png	294	309	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_portrait_1d3a37e66f.png", "hash": "thumbnail_portrait_1d3a37e66f", "mime": "image/png", "name": "thumbnail_portrait.png", "path": null, "size": 61.35, "width": 148, "height": 156}}	portrait_1d3a37e66f	.png	image/png	41.17	/uploads/portrait_1d3a37e66f.png	\N	local	\N	2022-06-28 15:29:49.025	2022-06-28 15:29:49.025	1	1
6	Screenshot 2021-11-09 at 12.44.04.png	\N	\N	1442	532	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_09_at_12_44_04_aec084cd25.png", "hash": "large_Screenshot_2021_11_09_at_12_44_04_aec084cd25", "mime": "image/png", "name": "large_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 122.26, "width": 1000, "height": 369}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_09_at_12_44_04_aec084cd25.png", "hash": "small_Screenshot_2021_11_09_at_12_44_04_aec084cd25", "mime": "image/png", "name": "small_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 47.02, "width": 500, "height": 184}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_09_at_12_44_04_aec084cd25.png", "hash": "medium_Screenshot_2021_11_09_at_12_44_04_aec084cd25", "mime": "image/png", "name": "medium_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 83.14, "width": 750, "height": 277}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_09_at_12_44_04_aec084cd25.png", "hash": "thumbnail_Screenshot_2021_11_09_at_12_44_04_aec084cd25", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 17.1, "width": 245, "height": 90}}	Screenshot_2021_11_09_at_12_44_04_aec084cd25	.png	image/png	42.41	/uploads/Screenshot_2021_11_09_at_12_44_04_aec084cd25.png	\N	local	\N	2022-06-27 11:24:20.497	2022-06-27 11:24:20.497	\N	\N
7	Screenshot 2021-11-08 at 14.54.27.png	\N	\N	4334	2030	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c.png", "hash": "large_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c", "mime": "image/png", "name": "large_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 49.81, "width": 1000, "height": 468}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c.png", "hash": "small_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c", "mime": "image/png", "name": "small_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 20.13, "width": 500, "height": 234}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c.png", "hash": "medium_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c", "mime": "image/png", "name": "medium_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 33.06, "width": 750, "height": 351}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c.png", "hash": "thumbnail_Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 8.82, "width": 245, "height": 115}}	Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c	.png	image/png	161.14	/uploads/Screenshot_2021_11_08_at_14_54_27_8dce9a6d5c.png	\N	local	\N	2022-06-27 11:24:21.769	2022-06-27 11:24:21.769	\N	\N
8	Screenshot 2021-11-05 at 16.20.03.png	\N	\N	4372	2208	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5.png", "hash": "large_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5", "mime": "image/png", "name": "large_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 50.52, "width": 1000, "height": 505}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5.png", "hash": "small_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5", "mime": "image/png", "name": "small_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 19.27, "width": 500, "height": 253}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5.png", "hash": "medium_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5", "mime": "image/png", "name": "medium_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 32.96, "width": 750, "height": 379}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5.png", "hash": "thumbnail_Screenshot_2021_11_05_at_16_20_03_694cbe6dc5", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 8.54, "width": 245, "height": 124}}	Screenshot_2021_11_05_at_16_20_03_694cbe6dc5	.png	image/png	219.75	/uploads/Screenshot_2021_11_05_at_16_20_03_694cbe6dc5.png	\N	local	\N	2022-06-27 11:24:22.103	2022-06-27 11:24:22.103	\N	\N
9	Screenshot 2021-11-24 at 17.38.26.png	\N	\N	3200	1820	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_24_at_17_38_26_3185ed45bd.png", "hash": "large_Screenshot_2021_11_24_at_17_38_26_3185ed45bd", "mime": "image/png", "name": "large_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 267.44, "width": 1000, "height": 569}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_24_at_17_38_26_3185ed45bd.png", "hash": "small_Screenshot_2021_11_24_at_17_38_26_3185ed45bd", "mime": "image/png", "name": "small_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 79.7, "width": 500, "height": 285}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_24_at_17_38_26_3185ed45bd.png", "hash": "medium_Screenshot_2021_11_24_at_17_38_26_3185ed45bd", "mime": "image/png", "name": "medium_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 159.53, "width": 750, "height": 427}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_24_at_17_38_26_3185ed45bd.png", "hash": "thumbnail_Screenshot_2021_11_24_at_17_38_26_3185ed45bd", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 24.21, "width": 245, "height": 139}}	Screenshot_2021_11_24_at_17_38_26_3185ed45bd	.png	image/png	561.35	/uploads/Screenshot_2021_11_24_at_17_38_26_3185ed45bd.png	\N	local	\N	2022-06-27 11:24:22.937	2022-06-27 11:24:22.937	\N	\N
10	Screenshot 2021-11-09 at 12.44.04.png	\N	\N	1442	532	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_09_at_12_44_04_42b853ce7b.png", "hash": "large_Screenshot_2021_11_09_at_12_44_04_42b853ce7b", "mime": "image/png", "name": "large_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 122.26, "width": 1000, "height": 369}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_09_at_12_44_04_42b853ce7b.png", "hash": "small_Screenshot_2021_11_09_at_12_44_04_42b853ce7b", "mime": "image/png", "name": "small_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 47.02, "width": 500, "height": 184}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_09_at_12_44_04_42b853ce7b.png", "hash": "medium_Screenshot_2021_11_09_at_12_44_04_42b853ce7b", "mime": "image/png", "name": "medium_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 83.14, "width": 750, "height": 277}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_09_at_12_44_04_42b853ce7b.png", "hash": "thumbnail_Screenshot_2021_11_09_at_12_44_04_42b853ce7b", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 17.1, "width": 245, "height": 90}}	Screenshot_2021_11_09_at_12_44_04_42b853ce7b	.png	image/png	42.41	/uploads/Screenshot_2021_11_09_at_12_44_04_42b853ce7b.png	\N	local	\N	2022-06-27 11:27:57.245	2022-06-27 11:27:57.245	\N	\N
11	Screenshot 2021-11-08 at 14.54.27.png	\N	\N	4334	2030	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_08_at_14_54_27_805c02d845.png", "hash": "large_Screenshot_2021_11_08_at_14_54_27_805c02d845", "mime": "image/png", "name": "large_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 49.81, "width": 1000, "height": 468}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_08_at_14_54_27_805c02d845.png", "hash": "small_Screenshot_2021_11_08_at_14_54_27_805c02d845", "mime": "image/png", "name": "small_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 20.13, "width": 500, "height": 234}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_08_at_14_54_27_805c02d845.png", "hash": "medium_Screenshot_2021_11_08_at_14_54_27_805c02d845", "mime": "image/png", "name": "medium_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 33.06, "width": 750, "height": 351}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_08_at_14_54_27_805c02d845.png", "hash": "thumbnail_Screenshot_2021_11_08_at_14_54_27_805c02d845", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 8.82, "width": 245, "height": 115}}	Screenshot_2021_11_08_at_14_54_27_805c02d845	.png	image/png	161.14	/uploads/Screenshot_2021_11_08_at_14_54_27_805c02d845.png	\N	local	\N	2022-06-27 11:27:58.647	2022-06-27 11:27:58.647	\N	\N
12	Screenshot 2021-11-05 at 16.20.03.png	\N	\N	4372	2208	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_05_at_16_20_03_145ea89e01.png", "hash": "large_Screenshot_2021_11_05_at_16_20_03_145ea89e01", "mime": "image/png", "name": "large_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 50.52, "width": 1000, "height": 505}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_05_at_16_20_03_145ea89e01.png", "hash": "small_Screenshot_2021_11_05_at_16_20_03_145ea89e01", "mime": "image/png", "name": "small_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 19.27, "width": 500, "height": 253}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_05_at_16_20_03_145ea89e01.png", "hash": "medium_Screenshot_2021_11_05_at_16_20_03_145ea89e01", "mime": "image/png", "name": "medium_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 32.96, "width": 750, "height": 379}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_05_at_16_20_03_145ea89e01.png", "hash": "thumbnail_Screenshot_2021_11_05_at_16_20_03_145ea89e01", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 8.54, "width": 245, "height": 124}}	Screenshot_2021_11_05_at_16_20_03_145ea89e01	.png	image/png	219.75	/uploads/Screenshot_2021_11_05_at_16_20_03_145ea89e01.png	\N	local	\N	2022-06-27 11:27:59.181	2022-06-27 11:27:59.181	\N	\N
13	Screenshot 2021-11-24 at 17.38.26.png	\N	\N	3200	1820	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_24_at_17_38_26_0de17d9487.png", "hash": "large_Screenshot_2021_11_24_at_17_38_26_0de17d9487", "mime": "image/png", "name": "large_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 267.44, "width": 1000, "height": 569}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_24_at_17_38_26_0de17d9487.png", "hash": "small_Screenshot_2021_11_24_at_17_38_26_0de17d9487", "mime": "image/png", "name": "small_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 79.7, "width": 500, "height": 285}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_24_at_17_38_26_0de17d9487.png", "hash": "medium_Screenshot_2021_11_24_at_17_38_26_0de17d9487", "mime": "image/png", "name": "medium_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 159.53, "width": 750, "height": 427}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_24_at_17_38_26_0de17d9487.png", "hash": "thumbnail_Screenshot_2021_11_24_at_17_38_26_0de17d9487", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 24.21, "width": 245, "height": 139}}	Screenshot_2021_11_24_at_17_38_26_0de17d9487	.png	image/png	561.35	/uploads/Screenshot_2021_11_24_at_17_38_26_0de17d9487.png	\N	local	\N	2022-06-27 11:28:00.09	2022-06-27 11:28:00.09	\N	\N
14	Screenshot 2021-11-09 at 12.44.04.png	\N	\N	1442	532	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_09_at_12_44_04_d363625d8d.png", "hash": "large_Screenshot_2021_11_09_at_12_44_04_d363625d8d", "mime": "image/png", "name": "large_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 122.26, "width": 1000, "height": 369}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_09_at_12_44_04_d363625d8d.png", "hash": "small_Screenshot_2021_11_09_at_12_44_04_d363625d8d", "mime": "image/png", "name": "small_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 47.02, "width": 500, "height": 184}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_09_at_12_44_04_d363625d8d.png", "hash": "medium_Screenshot_2021_11_09_at_12_44_04_d363625d8d", "mime": "image/png", "name": "medium_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 83.14, "width": 750, "height": 277}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_09_at_12_44_04_d363625d8d.png", "hash": "thumbnail_Screenshot_2021_11_09_at_12_44_04_d363625d8d", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 17.1, "width": 245, "height": 90}}	Screenshot_2021_11_09_at_12_44_04_d363625d8d	.png	image/png	42.41	/uploads/Screenshot_2021_11_09_at_12_44_04_d363625d8d.png	\N	local	\N	2022-06-27 11:47:51.951	2022-06-27 11:47:51.951	\N	\N
15	Screenshot 2021-11-08 at 14.54.27.png	\N	\N	4334	2030	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_08_at_14_54_27_2e10947976.png", "hash": "large_Screenshot_2021_11_08_at_14_54_27_2e10947976", "mime": "image/png", "name": "large_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 49.81, "width": 1000, "height": 468}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_08_at_14_54_27_2e10947976.png", "hash": "small_Screenshot_2021_11_08_at_14_54_27_2e10947976", "mime": "image/png", "name": "small_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 20.13, "width": 500, "height": 234}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_08_at_14_54_27_2e10947976.png", "hash": "medium_Screenshot_2021_11_08_at_14_54_27_2e10947976", "mime": "image/png", "name": "medium_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 33.06, "width": 750, "height": 351}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_08_at_14_54_27_2e10947976.png", "hash": "thumbnail_Screenshot_2021_11_08_at_14_54_27_2e10947976", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 8.82, "width": 245, "height": 115}}	Screenshot_2021_11_08_at_14_54_27_2e10947976	.png	image/png	161.14	/uploads/Screenshot_2021_11_08_at_14_54_27_2e10947976.png	\N	local	\N	2022-06-27 11:47:53.335	2022-06-27 11:47:53.335	\N	\N
16	Screenshot 2021-11-05 at 16.20.03.png	\N	\N	4372	2208	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a.png", "hash": "large_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a", "mime": "image/png", "name": "large_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 50.52, "width": 1000, "height": 505}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a.png", "hash": "small_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a", "mime": "image/png", "name": "small_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 19.27, "width": 500, "height": 253}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a.png", "hash": "medium_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a", "mime": "image/png", "name": "medium_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 32.96, "width": 750, "height": 379}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a.png", "hash": "thumbnail_Screenshot_2021_11_05_at_16_20_03_4a1edcc27a", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-05 at 16.20.03.png", "path": null, "size": 8.54, "width": 245, "height": 124}}	Screenshot_2021_11_05_at_16_20_03_4a1edcc27a	.png	image/png	219.75	/uploads/Screenshot_2021_11_05_at_16_20_03_4a1edcc27a.png	\N	local	\N	2022-06-27 11:47:53.687	2022-06-27 11:47:53.687	\N	\N
17	Screenshot 2021-11-24 at 17.38.26.png	\N	\N	3200	1820	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_24_at_17_38_26_269042cbe9.png", "hash": "large_Screenshot_2021_11_24_at_17_38_26_269042cbe9", "mime": "image/png", "name": "large_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 267.44, "width": 1000, "height": 569}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_24_at_17_38_26_269042cbe9.png", "hash": "small_Screenshot_2021_11_24_at_17_38_26_269042cbe9", "mime": "image/png", "name": "small_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 79.7, "width": 500, "height": 285}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_24_at_17_38_26_269042cbe9.png", "hash": "medium_Screenshot_2021_11_24_at_17_38_26_269042cbe9", "mime": "image/png", "name": "medium_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 159.53, "width": 750, "height": 427}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_24_at_17_38_26_269042cbe9.png", "hash": "thumbnail_Screenshot_2021_11_24_at_17_38_26_269042cbe9", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 24.21, "width": 245, "height": 139}}	Screenshot_2021_11_24_at_17_38_26_269042cbe9	.png	image/png	561.35	/uploads/Screenshot_2021_11_24_at_17_38_26_269042cbe9.png	\N	local	\N	2022-06-27 11:47:54.58	2022-06-27 11:47:54.58	\N	\N
18	Screenshot 2021-11-09 at 12.44.04.png	\N	\N	1442	532	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6.png", "hash": "large_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6", "mime": "image/png", "name": "large_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 122.26, "width": 1000, "height": 369}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6.png", "hash": "small_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6", "mime": "image/png", "name": "small_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 47.02, "width": 500, "height": 184}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6.png", "hash": "medium_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6", "mime": "image/png", "name": "medium_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 83.14, "width": 750, "height": 277}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6.png", "hash": "thumbnail_Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-09 at 12.44.04.png", "path": null, "size": 17.1, "width": 245, "height": 90}}	Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6	.png	image/png	42.41	/uploads/Screenshot_2021_11_09_at_12_44_04_3fd0aeb7d6.png	\N	local	\N	2022-06-27 12:13:02.049	2022-06-27 12:13:02.049	\N	\N
19	Screenshot 2021-11-08 at 14.54.27.png	\N	\N	4334	2030	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_08_at_14_54_27_27d882e4e6.png", "hash": "large_Screenshot_2021_11_08_at_14_54_27_27d882e4e6", "mime": "image/png", "name": "large_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 49.81, "width": 1000, "height": 468}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_08_at_14_54_27_27d882e4e6.png", "hash": "small_Screenshot_2021_11_08_at_14_54_27_27d882e4e6", "mime": "image/png", "name": "small_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 20.13, "width": 500, "height": 234}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_08_at_14_54_27_27d882e4e6.png", "hash": "medium_Screenshot_2021_11_08_at_14_54_27_27d882e4e6", "mime": "image/png", "name": "medium_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 33.06, "width": 750, "height": 351}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_08_at_14_54_27_27d882e4e6.png", "hash": "thumbnail_Screenshot_2021_11_08_at_14_54_27_27d882e4e6", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-08 at 14.54.27.png", "path": null, "size": 8.82, "width": 245, "height": 115}}	Screenshot_2021_11_08_at_14_54_27_27d882e4e6	.png	image/png	161.14	/uploads/Screenshot_2021_11_08_at_14_54_27_27d882e4e6.png	\N	local	\N	2022-06-27 12:13:03.563	2022-06-27 12:13:03.563	\N	\N
20	Screenshot 2021-11-24 at 17.38.26.png	\N	\N	3200	1820	{"large": {"ext": ".png", "url": "/uploads/large_Screenshot_2021_11_24_at_17_38_26_06989228b7.png", "hash": "large_Screenshot_2021_11_24_at_17_38_26_06989228b7", "mime": "image/png", "name": "large_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 267.44, "width": 1000, "height": 569}, "small": {"ext": ".png", "url": "/uploads/small_Screenshot_2021_11_24_at_17_38_26_06989228b7.png", "hash": "small_Screenshot_2021_11_24_at_17_38_26_06989228b7", "mime": "image/png", "name": "small_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 79.7, "width": 500, "height": 285}, "medium": {"ext": ".png", "url": "/uploads/medium_Screenshot_2021_11_24_at_17_38_26_06989228b7.png", "hash": "medium_Screenshot_2021_11_24_at_17_38_26_06989228b7", "mime": "image/png", "name": "medium_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 159.53, "width": 750, "height": 427}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2021_11_24_at_17_38_26_06989228b7.png", "hash": "thumbnail_Screenshot_2021_11_24_at_17_38_26_06989228b7", "mime": "image/png", "name": "thumbnail_Screenshot 2021-11-24 at 17.38.26.png", "path": null, "size": 24.21, "width": 245, "height": 139}}	Screenshot_2021_11_24_at_17_38_26_06989228b7	.png	image/png	561.35	/uploads/Screenshot_2021_11_24_at_17_38_26_06989228b7.png	\N	local	\N	2022-06-27 12:13:04.569	2022-06-27 12:13:04.569	\N	\N
22	exp_photo.png	exp_photo.png	exp_photo.png	532	358	{"small": {"ext": ".png", "url": "/uploads/small_exp_photo_24c60058a2.png", "hash": "small_exp_photo_24c60058a2", "mime": "image/png", "name": "small_exp_photo.png", "path": null, "size": 405.41, "width": 500, "height": 336}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_exp_photo_24c60058a2.png", "hash": "thumbnail_exp_photo_24c60058a2", "mime": "image/png", "name": "thumbnail_exp_photo.png", "path": null, "size": 97.65, "width": 232, "height": 156}}	exp_photo_24c60058a2	.png	image/png	112.47	/uploads/exp_photo_24c60058a2.png	\N	local	\N	2022-06-28 15:33:37.391	2022-06-28 15:33:37.391	1	1
23	Vigny.jpeg	Vigny.jpeg	Vigny.jpeg	1008	750	{"large": {"ext": ".jpeg", "url": "/uploads/large_Vigny_9fc8a6402a.jpeg", "hash": "large_Vigny_9fc8a6402a", "mime": "image/jpeg", "name": "large_Vigny.jpeg", "path": null, "size": 168.68, "width": 1000, "height": 744}, "small": {"ext": ".jpeg", "url": "/uploads/small_Vigny_9fc8a6402a.jpeg", "hash": "small_Vigny_9fc8a6402a", "mime": "image/jpeg", "name": "small_Vigny.jpeg", "path": null, "size": 57, "width": 500, "height": 372}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_Vigny_9fc8a6402a.jpeg", "hash": "medium_Vigny_9fc8a6402a", "mime": "image/jpeg", "name": "medium_Vigny.jpeg", "path": null, "size": 109.03, "width": 750, "height": 558}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_Vigny_9fc8a6402a.jpeg", "hash": "thumbnail_Vigny_9fc8a6402a", "mime": "image/jpeg", "name": "thumbnail_Vigny.jpeg", "path": null, "size": 11.51, "width": 210, "height": 156}}	Vigny_9fc8a6402a	.jpeg	image/jpeg	174.09	/uploads/Vigny_9fc8a6402a.jpeg	\N	local	\N	2022-06-28 15:33:58.589	2022-06-28 15:33:58.589	1	1
24	Logo.png	\N	\N	108	108	\N	Logo_f2348c0e0b	.png	image/png	0.57	/uploads/Logo_f2348c0e0b.png	\N	local	\N	2022-07-20 14:37:03.223	2022-07-20 14:37:03.223	1	1
25	IMG_20220415_091201.jpeg	\N	\N	4000	3000	{"large": {"ext": ".jpeg", "url": "/uploads/large_IMG_20220415_091201_b0c52c80b6.jpeg", "hash": "large_IMG_20220415_091201_b0c52c80b6", "mime": "image/jpeg", "name": "large_IMG_20220415_091201.jpeg", "path": null, "size": 132.69, "width": 1000, "height": 750}, "small": {"ext": ".jpeg", "url": "/uploads/small_IMG_20220415_091201_b0c52c80b6.jpeg", "hash": "small_IMG_20220415_091201_b0c52c80b6", "mime": "image/jpeg", "name": "small_IMG_20220415_091201.jpeg", "path": null, "size": 31.22, "width": 500, "height": 375}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_IMG_20220415_091201_b0c52c80b6.jpeg", "hash": "medium_IMG_20220415_091201_b0c52c80b6", "mime": "image/jpeg", "name": "medium_IMG_20220415_091201.jpeg", "path": null, "size": 71.83, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_IMG_20220415_091201_b0c52c80b6.jpeg", "hash": "thumbnail_IMG_20220415_091201_b0c52c80b6", "mime": "image/jpeg", "name": "thumbnail_IMG_20220415_091201.jpeg", "path": null, "size": 6.07, "width": 208, "height": 156}}	IMG_20220415_091201_b0c52c80b6	.jpeg	image/jpeg	2029.48	/uploads/IMG_20220415_091201_b0c52c80b6.jpeg	\N	local	\N	2022-07-20 14:41:31.235	2022-07-20 14:41:31.235	1	1
26	IMG_20220415_091201.jpeg	\N	\N	4000	3000	{"large": {"ext": ".jpeg", "url": "/uploads/large_IMG_20220415_091201_3011f24b5e.jpeg", "hash": "large_IMG_20220415_091201_3011f24b5e", "mime": "image/jpeg", "name": "large_IMG_20220415_091201.jpeg", "path": null, "size": 132.69, "width": 1000, "height": 750}, "small": {"ext": ".jpeg", "url": "/uploads/small_IMG_20220415_091201_3011f24b5e.jpeg", "hash": "small_IMG_20220415_091201_3011f24b5e", "mime": "image/jpeg", "name": "small_IMG_20220415_091201.jpeg", "path": null, "size": 31.22, "width": 500, "height": 375}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_IMG_20220415_091201_3011f24b5e.jpeg", "hash": "medium_IMG_20220415_091201_3011f24b5e", "mime": "image/jpeg", "name": "medium_IMG_20220415_091201.jpeg", "path": null, "size": 71.83, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_IMG_20220415_091201_3011f24b5e.jpeg", "hash": "thumbnail_IMG_20220415_091201_3011f24b5e", "mime": "image/jpeg", "name": "thumbnail_IMG_20220415_091201.jpeg", "path": null, "size": 6.07, "width": 208, "height": 156}}	IMG_20220415_091201_3011f24b5e	.jpeg	image/jpeg	2029.48	/uploads/IMG_20220415_091201_3011f24b5e.jpeg	\N	local	\N	2022-07-20 14:49:34.93	2022-07-20 14:49:34.93	1	1
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_morphs (file_id, related_id, related_type, field, "order") FROM stdin;
8	13	api::experience.experience	photos	1
7	13	api::experience.experience	photos	2
6	13	api::experience.experience	photos	3
9	13	api::experience.experience	photos	4
19	17	api::experience.experience	photos	1
18	17	api::experience.experience	photos	2
20	17	api::experience.experience	photos	3
23	18	api::experience.experience	photos	1
22	18	api::experience.experience	photos	2
23	1	api::favorite-place.favorite-place	picture	1
23	2	plugin::users-permissions.user	picture	1
16	15	api::experience.experience	photos	1
15	15	api::experience.experience	photos	2
14	15	api::experience.experience	photos	3
17	15	api::experience.experience	photos	4
23	1	plugin::users-permissions.user	picture	1
26	1	plugin::strapi-stripe.strapi-stripe-product	productImage	1
\.


--
-- Data for Name: guides; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guides (id, created_at, updated_at, created_by_id, updated_by_id, headline, description, background, interests, specialties, work_experiences, location) FROM stdin;
2	2022-07-01 12:26:37.783	2022-07-06 11:38:49.092	1	1	Jeune guide-conférencière diplômée de l’Ecole du Louvre	Jeune guide-conférencière diplômée de l’Ecole du Louvre\nBonjour, je m’appelle Héloïse et je serais peut-être votre prochaine guide pour une merveilleuse expérience culturelle avec Musée Up’ !\nDiplômée en littérature de l’Université de Paris et de l’école du Louvre en médiation culturelle, cela fait bientôt 3 ans que j’exerce le métier de guide-conférencière en Île-de-France. \nJe suis passionnée par l’histoire de l’art, la littérature française du XIXe siècle ainsi que par la médiation et le partage, notamment avec les enfants. \nBonjour, je m’appelle Héloïse et je serais peut-être votre prochaine guide pour une merveilleuse expérience culturelle avec Musée Up’ !\nDiplômée en littérature de l’Université de Paris et de l’école du Louvre en médiation culturelle, cela fait bientôt 3 ans que j’exerce le métier de guide-conférencière en Île-de-France. \nJe suis passionnée par l’histoire de l’art, la littérature française du XIXe siècle ainsi que par la médiation et le partage, notamment avec les enfants. \nJe suis passionnée par l’histoire de l’art, la littérature française du XIXe siècle ainsi que par la médiation et le partage, notamment avec les enfants. 	Bonjour, je m’appelle Héloïse et je serais peut-être votre prochaine guide pour une merveilleuse expérience culturelle avec Musée Up’ !\nDiplômée en littérature de l’Université de Paris et de l’école du Louvre en médiation culturelle, cela fait bientôt 3 ans que j’exerce le métier de guide-conférencière en Île-de-France. \nJe suis passionnée par l’histoire de l’art, la littérature française du XIXe siècle ainsi que par la médiation et le partage, notamment avec les enfants. \nBonjour, je m’appelle Héloïse et je serais peut-être votre prochaine guide pour une merveilleuse expérience culturelle avec Musée Up’ !	[]	["hard word"]	["bac"]	Paris
\.


--
-- Data for Name: guides_favorite_place_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guides_favorite_place_links (guide_id, favorite_place_id) FROM stdin;
2	1
\.


--
-- Data for Name: guides_languages_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guides_languages_links (guide_id, language_id) FROM stdin;
2	1
\.


--
-- Data for Name: guides_user_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guides_user_links (guide_id, user_id) FROM stdin;
2	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2022-06-21 11:16:39.486	2022-06-21 11:16:39.486	\N	\N
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, value, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	Francais	2022-07-06 11:38:30.134	2022-07-06 11:38:30.134	1	1	en
\.


--
-- Data for Name: languages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages_localizations_links (language_id, inv_language_id) FROM stdin;
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: rooms_owners_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_owners_links (room_id, user_id) FROM stdin;
\.


--
-- Data for Name: slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slots (id, start, "end", created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	2022-07-12 00:00:00	2022-07-12 00:00:00	2022-07-20 16:28:11.557	2022-07-20 16:29:07.007	1	1
\.


--
-- Data for Name: slots_experience_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slots_experience_links (slot_id, experience_id) FROM stdin;
1	15
\.


--
-- Data for Name: slots_guide_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slots_guide_links (slot_id, guide_id) FROM stdin;
1	2
\.


--
-- Data for Name: strapi-stripe_strapi-stripe-payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."strapi-stripe_strapi-stripe-payment" (id, txn_date, transaction_id, is_txn_successful, txn_message, txn_error_message, txn_amount, customer_name, customer_email, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi-stripe_strapi-stripe-product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."strapi-stripe_strapi-stripe-product" (id, title, slug, description, price, currency, is_subscription, "interval", trial_period_days, stripe_product_id, stripe_price_id, stripe_plan_id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	test	\N	test	12.00	eur	f		\N	prod_M5nxMtyMDL10ed	price_1LNcLLDd7qdiUhfouInmJChQ		2022-07-20 14:49:36.108	2022-07-20 14:49:36.108	\N	\N
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"editRelations":["role"],"edit":[[{"name":"action","size":6}]]}}	object	\N	\N
20	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"guide":{"type":"relation","relation":"oneToOne","target":"api::guide.guide","mappedBy":"user"},"friends":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user"},"socketID":{"type":"string","unique":true},"rooms":{"type":"relation","relation":"manyToMany","target":"api::room.room","mappedBy":"owners"},"phone":{"type":"string"},"firstname":{"type":"string"},"lastname":{"type":"string","unique":true},"location":{"type":"string","unique":true},"picture":{"allowedTypes":["images"],"type":"media","multiple":false},"bookings":{"type":"relation","relation":"oneToMany","target":"api::booking.booking","mappedBy":"user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"guide":{"type":"relation","relation":"oneToOne","target":"api::guide.guide","mappedBy":"user"},"friends":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user"},"socketID":{"type":"string","unique":true},"rooms":{"type":"relation","relation":"manyToMany","target":"api::room.room","mappedBy":"owners"},"phone":{"type":"string"},"firstname":{"type":"string"},"lastname":{"type":"string","unique":true},"location":{"type":"string","unique":true},"picture":{"allowedTypes":["images"],"type":"media","multiple":false},"bookings":{"type":"relation","relation":"oneToMany","target":"api::booking.booking","mappedBy":"user"}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"plugin::strapi-stripe.strapi-stripe-product":{"info":{"tableName":"StrapiStripeProduct","singularName":"strapi-stripe-product","pluralName":"strapi-stripe-products","displayName":"Product","description":"Stripe Products","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","min":1,"required":true,"configurable":false},"slug":{"type":"uid","targetField":"title","unique":true,"required":true,"configurable":false},"description":{"type":"string","min":1,"required":true,"configurable":false},"price":{"type":"decimal","required":true,"configurable":false},"currency":{"type":"string","min":1,"required":true,"configurable":false},"productImage":{"type":"media","required":true,"configurable":false},"isSubscription":{"type":"boolean","default":false,"configurable":false},"interval":{"type":"string","configurable":false},"trialPeriodDays":{"type":"integer","configurable":false},"stripeProductId":{"type":"string","min":3,"required":true,"configurable":false},"stripePriceId":{"type":"string","min":3,"configurable":false},"stripePlanId":{"type":"string","min":3,"configurable":false},"stripePayment":{"type":"relation","relation":"oneToMany","target":"plugin::strapi-stripe.strapi-stripe-payment","mappedBy":"stripeProduct","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"tableName":"StrapiStripeProduct","singularName":"strapi-stripe-product","pluralName":"strapi-stripe-products","displayName":"Product","description":"Stripe Products","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","min":1,"required":true,"configurable":false},"slug":{"type":"uid","targetField":"title","unique":true,"required":true,"configurable":false},"description":{"type":"string","min":1,"required":true,"configurable":false},"price":{"type":"decimal","required":true,"configurable":false},"currency":{"type":"string","min":1,"required":true,"configurable":false},"productImage":{"type":"media","required":true,"configurable":false},"isSubscription":{"type":"boolean","default":false,"configurable":false},"interval":{"type":"string","configurable":false},"trialPeriodDays":{"type":"integer","configurable":false},"stripeProductId":{"type":"string","min":3,"required":true,"configurable":false},"stripePriceId":{"type":"string","min":3,"configurable":false},"stripePlanId":{"type":"string","min":3,"configurable":false},"stripePayment":{"type":"relation","relation":"oneToMany","target":"plugin::strapi-stripe.strapi-stripe-payment","mappedBy":"stripeProduct","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"strapi-stripe-product","connection":"default","uid":"plugin::strapi-stripe.strapi-stripe-product","plugin":"strapi-stripe","collectionName":"strapi-stripe_strapi-stripe-product","globalId":"StrapiStripeStrapiStripeProduct"},"plugin::strapi-stripe.strapi-stripe-payment":{"info":{"tableName":"StrapiStripePayment","singularName":"strapi-stripe-payment","pluralName":"strapi-stripe-payments","displayName":"Payment","description":"Stripe Payment","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"txnDate":{"type":"datetime","required":true,"configurable":false},"transactionId":{"type":"string","maxLength":250,"required":true,"configurable":false},"isTxnSuccessful":{"type":"boolean","default":false,"configurable":false},"txnMessage":{"type":"string","maxLength":5000,"configurable":false},"txnErrorMessage":{"type":"string","maxLength":250,"configurable":false},"txnAmount":{"type":"decimal","required":true,"configurable":false},"customerName":{"type":"string","required":true,"configurable":false},"customerEmail":{"type":"string","required":true,"configurable":false},"stripeProduct":{"type":"relation","relation":"manyToOne","target":"plugin::strapi-stripe.strapi-stripe-product","inversedBy":"stripePayment","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"tableName":"StrapiStripePayment","singularName":"strapi-stripe-payment","pluralName":"strapi-stripe-payments","displayName":"Payment","description":"Stripe Payment","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"txnDate":{"type":"datetime","required":true,"configurable":false},"transactionId":{"type":"string","maxLength":250,"required":true,"configurable":false},"isTxnSuccessful":{"type":"boolean","default":false,"configurable":false},"txnMessage":{"type":"string","maxLength":5000,"configurable":false},"txnErrorMessage":{"type":"string","maxLength":250,"configurable":false},"txnAmount":{"type":"decimal","required":true,"configurable":false},"customerName":{"type":"string","required":true,"configurable":false},"customerEmail":{"type":"string","required":true,"configurable":false},"stripeProduct":{"type":"relation","relation":"manyToOne","target":"plugin::strapi-stripe.strapi-stripe-product","inversedBy":"stripePayment","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"strapi-stripe-payment","connection":"default","uid":"plugin::strapi-stripe.strapi-stripe-payment","plugin":"strapi-stripe","collectionName":"strapi-stripe_strapi-stripe-payment","globalId":"StrapiStripeStrapiStripePayment"},"api::booking.booking":{"kind":"collectionType","collectionName":"bookings","info":{"singularName":"booking","pluralName":"bookings","displayName":"Booking"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"user":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user","inversedBy":"bookings"},"experience":{"type":"relation","relation":"manyToOne","target":"api::experience.experience","inversedBy":"bookings"},"size":{"type":"integer"},"slot":{"type":"relation","relation":"manyToOne","target":"api::slot.slot","inversedBy":"bookings"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"bookings","info":{"singularName":"booking","pluralName":"bookings","displayName":"Booking"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"user":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user","inversedBy":"bookings"},"experience":{"type":"relation","relation":"manyToOne","target":"api::experience.experience","inversedBy":"bookings"},"size":{"type":"integer"},"slot":{"type":"relation","relation":"manyToOne","target":"api::slot.slot","inversedBy":"bookings"}},"kind":"collectionType"},"modelType":"contentType","modelName":"booking","connection":"default","uid":"api::booking.booking","apiName":"booking","globalId":"Booking","actions":{},"lifecycles":{}},"api::experience.experience":{"kind":"collectionType","collectionName":"experiences","info":{"singularName":"experience","pluralName":"experiences","displayName":"Experience","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"language":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"transportation":{"pluginOptions":{"i18n":{"localized":true}},"type":"enumeration","enum":["A pied","A Vélo"],"default":"A pied"},"duration":{"pluginOptions":{"i18n":{"localized":true}},"type":"time","default":"00:30"},"price":{"pluginOptions":{"i18n":{"localized":true}},"type":"decimal"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text"},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"stars":{"pluginOptions":{"i18n":{"localized":true}},"type":"decimal","min":0,"default":5,"max":5,"unique":false},"handifriendly":{"pluginOptions":{"i18n":{"localized":true}},"type":"boolean","default":true},"photos":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":true}}},"languages":{"type":"relation","relation":"oneToMany","target":"api::language.language"},"groupSize":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer","default":1,"min":1},"themes":{"type":"relation","relation":"oneToMany","target":"api::theme.theme"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"types":{"type":"relation","relation":"oneToMany","target":"api::experience-type.experience-type"},"guide":{"type":"relation","relation":"manyToOne","target":"api::guide.guide","inversedBy":"experiences"},"bookings":{"type":"relation","relation":"oneToMany","target":"api::booking.booking","mappedBy":"experience"},"slots":{"type":"relation","relation":"oneToMany","target":"api::slot.slot","mappedBy":"experience"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::experience.experience"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"experiences","info":{"singularName":"experience","pluralName":"experiences","displayName":"Experience","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"language":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"transportation":{"pluginOptions":{"i18n":{"localized":true}},"type":"enumeration","enum":["A pied","A Vélo"],"default":"A pied"},"duration":{"pluginOptions":{"i18n":{"localized":true}},"type":"time","default":"00:30"},"price":{"pluginOptions":{"i18n":{"localized":true}},"type":"decimal"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text"},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"stars":{"pluginOptions":{"i18n":{"localized":true}},"type":"decimal","min":0,"default":5,"max":5,"unique":false},"handifriendly":{"pluginOptions":{"i18n":{"localized":true}},"type":"boolean","default":true},"photos":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":true}}},"languages":{"type":"relation","relation":"oneToMany","target":"api::language.language"},"groupSize":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer","default":1,"min":1},"themes":{"type":"relation","relation":"oneToMany","target":"api::theme.theme"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"types":{"type":"relation","relation":"oneToMany","target":"api::experience-type.experience-type"},"guide":{"type":"relation","relation":"manyToOne","target":"api::guide.guide","inversedBy":"experiences"},"bookings":{"type":"relation","relation":"oneToMany","target":"api::booking.booking","mappedBy":"experience"},"slots":{"type":"relation","relation":"oneToMany","target":"api::slot.slot","mappedBy":"experience"}},"kind":"collectionType"},"modelType":"contentType","modelName":"experience","connection":"default","uid":"api::experience.experience","apiName":"experience","globalId":"Experience","actions":{},"lifecycles":{}},"api::experience-type.experience-type":{"kind":"collectionType","collectionName":"experience_types","info":{"singularName":"experience-type","pluralName":"experience-types","displayName":"experienceType"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::experience-type.experience-type"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"experience_types","info":{"singularName":"experience-type","pluralName":"experience-types","displayName":"experienceType"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"experience-type","connection":"default","uid":"api::experience-type.experience-type","apiName":"experience-type","globalId":"ExperienceType","actions":{},"lifecycles":{}},"api::favorite-place.favorite-place":{"kind":"collectionType","collectionName":"favorite_places","info":{"singularName":"favorite-place","pluralName":"favorite-places","displayName":"FavoritePlace","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"picture":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":true}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","unique":true,"required":false},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":false},"guide":{"type":"relation","relation":"oneToOne","target":"api::guide.guide","mappedBy":"favorite_place"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::favorite-place.favorite-place"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"favorite_places","info":{"singularName":"favorite-place","pluralName":"favorite-places","displayName":"FavoritePlace","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"picture":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":true}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","unique":true,"required":false},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":false},"guide":{"type":"relation","relation":"oneToOne","target":"api::guide.guide","mappedBy":"favorite_place"}},"kind":"collectionType"},"modelType":"contentType","modelName":"favorite-place","connection":"default","uid":"api::favorite-place.favorite-place","apiName":"favorite-place","globalId":"FavoritePlace","actions":{},"lifecycles":{}},"api::guide.guide":{"kind":"collectionType","collectionName":"guides","info":{"singularName":"guide","pluralName":"guides","displayName":"guide","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"experiences":{"type":"relation","relation":"oneToMany","target":"api::experience.experience","mappedBy":"guide"},"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user","inversedBy":"guide"},"headline":{"type":"string","unique":false},"description":{"type":"text"},"background":{"type":"text"},"languages":{"type":"relation","relation":"oneToMany","target":"api::language.language"},"interests":{"type":"json"},"specialties":{"type":"json"},"workExperiences":{"type":"json"},"favorite_place":{"type":"relation","relation":"oneToOne","target":"api::favorite-place.favorite-place","inversedBy":"guide"},"location":{"type":"string"},"slots":{"type":"relation","relation":"oneToMany","target":"api::slot.slot","mappedBy":"guide"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"guides","info":{"singularName":"guide","pluralName":"guides","displayName":"guide","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"experiences":{"type":"relation","relation":"oneToMany","target":"api::experience.experience","mappedBy":"guide"},"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user","inversedBy":"guide"},"headline":{"type":"string","unique":false},"description":{"type":"text"},"background":{"type":"text"},"languages":{"type":"relation","relation":"oneToMany","target":"api::language.language"},"interests":{"type":"json"},"specialties":{"type":"json"},"workExperiences":{"type":"json"},"favorite_place":{"type":"relation","relation":"oneToOne","target":"api::favorite-place.favorite-place","inversedBy":"guide"},"location":{"type":"string"},"slots":{"type":"relation","relation":"oneToMany","target":"api::slot.slot","mappedBy":"guide"}},"kind":"collectionType"},"modelType":"contentType","modelName":"guide","connection":"default","uid":"api::guide.guide","apiName":"guide","globalId":"Guide","actions":{},"lifecycles":{}},"api::language.language":{"kind":"collectionType","collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"language","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"value":{"type":"enumeration","enum":["Francais","English","Spanish"],"pluginOptions":{"i18n":{"localized":true}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::language.language"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"language","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"value":{"type":"enumeration","enum":["Francais","English","Spanish"],"pluginOptions":{"i18n":{"localized":true}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"language","connection":"default","uid":"api::language.language","apiName":"language","globalId":"Language","actions":{},"lifecycles":{}},"api::room.room":{"kind":"collectionType","collectionName":"rooms","info":{"singularName":"room","pluralName":"rooms","displayName":"Room","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"owners":{"type":"relation","relation":"manyToMany","target":"plugin::users-permissions.user","inversedBy":"rooms"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"rooms","info":{"singularName":"room","pluralName":"rooms","displayName":"Room","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"owners":{"type":"relation","relation":"manyToMany","target":"plugin::users-permissions.user","inversedBy":"rooms"}},"kind":"collectionType"},"modelType":"contentType","modelName":"room","connection":"default","uid":"api::room.room","apiName":"room","globalId":"Room","actions":{},"lifecycles":{}},"api::slot.slot":{"kind":"collectionType","collectionName":"slots","info":{"singularName":"slot","pluralName":"slots","displayName":"Slot","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"start":{"type":"datetime"},"end":{"type":"datetime"},"experience":{"type":"relation","relation":"manyToOne","target":"api::experience.experience","inversedBy":"slots"},"guide":{"type":"relation","relation":"manyToOne","target":"api::guide.guide","inversedBy":"slots"},"bookings":{"type":"relation","relation":"oneToMany","target":"api::booking.booking","mappedBy":"slot"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"slots","info":{"singularName":"slot","pluralName":"slots","displayName":"Slot","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"start":{"type":"datetime"},"end":{"type":"datetime"},"experience":{"type":"relation","relation":"manyToOne","target":"api::experience.experience","inversedBy":"slots"},"guide":{"type":"relation","relation":"manyToOne","target":"api::guide.guide","inversedBy":"slots"},"bookings":{"type":"relation","relation":"oneToMany","target":"api::booking.booking","mappedBy":"slot"}},"kind":"collectionType"},"modelType":"contentType","modelName":"slot","connection":"default","uid":"api::slot.slot","apiName":"slot","globalId":"Slot","actions":{},"lifecycles":{}},"api::theme.theme":{"kind":"collectionType","collectionName":"themes","info":{"singularName":"theme","pluralName":"themes","displayName":"theme","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"pluginOptions":{"i18n":{"localized":true}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::theme.theme"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"themes","info":{"singularName":"theme","pluralName":"themes","displayName":"theme","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"pluginOptions":{"i18n":{"localized":true}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"theme","connection":"default","uid":"api::theme.theme","apiName":"theme","globalId":"Theme","actions":{},"lifecycles":{}}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}	object	\N	\N
15	plugin_content_manager_configuration_content_types::api::experience-type.experience-type	{"uid":"api::experience-type.experience-type","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","createdAt","updatedAt"],"editRelations":[],"edit":[[{"name":"name","size":6}]]}}	object	\N	\N
21	plugin_i18n_default_locale	"en"	string	\N	\N
22	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}	object	\N	\N
23	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
24	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"guide":{"edit":{"label":"guide","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"guide","searchable":true,"sortable":true}},"friends":{"edit":{"label":"friends","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"friends","searchable":false,"sortable":false}},"socketID":{"edit":{"label":"socketID","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socketID","searchable":true,"sortable":true}},"rooms":{"edit":{"label":"rooms","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"rooms","searchable":false,"sortable":false}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"picture":{"edit":{"label":"picture","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"picture","searchable":false,"sortable":false}},"bookings":{"edit":{"label":"bookings","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"bookings","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"socketID","size":6}],[{"name":"phone","size":6},{"name":"firstname","size":6}],[{"name":"lastname","size":6},{"name":"location","size":6}],[{"name":"picture","size":6}]],"editRelations":["role","guide","friends","rooms","bookings"]}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::api::experience.experience	{"uid":"api::experience.experience","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"language","defaultSortBy":"language","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"transportation":{"edit":{"label":"transportation","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"transportation","searchable":true,"sortable":true}},"duration":{"edit":{"label":"duration","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"duration","searchable":true,"sortable":true}},"price":{"edit":{"label":"price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"stars":{"edit":{"label":"stars","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stars","searchable":true,"sortable":true}},"handifriendly":{"edit":{"label":"handifriendly","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"handifriendly","searchable":true,"sortable":true}},"photos":{"edit":{"label":"photos","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"photos","searchable":false,"sortable":false}},"languages":{"edit":{"label":"languages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"languages","searchable":false,"sortable":false}},"groupSize":{"edit":{"label":"groupSize","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"groupSize","searchable":true,"sortable":true}},"themes":{"edit":{"label":"themes","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"themes","searchable":false,"sortable":false}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"types":{"edit":{"label":"types","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"types","searchable":false,"sortable":false}},"guide":{"edit":{"label":"guide","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"guide","searchable":true,"sortable":true}},"bookings":{"edit":{"label":"bookings","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"bookings","searchable":false,"sortable":false}},"slots":{"edit":{"label":"slots","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"slots","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","language","transportation","duration"],"edit":[[{"name":"language","size":6},{"name":"transportation","size":6}],[{"name":"duration","size":4},{"name":"price","size":4}],[{"name":"description","size":6},{"name":"title","size":6}],[{"name":"stars","size":4},{"name":"handifriendly","size":4}],[{"name":"photos","size":6},{"name":"groupSize","size":4}],[{"name":"location","size":6}]],"editRelations":["languages","themes","types","guide","bookings","slots"]}}	object	\N	\N
12	plugin_content_manager_configuration_content_types::api::guide.guide	{"uid":"api::guide.guide","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"experiences":{"edit":{"label":"experiences","description":"","placeholder":"","visible":true,"editable":true,"mainField":"language"},"list":{"label":"experiences","searchable":false,"sortable":false}},"user":{"edit":{"label":"user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"user","searchable":true,"sortable":true}},"headline":{"edit":{"label":"headline","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"headline","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"background":{"edit":{"label":"background","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"background","searchable":true,"sortable":true}},"languages":{"edit":{"label":"languages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"languages","searchable":false,"sortable":false}},"interests":{"edit":{"label":"interests","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"interests","searchable":false,"sortable":false}},"specialties":{"edit":{"label":"specialties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"specialties","searchable":false,"sortable":false}},"workExperiences":{"edit":{"label":"workExperiences","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"workExperiences","searchable":false,"sortable":false}},"favorite_place":{"edit":{"label":"favorite_place","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"favorite_place","searchable":true,"sortable":true}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"slots":{"edit":{"label":"slots","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"slots","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","experiences","user","slots"],"edit":[[{"name":"headline","size":6},{"name":"description","size":6}],[{"name":"background","size":6}],[{"name":"interests","size":12}],[{"name":"specialties","size":12}],[{"name":"workExperiences","size":12}],[{"name":"location","size":6}]],"editRelations":["experiences","user","languages","favorite_place","slots"]}}	object	\N	\N
25	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object	\N	\N
13	plugin_content_manager_configuration_content_types::api::language.language	{"uid":"api::language.language","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"value":{"edit":{"label":"value","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"value","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","value","createdAt","updatedAt"],"editRelations":[],"edit":[[{"name":"value","size":6}]]}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::api::room.room	{"uid":"api::room.room","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"owners":{"edit":{"label":"owners","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"owners","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","owners","createdAt","updatedAt"],"editRelations":["owners"],"edit":[]}}	object	\N	\N
19	plugin_content_manager_configuration_content_types::api::theme.theme	{"uid":"api::theme.theme","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","createdAt","updatedAt"],"editRelations":[],"edit":[[{"name":"name","size":6}]]}}	object	\N	\N
26	plugin_content_manager_configuration_content_types::api::favorite-place.favorite-place	{"uid":"api::favorite-place.favorite-place","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"picture":{"edit":{"label":"picture","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"picture","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"guide":{"edit":{"label":"guide","description":"","placeholder":"","visible":true,"editable":true,"mainField":"headline"},"list":{"label":"guide","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","picture","title","description"],"edit":[[{"name":"picture","size":6},{"name":"title","size":6}],[{"name":"description","size":6}]],"editRelations":["guide"]}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::plugin::strapi-stripe.strapi-stripe-product	{"uid":"plugin::strapi-stripe.strapi-stripe-product","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"price":{"edit":{"label":"price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"currency":{"edit":{"label":"currency","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"currency","searchable":true,"sortable":true}},"productImage":{"edit":{"label":"productImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"productImage","searchable":false,"sortable":false}},"isSubscription":{"edit":{"label":"isSubscription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isSubscription","searchable":true,"sortable":true}},"interval":{"edit":{"label":"interval","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"interval","searchable":true,"sortable":true}},"trialPeriodDays":{"edit":{"label":"trialPeriodDays","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"trialPeriodDays","searchable":true,"sortable":true}},"stripeProductId":{"edit":{"label":"stripeProductId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stripeProductId","searchable":true,"sortable":true}},"stripePriceId":{"edit":{"label":"stripePriceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stripePriceId","searchable":true,"sortable":true}},"stripePlanId":{"edit":{"label":"stripePlanId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stripePlanId","searchable":true,"sortable":true}},"stripePayment":{"edit":{"label":"stripePayment","description":"","placeholder":"","visible":true,"editable":true,"mainField":"transactionId"},"list":{"label":"stripePayment","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","description"],"editRelations":["stripePayment"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"description","size":6},{"name":"price","size":4}],[{"name":"currency","size":6},{"name":"productImage","size":6}],[{"name":"isSubscription","size":4},{"name":"interval","size":6}],[{"name":"trialPeriodDays","size":4},{"name":"stripeProductId","size":6}],[{"name":"stripePriceId","size":6},{"name":"stripePlanId","size":6}]]}}	object	\N	\N
28	plugin_content_manager_configuration_content_types::plugin::strapi-stripe.strapi-stripe-payment	{"uid":"plugin::strapi-stripe.strapi-stripe-payment","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"transactionId","defaultSortBy":"transactionId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"txnDate":{"edit":{"label":"txnDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnDate","searchable":true,"sortable":true}},"transactionId":{"edit":{"label":"transactionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"transactionId","searchable":true,"sortable":true}},"isTxnSuccessful":{"edit":{"label":"isTxnSuccessful","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isTxnSuccessful","searchable":true,"sortable":true}},"txnMessage":{"edit":{"label":"txnMessage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnMessage","searchable":true,"sortable":true}},"txnErrorMessage":{"edit":{"label":"txnErrorMessage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnErrorMessage","searchable":true,"sortable":true}},"txnAmount":{"edit":{"label":"txnAmount","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnAmount","searchable":true,"sortable":true}},"customerName":{"edit":{"label":"customerName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customerName","searchable":true,"sortable":true}},"customerEmail":{"edit":{"label":"customerEmail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customerEmail","searchable":true,"sortable":true}},"stripeProduct":{"edit":{"label":"stripeProduct","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"stripeProduct","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","txnDate","transactionId","isTxnSuccessful"],"editRelations":["stripeProduct"],"edit":[[{"name":"txnDate","size":6},{"name":"transactionId","size":6}],[{"name":"isTxnSuccessful","size":4},{"name":"txnMessage","size":6}],[{"name":"txnErrorMessage","size":6},{"name":"txnAmount","size":4}],[{"name":"customerName","size":6},{"name":"customerEmail","size":6}]]}}	object	\N	\N
29	plugin_strapi-stripe_stripeSetting	{"isLiveMode":false,"stripeLivePubKey":"pk_test_51LNCwIDd7qdiUhfo9WT81RL0PnWBqqNbDXp7G2wUG4mmLXrawqaYHxdAydzdpZCEEz0Fypw0v02Codp7LyuazpqO00IrXzdR9J","stripeLiveSecKey":"sk_test_51LNCwIDd7qdiUhfoIyXaB3oYZotY6CydbE4XaJ2dUxKrZOeFIOzTNVFvW0yzcILscvKRue2X6KGtEfgiOiofQWX9003okF5B1d","stripeTestPubKey":"pk_test_51LNCwIDd7qdiUhfo9WT81RL0PnWBqqNbDXp7G2wUG4mmLXrawqaYHxdAydzdpZCEEz0Fypw0v02Codp7LyuazpqO00IrXzdR9J","stripeTestSecKey":"sk_test_51LNCwIDd7qdiUhfoIyXaB3oYZotY6CydbE4XaJ2dUxKrZOeFIOzTNVFvW0yzcILscvKRue2X6KGtEfgiOiofQWX9003okF5B1d","checkoutSuccessUrl":"localhost:3000","checkoutCancelUrl":"localhost:3000","currency":"eur"}	object	development	\N
30	plugin_content_manager_configuration_content_types::api::booking.booking	{"uid":"api::booking.booking","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"user":{"edit":{"label":"user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"user","searchable":true,"sortable":true}},"experience":{"edit":{"label":"experience","description":"","placeholder":"","visible":true,"editable":true,"mainField":"language"},"list":{"label":"experience","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"slot":{"edit":{"label":"slot","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"slot","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","user","experience","slot"],"edit":[[{"name":"size","size":4}]],"editRelations":["user","experience","slot"]}}	object	\N	\N
31	plugin_content_manager_configuration_content_types::api::slot.slot	{"uid":"api::slot.slot","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"start":{"edit":{"label":"start","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"start","searchable":true,"sortable":true}},"end":{"edit":{"label":"end","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"end","searchable":true,"sortable":true}},"experience":{"edit":{"label":"experience","description":"","placeholder":"","visible":true,"editable":true,"mainField":"language"},"list":{"label":"experience","searchable":true,"sortable":true}},"guide":{"edit":{"label":"guide","description":"","placeholder":"","visible":true,"editable":true,"mainField":"headline"},"list":{"label":"guide","searchable":true,"sortable":true}},"bookings":{"edit":{"label":"bookings","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"bookings","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","start","end","bookings"],"edit":[[{"name":"start","size":6},{"name":"end","size":6}]],"editRelations":["experience","guide","bookings"]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
19	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"socket_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi-stripe_strapi-stripe-product","indexes":[{"type":"unique","name":"strapi-stripe_strapi-stripe-product_slug_unique","columns":["slug"]},{"name":"strapi-stripe_strapi-stripe-product_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi-stripe_strapi-stripe-product_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi-stripe_strapi-stripe-product_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi-stripe_strapi-stripe-product_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"currency","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_subscription","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"interval","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"trial_period_days","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stripe_product_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stripe_price_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stripe_plan_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi-stripe_strapi-stripe-payment","indexes":[{"name":"strapi-stripe_strapi-stripe-payment_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi-stripe_strapi-stripe-payment_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi-stripe_strapi-stripe-payment_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi-stripe_strapi-stripe-payment_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"txn_date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"transaction_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_txn_successful","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"txn_message","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"txn_error_message","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"txn_amount","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"bookings","indexes":[{"name":"bookings_created_by_id_fk","columns":["created_by_id"]},{"name":"bookings_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"bookings_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"bookings_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"size","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"experiences","indexes":[{"name":"experiences_created_by_id_fk","columns":["created_by_id"]},{"name":"experiences_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"experiences_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"experiences_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"transportation","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"duration","type":"time","args":[{"precision":3}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stars","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"handifriendly","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"group_size","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"experience_types","indexes":[{"name":"experience_types_created_by_id_fk","columns":["created_by_id"]},{"name":"experience_types_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"experience_types_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"experience_types_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"favorite_places","indexes":[{"name":"favorite_places_created_by_id_fk","columns":["created_by_id"]},{"name":"favorite_places_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"favorite_places_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"favorite_places_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"guides","indexes":[{"name":"guides_created_by_id_fk","columns":["created_by_id"]},{"name":"guides_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"guides_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"guides_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"headline","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"background","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"interests","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"specialties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"work_experiences","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"languages","indexes":[{"name":"languages_created_by_id_fk","columns":["created_by_id"]},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"languages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"value","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"rooms","indexes":[{"name":"rooms_created_by_id_fk","columns":["created_by_id"]},{"name":"rooms_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"rooms_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"rooms_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"slots","indexes":[{"name":"slots_created_by_id_fk","columns":["created_by_id"]},{"name":"slots_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"slots_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"slots_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"start","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"themes","indexes":[{"name":"themes_created_by_id_fk","columns":["created_by_id"]},{"name":"themes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"themes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"themes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_friends_links","indexes":[{"name":"up_users_friends_links_fk","columns":["user_id"]},{"name":"up_users_friends_links_inv_fk","columns":["inv_user_id"]}],"foreignKeys":[{"name":"up_users_friends_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_friends_links_inv_fk","columns":["inv_user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_stripe_strapi_stripe_payment_stripe_product_links","indexes":[{"name":"strapi_stripe_strapi_stripe_payment_stripe_product_links_fk","columns":["strapi_stripe_payment_id"]},{"name":"strapi_stripe_strapi_stripe_payment_stripe_product_links_inv_fk","columns":["strapi_stripe_product_id"]}],"foreignKeys":[{"name":"strapi_stripe_strapi_stripe_payment_stripe_product_links_fk","columns":["strapi_stripe_payment_id"],"referencedColumns":["id"],"referencedTable":"strapi-stripe_strapi-stripe-payment","onDelete":"CASCADE"},{"name":"strapi_stripe_strapi_stripe_payment_stripe_product_links_inv_fk","columns":["strapi_stripe_product_id"],"referencedColumns":["id"],"referencedTable":"strapi-stripe_strapi-stripe-product","onDelete":"CASCADE"}],"columns":[{"name":"strapi_stripe_payment_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"strapi_stripe_product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"bookings_user_links","indexes":[{"name":"bookings_user_links_fk","columns":["booking_id"]},{"name":"bookings_user_links_inv_fk","columns":["user_id"]}],"foreignKeys":[{"name":"bookings_user_links_fk","columns":["booking_id"],"referencedColumns":["id"],"referencedTable":"bookings","onDelete":"CASCADE"},{"name":"bookings_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"booking_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"bookings_experience_links","indexes":[{"name":"bookings_experience_links_fk","columns":["booking_id"]},{"name":"bookings_experience_links_inv_fk","columns":["experience_id"]}],"foreignKeys":[{"name":"bookings_experience_links_fk","columns":["booking_id"],"referencedColumns":["id"],"referencedTable":"bookings","onDelete":"CASCADE"},{"name":"bookings_experience_links_inv_fk","columns":["experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"}],"columns":[{"name":"booking_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"bookings_slot_links","indexes":[{"name":"bookings_slot_links_fk","columns":["booking_id"]},{"name":"bookings_slot_links_inv_fk","columns":["slot_id"]}],"foreignKeys":[{"name":"bookings_slot_links_fk","columns":["booking_id"],"referencedColumns":["id"],"referencedTable":"bookings","onDelete":"CASCADE"},{"name":"bookings_slot_links_inv_fk","columns":["slot_id"],"referencedColumns":["id"],"referencedTable":"slots","onDelete":"CASCADE"}],"columns":[{"name":"booking_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"slot_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"experiences_languages_links","indexes":[{"name":"experiences_languages_links_fk","columns":["experience_id"]},{"name":"experiences_languages_links_inv_fk","columns":["language_id"]}],"foreignKeys":[{"name":"experiences_languages_links_fk","columns":["experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"},{"name":"experiences_languages_links_inv_fk","columns":["language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"}],"columns":[{"name":"experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"experiences_themes_links","indexes":[{"name":"experiences_themes_links_fk","columns":["experience_id"]},{"name":"experiences_themes_links_inv_fk","columns":["theme_id"]}],"foreignKeys":[{"name":"experiences_themes_links_fk","columns":["experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"},{"name":"experiences_themes_links_inv_fk","columns":["theme_id"],"referencedColumns":["id"],"referencedTable":"themes","onDelete":"CASCADE"}],"columns":[{"name":"experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"theme_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"experiences_types_links","indexes":[{"name":"experiences_types_links_fk","columns":["experience_id"]},{"name":"experiences_types_links_inv_fk","columns":["experience_type_id"]}],"foreignKeys":[{"name":"experiences_types_links_fk","columns":["experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"},{"name":"experiences_types_links_inv_fk","columns":["experience_type_id"],"referencedColumns":["id"],"referencedTable":"experience_types","onDelete":"CASCADE"}],"columns":[{"name":"experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"experience_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"experiences_guide_links","indexes":[{"name":"experiences_guide_links_fk","columns":["experience_id"]},{"name":"experiences_guide_links_inv_fk","columns":["guide_id"]}],"foreignKeys":[{"name":"experiences_guide_links_fk","columns":["experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"},{"name":"experiences_guide_links_inv_fk","columns":["guide_id"],"referencedColumns":["id"],"referencedTable":"guides","onDelete":"CASCADE"}],"columns":[{"name":"experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"guide_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"experiences_localizations_links","indexes":[{"name":"experiences_localizations_links_fk","columns":["experience_id"]},{"name":"experiences_localizations_links_inv_fk","columns":["inv_experience_id"]}],"foreignKeys":[{"name":"experiences_localizations_links_fk","columns":["experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"},{"name":"experiences_localizations_links_inv_fk","columns":["inv_experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"}],"columns":[{"name":"experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"experience_types_localizations_links","indexes":[{"name":"experience_types_localizations_links_fk","columns":["experience_type_id"]},{"name":"experience_types_localizations_links_inv_fk","columns":["inv_experience_type_id"]}],"foreignKeys":[{"name":"experience_types_localizations_links_fk","columns":["experience_type_id"],"referencedColumns":["id"],"referencedTable":"experience_types","onDelete":"CASCADE"},{"name":"experience_types_localizations_links_inv_fk","columns":["inv_experience_type_id"],"referencedColumns":["id"],"referencedTable":"experience_types","onDelete":"CASCADE"}],"columns":[{"name":"experience_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_experience_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"favorite_places_localizations_links","indexes":[{"name":"favorite_places_localizations_links_fk","columns":["favorite_place_id"]},{"name":"favorite_places_localizations_links_inv_fk","columns":["inv_favorite_place_id"]}],"foreignKeys":[{"name":"favorite_places_localizations_links_fk","columns":["favorite_place_id"],"referencedColumns":["id"],"referencedTable":"favorite_places","onDelete":"CASCADE"},{"name":"favorite_places_localizations_links_inv_fk","columns":["inv_favorite_place_id"],"referencedColumns":["id"],"referencedTable":"favorite_places","onDelete":"CASCADE"}],"columns":[{"name":"favorite_place_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_favorite_place_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"guides_user_links","indexes":[{"name":"guides_user_links_fk","columns":["guide_id"]},{"name":"guides_user_links_inv_fk","columns":["user_id"]}],"foreignKeys":[{"name":"guides_user_links_fk","columns":["guide_id"],"referencedColumns":["id"],"referencedTable":"guides","onDelete":"CASCADE"},{"name":"guides_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"guide_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"guides_languages_links","indexes":[{"name":"guides_languages_links_fk","columns":["guide_id"]},{"name":"guides_languages_links_inv_fk","columns":["language_id"]}],"foreignKeys":[{"name":"guides_languages_links_fk","columns":["guide_id"],"referencedColumns":["id"],"referencedTable":"guides","onDelete":"CASCADE"},{"name":"guides_languages_links_inv_fk","columns":["language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"}],"columns":[{"name":"guide_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"guides_favorite_place_links","indexes":[{"name":"guides_favorite_place_links_fk","columns":["guide_id"]},{"name":"guides_favorite_place_links_inv_fk","columns":["favorite_place_id"]}],"foreignKeys":[{"name":"guides_favorite_place_links_fk","columns":["guide_id"],"referencedColumns":["id"],"referencedTable":"guides","onDelete":"CASCADE"},{"name":"guides_favorite_place_links_inv_fk","columns":["favorite_place_id"],"referencedColumns":["id"],"referencedTable":"favorite_places","onDelete":"CASCADE"}],"columns":[{"name":"guide_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"favorite_place_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"languages_localizations_links","indexes":[{"name":"languages_localizations_links_fk","columns":["language_id"]},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"]}],"foreignKeys":[{"name":"languages_localizations_links_fk","columns":["language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"}],"columns":[{"name":"language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"rooms_owners_links","indexes":[{"name":"rooms_owners_links_fk","columns":["room_id"]},{"name":"rooms_owners_links_inv_fk","columns":["user_id"]}],"foreignKeys":[{"name":"rooms_owners_links_fk","columns":["room_id"],"referencedColumns":["id"],"referencedTable":"rooms","onDelete":"CASCADE"},{"name":"rooms_owners_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"room_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"slots_experience_links","indexes":[{"name":"slots_experience_links_fk","columns":["slot_id"]},{"name":"slots_experience_links_inv_fk","columns":["experience_id"]}],"foreignKeys":[{"name":"slots_experience_links_fk","columns":["slot_id"],"referencedColumns":["id"],"referencedTable":"slots","onDelete":"CASCADE"},{"name":"slots_experience_links_inv_fk","columns":["experience_id"],"referencedColumns":["id"],"referencedTable":"experiences","onDelete":"CASCADE"}],"columns":[{"name":"slot_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"experience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"slots_guide_links","indexes":[{"name":"slots_guide_links_fk","columns":["slot_id"]},{"name":"slots_guide_links_inv_fk","columns":["guide_id"]}],"foreignKeys":[{"name":"slots_guide_links_fk","columns":["slot_id"],"referencedColumns":["id"],"referencedTable":"slots","onDelete":"CASCADE"},{"name":"slots_guide_links_inv_fk","columns":["guide_id"],"referencedColumns":["id"],"referencedTable":"guides","onDelete":"CASCADE"}],"columns":[{"name":"slot_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"guide_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"themes_localizations_links","indexes":[{"name":"themes_localizations_links_fk","columns":["theme_id"]},{"name":"themes_localizations_links_inv_fk","columns":["inv_theme_id"]}],"foreignKeys":[{"name":"themes_localizations_links_fk","columns":["theme_id"],"referencedColumns":["id"],"referencedTable":"themes","onDelete":"CASCADE"},{"name":"themes_localizations_links_inv_fk","columns":["inv_theme_id"],"referencedColumns":["id"],"referencedTable":"themes","onDelete":"CASCADE"}],"columns":[{"name":"theme_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_theme_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2022-07-20 16:32:35.557	08194f82da3c96b926196931f5203e4a
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_stripe_strapi_stripe_payment_stripe_product_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_stripe_strapi_stripe_payment_stripe_product_links (strapi_stripe_payment_id, strapi_stripe_product_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, name, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: themes_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes_localizations_links (theme_id, inv_theme_id) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.auth.connect	2022-06-21 11:16:39.541	2022-06-21 11:16:39.541	\N	\N
2	plugin::users-permissions.user.me	2022-06-21 11:16:39.541	2022-06-21 11:16:39.541	\N	\N
5	plugin::users-permissions.auth.callback	2022-06-21 11:16:39.546	2022-06-21 11:16:39.546	\N	\N
6	plugin::users-permissions.auth.connect	2022-06-21 11:16:39.546	2022-06-21 11:16:39.546	\N	\N
9	plugin::users-permissions.auth.register	2022-06-21 11:16:39.546	2022-06-21 11:16:39.546	\N	\N
11	plugin::users-permissions.user.me	2022-06-21 11:16:39.546	2022-06-21 11:16:39.546	\N	\N
15	api::experience.experience.find	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
21	api::experience.experience.findOne	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
23	api::experience-type.experience-type.find	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
24	api::experience-type.experience-type.findOne	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
29	api::guide.guide.find	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
30	api::guide.guide.findOne	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
34	api::language.language.find	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
35	api::language.language.findOne	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
40	api::room.room.find	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
41	api::room.room.findOne	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
42	api::room.room.create	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
43	api::room.room.update	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
44	api::room.room.delete	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
45	api::theme.theme.find	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
46	api::theme.theme.findOne	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
51	plugin::content-type-builder.components.getComponents	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
52	plugin::content-type-builder.components.getComponent	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
53	plugin::content-type-builder.content-types.getContentTypes	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
54	plugin::content-type-builder.content-types.getContentType	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
55	plugin::email.email.send	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
56	plugin::i18n.locales.listLocales	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
57	plugin::users-permissions.auth.callback	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
58	plugin::users-permissions.auth.resetPassword	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
59	plugin::users-permissions.auth.forgotPassword	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
60	plugin::users-permissions.auth.register	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
61	plugin::users-permissions.auth.emailConfirmation	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
62	plugin::users-permissions.auth.sendEmailConfirmation	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
63	plugin::users-permissions.user.create	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
64	plugin::users-permissions.user.update	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
65	plugin::users-permissions.user.find	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
66	plugin::users-permissions.user.findOne	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
67	plugin::users-permissions.user.count	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
68	plugin::users-permissions.user.destroy	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
69	plugin::users-permissions.role.createRole	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
70	plugin::users-permissions.role.getRole	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
71	plugin::users-permissions.role.getRoles	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
72	plugin::users-permissions.role.updateRole	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
73	plugin::users-permissions.role.deleteRole	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
74	plugin::users-permissions.permissions.getPermissions	2022-06-22 15:26:48.992	2022-06-22 15:26:48.992	\N	\N
80	plugin::upload.content-api.find	2022-06-23 17:10:00.652	2022-06-23 17:10:00.652	\N	\N
81	plugin::upload.content-api.findOne	2022-06-23 17:10:00.652	2022-06-23 17:10:00.652	\N	\N
82	plugin::upload.content-api.count	2022-06-23 17:10:00.652	2022-06-23 17:10:00.652	\N	\N
83	plugin::upload.content-api.destroy	2022-06-23 17:10:00.652	2022-06-23 17:10:00.652	\N	\N
84	plugin::upload.content-api.upload	2022-06-23 17:10:00.652	2022-06-23 17:10:00.652	\N	\N
87	plugin::upload.content-api.count	2022-06-24 11:29:26.692	2022-06-24 11:29:26.692	\N	\N
86	plugin::upload.content-api.findOne	2022-06-24 11:29:26.692	2022-06-24 11:29:26.692	\N	\N
88	plugin::upload.content-api.destroy	2022-06-24 11:29:26.692	2022-06-24 11:29:26.692	\N	\N
89	plugin::upload.content-api.upload	2022-06-24 11:29:26.692	2022-06-24 11:29:26.692	\N	\N
85	plugin::upload.content-api.find	2022-06-24 11:29:26.692	2022-06-24 11:29:26.692	\N	\N
92	api::favorite-place.favorite-place.find	2022-06-28 13:11:07.406	2022-06-28 13:11:07.406	\N	\N
93	api::favorite-place.favorite-place.findOne	2022-06-28 13:11:07.406	2022-06-28 13:11:07.406	\N	\N
96	api::booking.booking.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
141	api::theme.theme.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
153	plugin::users-permissions.auth.emailConfirmation	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
113	api::experience-type.experience-type.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
129	api::language.language.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
130	api::language.language.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
156	plugin::users-permissions.user.update	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
157	plugin::users-permissions.user.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
112	api::experience-type.experience-type.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
98	api::experience.experience.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
118	api::favorite-place.favorite-place.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
124	api::guide.guide.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
151	plugin::users-permissions.auth.resetPassword	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
105	api::booking.booking.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
155	plugin::users-permissions.user.create	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
104	api::experience.experience.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
119	api::favorite-place.favorite-place.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
125	api::guide.guide.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
152	plugin::users-permissions.auth.forgotPassword	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
323	api::slot.slot.find	2022-07-20 16:26:20.042	2022-07-20 16:26:20.042	\N	\N
325	api::booking.booking.findOne	2022-07-20 16:26:36.246	2022-07-20 16:26:36.246	\N	\N
140	api::theme.theme.find	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
158	plugin::users-permissions.user.findOne	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
328	api::booking.booking.update	2022-07-20 16:26:36.246	2022-07-20 16:26:36.246	\N	\N
331	api::slot.slot.findOne	2022-07-20 16:26:44.908	2022-07-20 16:26:44.908	\N	\N
168	api::experience.experience.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
167	api::experience.experience.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
169	api::experience.experience.create	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
170	api::experience.experience.update	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
171	api::experience.experience.delete	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
176	api::experience-type.experience-type.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
180	api::experience-type.experience-type.create	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
182	api::experience-type.experience-type.createLocalization	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
186	api::favorite-place.favorite-place.create	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
190	api::guide.guide.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
196	api::language.language.create	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
197	api::language.language.update	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
205	plugin::upload.content-api.count	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
212	plugin::users-permissions.auth.forgotPassword	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
214	plugin::users-permissions.auth.emailConfirmation	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
220	plugin::users-permissions.user.count	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
223	plugin::users-permissions.role.createRole	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
229	api::booking.booking.find	2022-07-18 16:20:32.626	2022-07-18 16:20:32.626	\N	\N
230	api::booking.booking.findOne	2022-07-18 16:20:32.626	2022-07-18 16:20:32.626	\N	\N
324	api::slot.slot.findOne	2022-07-20 16:26:20.042	2022-07-20 16:26:20.042	\N	\N
326	api::booking.booking.find	2022-07-20 16:26:36.246	2022-07-20 16:26:36.246	\N	\N
329	api::booking.booking.delete	2022-07-20 16:26:36.246	2022-07-20 16:26:36.246	\N	\N
332	api::slot.slot.find	2022-07-20 16:27:24.131	2022-07-20 16:27:24.131	\N	\N
335	api::slot.slot.update	2022-07-20 16:27:24.131	2022-07-20 16:27:24.131	\N	\N
172	api::experience.experience.createLocalization	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
188	api::favorite-place.favorite-place.update	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
194	api::guide.guide.delete	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
201	api::theme.theme.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
206	plugin::upload.content-api.destroy	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
215	plugin::users-permissions.auth.sendEmailConfirmation	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
224	plugin::users-permissions.role.getRole	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
232	api::booking.booking.update	2022-07-18 16:20:32.626	2022-07-18 16:20:32.626	\N	\N
327	api::booking.booking.create	2022-07-20 16:26:36.246	2022-07-20 16:26:36.246	\N	\N
330	api::slot.slot.find	2022-07-20 16:26:44.908	2022-07-20 16:26:44.908	\N	\N
333	api::slot.slot.create	2022-07-20 16:27:24.131	2022-07-20 16:27:24.131	\N	\N
336	api::slot.slot.delete	2022-07-20 16:27:24.131	2022-07-20 16:27:24.131	\N	\N
181	api::experience-type.experience-type.update	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
187	api::favorite-place.favorite-place.delete	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
193	api::guide.guide.update	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
198	api::language.language.delete	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
210	plugin::users-permissions.auth.resetPassword	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
218	plugin::users-permissions.user.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
227	plugin::users-permissions.role.deleteRole	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
334	api::slot.slot.findOne	2022-07-20 16:27:24.131	2022-07-20 16:27:24.131	\N	\N
178	api::experience-type.experience-type.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
185	api::favorite-place.favorite-place.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
195	api::language.language.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
199	api::language.language.createLocalization	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
211	plugin::users-permissions.auth.connect	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
219	plugin::users-permissions.user.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
228	plugin::users-permissions.permissions.getPermissions	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
233	api::booking.booking.delete	2022-07-18 16:20:32.626	2022-07-18 16:20:32.626	\N	\N
184	api::favorite-place.favorite-place.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
191	api::guide.guide.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
203	plugin::email.email.send	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
209	plugin::users-permissions.auth.callback	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
217	plugin::users-permissions.user.update	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
226	plugin::users-permissions.role.updateRole	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
183	api::experience-type.experience-type.delete	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
192	api::guide.guide.create	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
204	plugin::upload.content-api.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
221	plugin::users-permissions.user.destroy	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
231	api::booking.booking.create	2022-07-18 16:20:32.626	2022-07-18 16:20:32.626	\N	\N
189	api::favorite-place.favorite-place.createLocalization	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
202	api::theme.theme.findOne	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
208	plugin::upload.content-api.upload	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
216	plugin::users-permissions.user.create	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
225	plugin::users-permissions.role.getRoles	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
200	api::language.language.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
213	plugin::users-permissions.auth.register	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
207	plugin::upload.content-api.find	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
222	plugin::users-permissions.user.me	2022-07-18 16:20:22.817	2022-07-18 16:20:22.817	\N	\N
235	api::room.room.findOne	2022-07-18 16:27:34.753	2022-07-18 16:27:34.753	\N	\N
236	api::room.room.create	2022-07-18 16:27:34.753	2022-07-18 16:27:34.753	\N	\N
238	api::room.room.delete	2022-07-18 16:27:34.753	2022-07-18 16:27:34.753	\N	\N
234	api::room.room.find	2022-07-18 16:27:34.753	2022-07-18 16:27:34.753	\N	\N
237	api::room.room.update	2022-07-18 16:27:34.753	2022-07-18 16:27:34.753	\N	\N
239	api::room.room.find	2022-07-19 14:51:36.065	2022-07-19 14:51:36.065	\N	\N
240	api::room.room.findOne	2022-07-19 14:51:36.065	2022-07-19 14:51:36.065	\N	\N
244	plugin::users-permissions.user.count	2022-07-19 14:51:36.065	2022-07-19 14:51:36.065	\N	\N
269	plugin::i18n.locales.listLocales	2022-07-19 15:27:52.229	2022-07-19 15:27:52.229	\N	\N
306	api::theme.theme.create	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
310	plugin::content-type-builder.components.getComponents	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
307	api::theme.theme.update	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
309	api::theme.theme.createLocalization	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
312	plugin::content-type-builder.content-types.getContentTypes	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
308	api::theme.theme.delete	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
311	plugin::content-type-builder.components.getComponent	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
313	plugin::content-type-builder.content-types.getContentType	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
314	plugin::i18n.locales.listLocales	2022-07-19 16:01:52.503	2022-07-19 16:01:52.503	\N	\N
154	plugin::users-permissions.auth.sendEmailConfirmation	2022-07-18 09:58:52.527	2022-07-18 09:58:52.527	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_links (permission_id, role_id) FROM stdin;
1	1
2	1
5	2
6	2
9	2
11	2
15	1
23	1
24	1
21	1
29	1
30	1
34	1
35	1
40	1
41	1
42	1
43	1
44	1
45	1
51	1
52	1
53	1
54	1
46	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
55	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
64	1
74	1
73	1
80	1
83	1
81	1
82	1
84	1
87	2
85	2
88	2
89	2
86	2
92	1
93	1
96	2
112	2
113	2
104	2
118	2
119	2
105	2
98	2
124	2
125	2
129	2
130	2
141	2
140	2
151	2
152	2
153	2
154	2
155	2
156	2
157	2
158	2
167	3
168	3
169	3
170	3
171	3
172	3
180	3
178	3
176	3
181	3
182	3
184	3
183	3
187	3
188	3
185	3
186	3
190	3
193	3
195	3
194	3
189	3
191	3
192	3
197	3
201	3
202	3
203	3
198	3
199	3
196	3
200	3
205	3
206	3
208	3
209	3
210	3
211	3
212	3
204	3
207	3
214	3
215	3
216	3
217	3
218	3
219	3
220	3
221	3
213	3
223	3
224	3
222	3
225	3
226	3
231	3
233	3
232	3
227	3
229	3
235	3
236	3
307	3
310	3
314	3
234	3
237	3
306	3
313	3
238	3
309	3
308	3
239	2
312	3
240	2
323	1
326	1
328	1
244	2
331	2
311	3
324	1
327	1
333	3
335	3
325	1
329	1
330	2
334	3
332	3
336	3
269	2
228	3
230	3
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2022-06-21 11:16:39.532	2022-07-20 16:26:36.243	\N	\N
2	Public	Default role given to unauthenticated user.	public	2022-06-21 11:16:39.535	2022-07-20 16:27:05.851	\N	\N
3	Guide	Grant access to guide profile in addition to user profile	guide	2022-07-18 16:09:06.103	2022-07-20 16:27:24.128	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, socket_id, phone, firstname, lastname, location, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	yoan	garrot.yoan1@gmail.com	local	$2a$10$4bCz0ueCR0P0sDgKYZw2RuhHHB6BDupEsy94KDUMneOJDG57RJgRe	\N	\N	t	f	\N	+33637112822	Yoan	Garrot	Paris	2022-06-21 11:25:04.49	2022-07-20 13:49:08.197	\N	1
\.


--
-- Data for Name: up_users_friends_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_friends_links (user_id, inv_user_id) FROM stdin;
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_links (user_id, role_id) FROM stdin;
1	3
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 254, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 1, false);


--
-- Name: experience_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experience_types_id_seq', 1, false);


--
-- Name: experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiences_id_seq', 18, true);


--
-- Name: favorite_places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorite_places_id_seq', 1, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 26, true);


--
-- Name: guides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guides_id_seq', 4, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 1, false);


--
-- Name: slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slots_id_seq', 1, true);


--
-- Name: strapi-stripe_strapi-stripe-payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."strapi-stripe_strapi-stripe-payment_id_seq"', 1, false);


--
-- Name: strapi-stripe_strapi-stripe-product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."strapi-stripe_strapi-stripe-product_id_seq"', 1, true);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 31, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 19, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 336, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 3, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 7, true);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: experience_types experience_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_types
    ADD CONSTRAINT experience_types_pkey PRIMARY KEY (id);


--
-- Name: experiences experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- Name: favorite_places favorite_places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_places
    ADD CONSTRAINT favorite_places_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: guides guides_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides
    ADD CONSTRAINT guides_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: slots slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- Name: strapi-stripe_strapi-stripe-payment strapi-stripe_strapi-stripe-payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-payment"
    ADD CONSTRAINT "strapi-stripe_strapi-stripe-payment_pkey" PRIMARY KEY (id);


--
-- Name: strapi-stripe_strapi-stripe-product strapi-stripe_strapi-stripe-product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-product"
    ADD CONSTRAINT "strapi-stripe_strapi-stripe-product_pkey" PRIMARY KEY (id);


--
-- Name: strapi-stripe_strapi-stripe-product strapi-stripe_strapi-stripe-product_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-product"
    ADD CONSTRAINT "strapi-stripe_strapi-stripe-product_slug_unique" UNIQUE (slug);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: bookings_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_created_by_id_fk ON public.bookings USING btree (created_by_id);


--
-- Name: bookings_experience_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_experience_links_fk ON public.bookings_experience_links USING btree (booking_id);


--
-- Name: bookings_experience_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_experience_links_inv_fk ON public.bookings_experience_links USING btree (experience_id);


--
-- Name: bookings_slot_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_slot_links_fk ON public.bookings_slot_links USING btree (booking_id);


--
-- Name: bookings_slot_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_slot_links_inv_fk ON public.bookings_slot_links USING btree (slot_id);


--
-- Name: bookings_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_updated_by_id_fk ON public.bookings USING btree (updated_by_id);


--
-- Name: bookings_user_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_user_links_fk ON public.bookings_user_links USING btree (booking_id);


--
-- Name: bookings_user_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_user_links_inv_fk ON public.bookings_user_links USING btree (user_id);


--
-- Name: experience_types_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experience_types_created_by_id_fk ON public.experience_types USING btree (created_by_id);


--
-- Name: experience_types_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experience_types_localizations_links_fk ON public.experience_types_localizations_links USING btree (experience_type_id);


--
-- Name: experience_types_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experience_types_localizations_links_inv_fk ON public.experience_types_localizations_links USING btree (inv_experience_type_id);


--
-- Name: experience_types_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experience_types_updated_by_id_fk ON public.experience_types USING btree (updated_by_id);


--
-- Name: experiences_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_created_by_id_fk ON public.experiences USING btree (created_by_id);


--
-- Name: experiences_guide_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_guide_links_fk ON public.experiences_guide_links USING btree (experience_id);


--
-- Name: experiences_guide_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_guide_links_inv_fk ON public.experiences_guide_links USING btree (guide_id);


--
-- Name: experiences_languages_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_languages_links_fk ON public.experiences_languages_links USING btree (experience_id);


--
-- Name: experiences_languages_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_languages_links_inv_fk ON public.experiences_languages_links USING btree (language_id);


--
-- Name: experiences_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_localizations_links_fk ON public.experiences_localizations_links USING btree (experience_id);


--
-- Name: experiences_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_localizations_links_inv_fk ON public.experiences_localizations_links USING btree (inv_experience_id);


--
-- Name: experiences_themes_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_themes_links_fk ON public.experiences_themes_links USING btree (experience_id);


--
-- Name: experiences_themes_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_themes_links_inv_fk ON public.experiences_themes_links USING btree (theme_id);


--
-- Name: experiences_types_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_types_links_fk ON public.experiences_types_links USING btree (experience_id);


--
-- Name: experiences_types_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_types_links_inv_fk ON public.experiences_types_links USING btree (experience_type_id);


--
-- Name: experiences_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experiences_updated_by_id_fk ON public.experiences USING btree (updated_by_id);


--
-- Name: favorite_places_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX favorite_places_created_by_id_fk ON public.favorite_places USING btree (created_by_id);


--
-- Name: favorite_places_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX favorite_places_localizations_links_fk ON public.favorite_places_localizations_links USING btree (favorite_place_id);


--
-- Name: favorite_places_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX favorite_places_localizations_links_inv_fk ON public.favorite_places_localizations_links USING btree (inv_favorite_place_id);


--
-- Name: favorite_places_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX favorite_places_updated_by_id_fk ON public.favorite_places USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: guides_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_created_by_id_fk ON public.guides USING btree (created_by_id);


--
-- Name: guides_favorite_place_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_favorite_place_links_fk ON public.guides_favorite_place_links USING btree (guide_id);


--
-- Name: guides_favorite_place_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_favorite_place_links_inv_fk ON public.guides_favorite_place_links USING btree (favorite_place_id);


--
-- Name: guides_languages_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_languages_links_fk ON public.guides_languages_links USING btree (guide_id);


--
-- Name: guides_languages_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_languages_links_inv_fk ON public.guides_languages_links USING btree (language_id);


--
-- Name: guides_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_updated_by_id_fk ON public.guides USING btree (updated_by_id);


--
-- Name: guides_user_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_user_links_fk ON public.guides_user_links USING btree (guide_id);


--
-- Name: guides_user_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guides_user_links_inv_fk ON public.guides_user_links USING btree (user_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: languages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_created_by_id_fk ON public.languages USING btree (created_by_id);


--
-- Name: languages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_localizations_links_fk ON public.languages_localizations_links USING btree (language_id);


--
-- Name: languages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_localizations_links_inv_fk ON public.languages_localizations_links USING btree (inv_language_id);


--
-- Name: languages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_updated_by_id_fk ON public.languages USING btree (updated_by_id);


--
-- Name: rooms_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_created_by_id_fk ON public.rooms USING btree (created_by_id);


--
-- Name: rooms_owners_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_owners_links_fk ON public.rooms_owners_links USING btree (room_id);


--
-- Name: rooms_owners_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_owners_links_inv_fk ON public.rooms_owners_links USING btree (user_id);


--
-- Name: rooms_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_updated_by_id_fk ON public.rooms USING btree (updated_by_id);


--
-- Name: slots_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slots_created_by_id_fk ON public.slots USING btree (created_by_id);


--
-- Name: slots_experience_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slots_experience_links_fk ON public.slots_experience_links USING btree (slot_id);


--
-- Name: slots_experience_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slots_experience_links_inv_fk ON public.slots_experience_links USING btree (experience_id);


--
-- Name: slots_guide_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slots_guide_links_fk ON public.slots_guide_links USING btree (slot_id);


--
-- Name: slots_guide_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slots_guide_links_inv_fk ON public.slots_guide_links USING btree (guide_id);


--
-- Name: slots_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slots_updated_by_id_fk ON public.slots USING btree (updated_by_id);


--
-- Name: strapi-stripe_strapi-stripe-payment_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_strapi-stripe-payment_created_by_id_fk" ON public."strapi-stripe_strapi-stripe-payment" USING btree (created_by_id);


--
-- Name: strapi-stripe_strapi-stripe-payment_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_strapi-stripe-payment_updated_by_id_fk" ON public."strapi-stripe_strapi-stripe-payment" USING btree (updated_by_id);


--
-- Name: strapi-stripe_strapi-stripe-product_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_strapi-stripe-product_created_by_id_fk" ON public."strapi-stripe_strapi-stripe-product" USING btree (created_by_id);


--
-- Name: strapi-stripe_strapi-stripe-product_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_strapi-stripe-product_updated_by_id_fk" ON public."strapi-stripe_strapi-stripe-product" USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_stripe_strapi_stripe_payment_stripe_product_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_stripe_strapi_stripe_payment_stripe_product_links_fk ON public.strapi_stripe_strapi_stripe_payment_stripe_product_links USING btree (strapi_stripe_payment_id);


--
-- Name: strapi_stripe_strapi_stripe_payment_stripe_product_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_stripe_strapi_stripe_payment_stripe_product_links_inv_fk ON public.strapi_stripe_strapi_stripe_payment_stripe_product_links USING btree (strapi_stripe_product_id);


--
-- Name: themes_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX themes_created_by_id_fk ON public.themes USING btree (created_by_id);


--
-- Name: themes_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX themes_localizations_links_fk ON public.themes_localizations_links USING btree (theme_id);


--
-- Name: themes_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX themes_localizations_links_inv_fk ON public.themes_localizations_links USING btree (inv_theme_id);


--
-- Name: themes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX themes_updated_by_id_fk ON public.themes USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_friends_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_friends_links_fk ON public.up_users_friends_links USING btree (user_id);


--
-- Name: up_users_friends_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_friends_links_inv_fk ON public.up_users_friends_links USING btree (inv_user_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: bookings bookings_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: bookings_experience_links bookings_experience_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_experience_links
    ADD CONSTRAINT bookings_experience_links_fk FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: bookings_experience_links bookings_experience_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_experience_links
    ADD CONSTRAINT bookings_experience_links_inv_fk FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: bookings_slot_links bookings_slot_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_slot_links
    ADD CONSTRAINT bookings_slot_links_fk FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: bookings_slot_links bookings_slot_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_slot_links
    ADD CONSTRAINT bookings_slot_links_inv_fk FOREIGN KEY (slot_id) REFERENCES public.slots(id) ON DELETE CASCADE;


--
-- Name: bookings bookings_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: bookings_user_links bookings_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_user_links
    ADD CONSTRAINT bookings_user_links_fk FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: bookings_user_links bookings_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_user_links
    ADD CONSTRAINT bookings_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: experience_types experience_types_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_types
    ADD CONSTRAINT experience_types_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: experience_types_localizations_links experience_types_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_types_localizations_links
    ADD CONSTRAINT experience_types_localizations_links_fk FOREIGN KEY (experience_type_id) REFERENCES public.experience_types(id) ON DELETE CASCADE;


--
-- Name: experience_types_localizations_links experience_types_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_types_localizations_links
    ADD CONSTRAINT experience_types_localizations_links_inv_fk FOREIGN KEY (inv_experience_type_id) REFERENCES public.experience_types(id) ON DELETE CASCADE;


--
-- Name: experience_types experience_types_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience_types
    ADD CONSTRAINT experience_types_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: experiences experiences_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: experiences_guide_links experiences_guide_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_guide_links
    ADD CONSTRAINT experiences_guide_links_fk FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: experiences_guide_links experiences_guide_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_guide_links
    ADD CONSTRAINT experiences_guide_links_inv_fk FOREIGN KEY (guide_id) REFERENCES public.guides(id) ON DELETE CASCADE;


--
-- Name: experiences_languages_links experiences_languages_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_languages_links
    ADD CONSTRAINT experiences_languages_links_fk FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: experiences_languages_links experiences_languages_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_languages_links
    ADD CONSTRAINT experiences_languages_links_inv_fk FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: experiences_localizations_links experiences_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_localizations_links
    ADD CONSTRAINT experiences_localizations_links_fk FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: experiences_localizations_links experiences_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_localizations_links
    ADD CONSTRAINT experiences_localizations_links_inv_fk FOREIGN KEY (inv_experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: experiences_themes_links experiences_themes_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_themes_links
    ADD CONSTRAINT experiences_themes_links_fk FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: experiences_themes_links experiences_themes_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_themes_links
    ADD CONSTRAINT experiences_themes_links_inv_fk FOREIGN KEY (theme_id) REFERENCES public.themes(id) ON DELETE CASCADE;


--
-- Name: experiences_types_links experiences_types_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_types_links
    ADD CONSTRAINT experiences_types_links_fk FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: experiences_types_links experiences_types_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_types_links
    ADD CONSTRAINT experiences_types_links_inv_fk FOREIGN KEY (experience_type_id) REFERENCES public.experience_types(id) ON DELETE CASCADE;


--
-- Name: experiences experiences_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: favorite_places favorite_places_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_places
    ADD CONSTRAINT favorite_places_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: favorite_places_localizations_links favorite_places_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_places_localizations_links
    ADD CONSTRAINT favorite_places_localizations_links_fk FOREIGN KEY (favorite_place_id) REFERENCES public.favorite_places(id) ON DELETE CASCADE;


--
-- Name: favorite_places_localizations_links favorite_places_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_places_localizations_links
    ADD CONSTRAINT favorite_places_localizations_links_inv_fk FOREIGN KEY (inv_favorite_place_id) REFERENCES public.favorite_places(id) ON DELETE CASCADE;


--
-- Name: favorite_places favorite_places_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_places
    ADD CONSTRAINT favorite_places_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: guides guides_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides
    ADD CONSTRAINT guides_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: guides_favorite_place_links guides_favorite_place_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides_favorite_place_links
    ADD CONSTRAINT guides_favorite_place_links_fk FOREIGN KEY (guide_id) REFERENCES public.guides(id) ON DELETE CASCADE;


--
-- Name: guides_favorite_place_links guides_favorite_place_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides_favorite_place_links
    ADD CONSTRAINT guides_favorite_place_links_inv_fk FOREIGN KEY (favorite_place_id) REFERENCES public.favorite_places(id) ON DELETE CASCADE;


--
-- Name: guides_languages_links guides_languages_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides_languages_links
    ADD CONSTRAINT guides_languages_links_fk FOREIGN KEY (guide_id) REFERENCES public.guides(id) ON DELETE CASCADE;


--
-- Name: guides_languages_links guides_languages_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides_languages_links
    ADD CONSTRAINT guides_languages_links_inv_fk FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: guides guides_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides
    ADD CONSTRAINT guides_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: guides_user_links guides_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides_user_links
    ADD CONSTRAINT guides_user_links_fk FOREIGN KEY (guide_id) REFERENCES public.guides(id) ON DELETE CASCADE;


--
-- Name: guides_user_links guides_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guides_user_links
    ADD CONSTRAINT guides_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: languages languages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: languages_localizations_links languages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages_localizations_links
    ADD CONSTRAINT languages_localizations_links_fk FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: languages_localizations_links languages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages_localizations_links
    ADD CONSTRAINT languages_localizations_links_inv_fk FOREIGN KEY (inv_language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: languages languages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: rooms rooms_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: rooms_owners_links rooms_owners_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_owners_links
    ADD CONSTRAINT rooms_owners_links_fk FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE CASCADE;


--
-- Name: rooms_owners_links rooms_owners_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_owners_links
    ADD CONSTRAINT rooms_owners_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: rooms rooms_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: slots slots_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: slots_experience_links slots_experience_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots_experience_links
    ADD CONSTRAINT slots_experience_links_fk FOREIGN KEY (slot_id) REFERENCES public.slots(id) ON DELETE CASCADE;


--
-- Name: slots_experience_links slots_experience_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots_experience_links
    ADD CONSTRAINT slots_experience_links_inv_fk FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- Name: slots_guide_links slots_guide_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots_guide_links
    ADD CONSTRAINT slots_guide_links_fk FOREIGN KEY (slot_id) REFERENCES public.slots(id) ON DELETE CASCADE;


--
-- Name: slots_guide_links slots_guide_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots_guide_links
    ADD CONSTRAINT slots_guide_links_inv_fk FOREIGN KEY (guide_id) REFERENCES public.guides(id) ON DELETE CASCADE;


--
-- Name: slots slots_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_strapi-stripe-payment strapi-stripe_strapi-stripe-payment_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-payment"
    ADD CONSTRAINT "strapi-stripe_strapi-stripe-payment_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_strapi-stripe-payment strapi-stripe_strapi-stripe-payment_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-payment"
    ADD CONSTRAINT "strapi-stripe_strapi-stripe-payment_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_strapi-stripe-product strapi-stripe_strapi-stripe-product_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-product"
    ADD CONSTRAINT "strapi-stripe_strapi-stripe-product_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_strapi-stripe-product strapi-stripe_strapi-stripe-product_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_strapi-stripe-product"
    ADD CONSTRAINT "strapi-stripe_strapi-stripe-product_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_stripe_strapi_stripe_payment_stripe_product_links strapi_stripe_strapi_stripe_payment_stripe_product_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_stripe_strapi_stripe_payment_stripe_product_links
    ADD CONSTRAINT strapi_stripe_strapi_stripe_payment_stripe_product_links_fk FOREIGN KEY (strapi_stripe_payment_id) REFERENCES public."strapi-stripe_strapi-stripe-payment"(id) ON DELETE CASCADE;


--
-- Name: strapi_stripe_strapi_stripe_payment_stripe_product_links strapi_stripe_strapi_stripe_payment_stripe_product_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_stripe_strapi_stripe_payment_stripe_product_links
    ADD CONSTRAINT strapi_stripe_strapi_stripe_payment_stripe_product_links_inv_fk FOREIGN KEY (strapi_stripe_product_id) REFERENCES public."strapi-stripe_strapi-stripe-product"(id) ON DELETE CASCADE;


--
-- Name: themes themes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: themes_localizations_links themes_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_localizations_links
    ADD CONSTRAINT themes_localizations_links_fk FOREIGN KEY (theme_id) REFERENCES public.themes(id) ON DELETE CASCADE;


--
-- Name: themes_localizations_links themes_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_localizations_links
    ADD CONSTRAINT themes_localizations_links_inv_fk FOREIGN KEY (inv_theme_id) REFERENCES public.themes(id) ON DELETE CASCADE;


--
-- Name: themes themes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_friends_links up_users_friends_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_friends_links
    ADD CONSTRAINT up_users_friends_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_friends_links up_users_friends_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_friends_links
    ADD CONSTRAINT up_users_friends_links_inv_fk FOREIGN KEY (inv_user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

