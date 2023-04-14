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
    age_in_billion_years numeric(3,1),
    description text,
    has_life boolean,
    contains_water boolean,
    distance_from_earth integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_years numeric(6,1),
    description text,
    has_life boolean,
    contains_water boolean,
    visited boolean,
    orbiting character varying(40),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_years numeric(6,1),
    description text,
    has_life boolean,
    contains_water boolean,
    number_of_moons integer,
    home_star character varying(40),
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_years numeric(6,1),
    description text,
    has_life boolean,
    number_of_planets integer,
    galaxy_id integer
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_syste_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_syste_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_syste_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_syste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_syste_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_years numeric(6,1),
    description text,
    has_life boolean,
    galaxy character varying(40),
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_syste_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.7, 'The Milky Way is our home galaxy', true, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.0, 'Andromeda is also known as Messier 31 or M31, and is the nearest large galaxy to the milky way and can be seen with the naked eye', false, true, 2537000);
INSERT INTO public.galaxy VALUES (3, 'LMC', 11.0, 'LMC, also known as Large Magellanic Cloud is a satellite galaxy if the milky way.', false, true, 158200);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 13.3, 'Cigar Galaxy, also known as Messier 82 or M82 and is located in the Ursa Major constellation.', false, true, 11420000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', NULL, 'Pinwheel Galaxy, also known as Messier 101 or M101, is located in the Ursa Major constellation.', false, false, 20870000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpoool Galaxy', 0.4, 'Whirlpool Galaxy, also known as Messier 51a or M51a, its located in the Canes Venatici constellation, and is frequently seen by amature astronomers and can be seen with binoculars.', false, false, 23160000);
INSERT INTO public.galaxy VALUES (7, 'Hoags Object', 12.8, 'Hoags Object, named after Arthur Hoag, it is an unusal ring galaxy, you can tell because of its rings.', false, false, 612800000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 4530.0, 'The moon, is our moon, the reason we dont have  more exciting name is because for a long time we only knew about our own', false, true, true, 'Terra', 3);
INSERT INTO public.moon VALUES (2, 'Europa', 90.0, 'Europa is Jupiters smallest moon', false, true, false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (3, 'Ganymedes', 4500.0, 'Ganymedes is Jupiters largest moon, it is even larger than Mercury', false, true, false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 4000.0, 'Callisto is Jupiters eighth known  moon, and the second largest of the aproximately 93 moons', false, true, false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Titan', 4000.0, 'Titan is the Saturns largest moon, and the second largest moon in the solar system', false, true, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (6, 'Enceladus', 0.5, 'Enceladus is Saturns sixth largest moon', false, true, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (7, 'Mimas', 4500.0, 'Mimas also goes by the name of Saturn I and is the closest moon to saturn.', false, true, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (8, 'Miranda', 100.0, 'Miranda also known as Uranus V, is the smallest and innert most moon.', false, true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (9, 'Ariel', 100.0, 'Ariel is the fourth of Uranuses moons', false, true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (10, 'Titania', 4600.0, 'Titania is the largest of Uranuses moons', false, true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (11, 'Oberon', NULL, 'Oberon is also known as Uranus IV and is the outermost moon of uranus, it is also the second largest of uranus moons.', false, true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 4500.0, 'Umbriel was discovered on the same day as Ariel, and is the second most heavily cratered moon after Obreon.', false, true, false, 'Uransu', 7);
INSERT INTO public.moon VALUES (13, 'Io', 4500.0, 'Io is the third largest moon of Jupiter', false, false, false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (14, 'S/2003 J 19', NULL, 'S/2003 J 19 was discovered in 2003 and is only 2 km in diameter', false, NULL, false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (15, 'Iapetus', 4567.0, 'Iapetus also known as Saturn VIII is the 24th planet of Saturn', false, true, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (16, 'Dione', 4000.0, 'Dione, aslo known as Saturn VI was discovered in 1864', false, true, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (17, 'Tethys', 4560.0, 'Tethys is Saturns 16th largest moon.', false, true, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (18, 'Hippocamp', NULL, 'Hippocamp, sometimes reffered to as Neptune XIV, is a small moon discovered on july 1 2013', false, NULL, false, 'Neptune', 8);
INSERT INTO public.moon VALUES (19, 'Galatea', NULL, 'Galatea , also known as, Neptune VI, is the fourth closest moon to Neptune', false, NULL, false, 'Neptune', 8);
INSERT INTO public.moon VALUES (20, 'Triton', 50.0, 'Triton is the largest moon of Neptune', false, true, false, 'Neptune', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4503.0, 'Mercury is the first planet in our solar system.', false, false, 0, 'Sol', 7);
INSERT INTO public.planet VALUES (2, 'Venus', 4503.0, 'Venus is the second planet in our solar system.', false, false, 0, 'Sol', 7);
INSERT INTO public.planet VALUES (3, 'Terra', 4543.0, 'Terra is another name for our planet, earth.', true, true, 1, 'Sol', 7);
INSERT INTO public.planet VALUES (4, 'Mars', 4603.0, 'Mars is the fourth planet in our solar system.', false, true, 2, 'Sol', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4603.0, 'Jupiter is the biggest planet in our solar system and also the fifth planet in our solar system.', false, true, 92, 'Sol', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503.0, 'Saturn is the second largest planet in our solar system after Jupiter.', false, true, 83, 'Sol', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503.0, '63 earths can fit inside Uranus, it is also the seventh planet in our solar system, it is also tilted 93deg and looks like it is spinning on its side.', false, true, 27, 'Sol', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503.0, 'Neptune is the eighth planet of our solar system, and it experiances seasons ', false, true, 14, 'Sol', 7);
INSERT INTO public.planet VALUES (9, 'Pluto', 4600.0, 'Pluto, though not regarded as a planet anymore retains an honerary place in this data base', false, true, 5, 'Sol', 7);
INSERT INTO public.planet VALUES (10, 'Kepler-296e', NULL, 'Kepler-296e is a earth sized exoplanet about 1 820 lightyears away', false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Glise 1002b', NULL, 'Glise 1002b is a potentially habital exoplanet about 16 lightyears away', false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Wolf 1069b', NULL, 'Wolf 1069b is a super earth exoplanet that orbits an M-type Star. one orbit takes 15.6 days', false, NULL, NULL, NULL, NULL);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'The Solar System', 4571.0, 'The Solar System is our own solar system, named after the sun: Sol', true, 8, 1);
INSERT INTO public.solar_system VALUES (2, 'Proxima Centauri', 5000.0, 'Proxima Centauri is the closest star system to our own being only 4 lightyears away', false, 0, NULL);
INSERT INTO public.solar_system VALUES (3, 'Lalande 21185', NULL, 'Lalande 21185 is a star system with a possible super earth exoplanet and is about 8.1 lightyears away', false, 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 10.0, 'Betelgeuse is a red giant, visable to the naked eye in the constellation of Orion', false, 'Milky Way', 1);
INSERT INTO public.star VALUES (2, 'Antres', 11.0, 'Antres is the brightest star in the Scorpius constellation', false, 'Milky Way', 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 60.0, 'Alpheratz is the brightest mercury-manganese star known to date', false, 'Andromeda', 2);
INSERT INTO public.star VALUES (4, 'Achernar', 37.3, 'Achernar is the brightest star in the Eridanus constellation', false, 'Milky Way', 1);
INSERT INTO public.star VALUES (5, 'Arcturus', 7105.0, 'Arcturus is the brightest star of the northern Bootes constellation, Arcturus is part of the Arcturus stream which moves on a different anlge and speed to most of the other stars in the Milky Way', false, 'Milky Way', 1);
INSERT INTO public.star VALUES (6, 'Mirach', NULL, 'Mirach is a cold bright red class M giant, and it is 1900 times brighter than our sun', false, 'Andromeda', 2);
INSERT INTO public.star VALUES (7, 'Sol', 4603.0, 'Sol is our own sunn, and is the brightest sun during the daytime.', true, 'Milky Way', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_syste_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_syste_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


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
-- Name: solar_system solar_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
