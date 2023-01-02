--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    notes character varying,
    distance_from_earth text,
    age_in_billions_of_years numeric,
    constellation character varying,
    galaxy_type_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying NOT NULL,
    notes character varying
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_km numeric,
    distance_from_earth integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    notes character varying,
    distance_from_earth text,
    has_life boolean,
    has_moon boolean,
    no_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age text,
    luminosity numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Contains the sun and the solar system, and therefore Earth.', '0', 13.61, 'Sagittarius', 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Approximately 2.5 million light years from Earth and the nearest large galaxy to the Milky Way', '2.5 Million Light Years', 10.01, 'Andromeda', 2);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Fourth largest galaxy in the local group', NULL, 1.101, 'Dorado/Mensa', 2);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Home to 40 billion stars', '2.9 Million Light Years', NULL, 'Triangulum', 2);
INSERT INTO public.galaxy VALUES (5, 'Sculptor', 'One of the brightest galaxies in the sky, can be seen through binoculars', '12 Million Light Years', 0.0057, 'Sculptor', 2);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'First galaxy to be classified as a spiral galaxy', NULL, 0.4003, 'Canes Venatici', 2);
INSERT INTO public.galaxy VALUES (7, 'Circinus', 'One of the twelve large galaxies in the Council of Giants surrounding the Local Group in the Local Sheet', NULL, 0.8, 'Circinus', 4);
INSERT INTO public.galaxy VALUES (8, 'Canis Major Dwarf', NULL, '25 Thousand Light Years', NULL, 'Canis Major', 3);
INSERT INTO public.galaxy VALUES (9, 'Maffei 1', 'Has a boxy shape and is made mainly of old metal-rich stars', '11 Million Light Years', NULL, 'Cassiopeia', 1);
INSERT INTO public.galaxy VALUES (10, 'M81', NULL, '11.8 Million Years', 13.31, 'Ursa Major', 2);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', 'Vary from nearly circular to very elongated');
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', 'Appear as flat, blue-white disks of stars, gas and dust with yellowish bulges in their centers.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Have very little dust, are neither disk-like nor elliptical');
INSERT INTO public.galaxy_type VALUES (4, 'Type II Seyfert', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474.8, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.5, 77790000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.4, 77790000, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 3121.6, 628300000, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5268.2, 628300000, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3643.2, 628300000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820.6, 628300000, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5149.5, 1200000000, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 396.4, 1272000000, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 1122.8, 1272000000, 6);
INSERT INTO public.moon VALUES (11, 'Iapetus', 1469, 1272000000, 6);
INSERT INTO public.moon VALUES (12, 'Oberon', 1522.8, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 1576.8, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 471.6, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 1157.8, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 2706.8, NULL, 8);
INSERT INTO public.moon VALUES (17, 'Galatea', 174.8, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Larissa', 194, NULL, 8);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1169.4, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Thebe', 98.6, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'First planet from the Sun. Has the shortest year of 88 earth days.', '113.82 million km', false, false, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun. One year is 224.7 earth days.', '240.72 million km', false, false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet from the Sun. Our planet. Supports life and has a year of 365.25 days.', NULL, true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet from the Sun. Home to Olympus Mons, the largest known volcano in the solar system.', '96.321 million km', false, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Fifth planet from the Sun. The largest non-stellar object in the solar system', '748.43 million km', false, true, 80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sixth planet from the Sun. Second largest nonstellar object in the solar system, after Jupiter. A year here is approximately 29.5 Earth years.', '1.574 billion km', false, true, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet from the Sun. Has 10 sharply defined narrow dark rings and no solid surface.', '2.85 billion km', false, true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eighth planet from the Sun. Takes nearly 164 years to complete one orbit around the Sun.', '4.51 billion km', false, true, 14, 1);
INSERT INTO public.planet VALUES (9, 'CoRoT-7b', 'The first extrasolar planet that was shown to be a rocky planet like Earth', '489 light years', false, false, NULL, 6);
INSERT INTO public.planet VALUES (10, 'HD 209458b', 'The first extrasolar planet who mass was directly measured', '159 light years', false, false, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'The first Earth-sized extrasolar planet to be found within its stars habitable zone', '557.7 light years', false, false, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 'The first approximately Earth-sized planet to be found in a Sun-like stars habitable zone.', '1402 light years', false, false, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', '4.6 billion years', 1, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', '4.8 billion years', 0.0017, 1);
INSERT INTO public.star VALUES (3, 'Kepler-186', '4.6 billion years', 0.055, 1);
INSERT INTO public.star VALUES (4, 'Kepler-452', '6 billion years', 1.2, 1);
INSERT INTO public.star VALUES (5, 'HD 209458', '4.4 billion years', 1.77, 1);
INSERT INTO public.star VALUES (6, 'CoRoT-7', '1.5 billion years', NULL, 1);
INSERT INTO public.star VALUES (7, 'Sirius A', '200 to 300 million years old', 25.4, 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', '5 to 6 billion years', 1.519, 1);
INSERT INTO public.star VALUES (9, 'Altair', '1.201 billion years', 10.6, 1);
INSERT INTO public.star VALUES (10, 'Vega', '455.3 million years', 40.12, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_description_key UNIQUE (notes);


--
-- Name: galaxy_type galaxy_type_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_type_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


