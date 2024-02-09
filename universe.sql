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
    name character varying(40) NOT NULL,
    age_in_million_of_years integer,
    description text,
    size_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    diameter integer
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
    name character varying(40) NOT NULL,
    has_moons boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_sun integer,
    times_heavier_than_sun numeric(4,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: stars_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stars_planets (
    star_id integer NOT NULL,
    stars_planets_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.stars_planets OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Is a barred spiral galaxy, and it is the galaxy in which our solar system resides', 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 13000, 'Is the nearest spiral galaxy to the Milky Way', 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 'Is a spiral galaxy located in the Local Group', 60000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 600, 'Is a classic spiral galaxy located in the constellation Canes Venatici', 60000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 7000, 'Is a spiral galaxy located in the constellation Virgo', 500000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 6000, 'Is a face-on spiral galaxy located in the constellation Ursa Major', 170000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 4820);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 250);
INSERT INTO public.moon VALUES (9, 'Titan', 6, true, 5150);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, true, 1527);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, true, 1470);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, 1123);
INSERT INTO public.moon VALUES (13, 'Titania', 7, true, 1578);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, true, 1522);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, true, 1169);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, true, 1158);
INSERT INTO public.moon VALUES (17, 'Triton', 8, true, 2706);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, false, 340);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, false, 420);
INSERT INTO public.moon VALUES (20, 'Larissa', 8, false, 216);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186b', false, false, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-186c', false, false, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-186d', false, false, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-186e', false, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Kepler-186', 500, 0.50, 2);
INSERT INTO public.star VALUES (3, 'Trappist-1', 39, 0.08, 3);
INSERT INTO public.star VALUES (4, 'HD 209458', 154, 1.10, 4);
INSERT INTO public.star VALUES (5, 'Gliese 581', 20, 0.31, 5);
INSERT INTO public.star VALUES (6, '51 Pegasi', 50, 1.06, 6);


--
-- Data for Name: stars_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stars_planets VALUES (1, 1, NULL);
INSERT INTO public.stars_planets VALUES (1, 2, NULL);
INSERT INTO public.stars_planets VALUES (1, 3, NULL);
INSERT INTO public.stars_planets VALUES (1, 4, NULL);
INSERT INTO public.stars_planets VALUES (1, 5, NULL);
INSERT INTO public.stars_planets VALUES (1, 6, NULL);
INSERT INTO public.stars_planets VALUES (1, 7, NULL);
INSERT INTO public.stars_planets VALUES (1, 8, NULL);
INSERT INTO public.stars_planets VALUES (2, 9, NULL);
INSERT INTO public.stars_planets VALUES (2, 10, NULL);
INSERT INTO public.stars_planets VALUES (2, 11, NULL);
INSERT INTO public.stars_planets VALUES (2, 12, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 10, true);


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
-- Name: stars_planets stars_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_planets
    ADD CONSTRAINT stars_planets_pkey PRIMARY KEY (stars_planets_id);


--
-- Name: stars_planets stars_planets_stars_planets_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_planets
    ADD CONSTRAINT stars_planets_stars_planets_id_key UNIQUE (stars_planets_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

