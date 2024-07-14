--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40),
    description text NOT NULL,
    listed_by character varying(40),
    visible_during integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    description text NOT NULL,
    mass_in_solar_mass numeric,
    discovered_year integer,
    galaxy_type character varying(30)
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
    name character varying(40),
    planet_id integer NOT NULL,
    description text NOT NULL,
    discovered_year integer,
    diameter_km bigint
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
    name character varying(40),
    star_id integer NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(30),
    has_atmosphere boolean
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
    name character varying(40),
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    discovered_year integer,
    star_type character varying(30),
    diameter_in_km bigint,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', 'An equatorial constellation of the zodiac, between Capricornus and Pisces. Its name is Latin for "water-carrier" or "cup-carrier", and its old astronomical symbol is (♒︎), a representation of water. Aquarius is one of the oldest of the recognized constellations along the zodiac (the Sun''s apparent path).', 'Ptolemy', 10);
INSERT INTO public.constellation VALUES (2, 'Fornax', 'A constellation in the southern celestial hemisphere, partly ringed by the celestial river Eridanus. Its name is Latin for furnace.', 'Lacaille', 5);
INSERT INTO public.constellation VALUES (3, 'Chamaeleon', 'A small constellation in the deep southern sky. It is named after the chameleon, a kind of lizard. It was first defined in the 16th century.', 'Petrus Plancius', 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 1150000000000, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way.', 1100000000000, 1888, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'A spiral galaxy 2.73 million light-years from Earth in the constellation Triangulum. The third largest member of the local group.', 500000000000000, 1764, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Tucana Dwarf', 'A dwarf galaxy in the constellation Tucana, composed of very old stars and is very isolated from other galaxies.', 0, 1990, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Sextans B', 'One of the most distant members of the Local Group, if it is indeed a member.', 200000000, 0, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Dwingeloo 1', 'A galaxy about 10 millio light-years away from the Earth', 31000000000, 1994, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Styx', 12, 'A  small natural satellite of Pluto whose discovery was announced on 11 July 2012. It was discovered by use of the Hubble Space Telescope, and is the smallest of the five known moons of Pluto.', 2012, 18);
INSERT INTO public.moon VALUES (2, 'Dysmonia', 13, 'The only known moon of the dwarf planet Eris and is the second-largest known moon of a dwarf planet, after Pluto I Charon.', 2005, 615);
INSERT INTO public.moon VALUES (3, 'Moon', 4, 'The Moon is Earth''s only natural satellite. It orbits at an average distance of 384,400 km (238,900 mi), about 30 times the diameter of Earth.', 0, 3500);
INSERT INTO public.moon VALUES (4, 'Phobos', 5, 'The innermost and larger of the two natural satellites of Mars, the other being Deimos.', 1877, 12);
INSERT INTO public.moon VALUES (5, 'Deimos', 5, 'The smaller and outer of the two natural satellites of Mars, the other being Phobos.', 1877, 6);
INSERT INTO public.moon VALUES (6, 'Io', 6, 'The innermost and second-smallest of the four Galilean moons of the planet Jupiter.', 1610, 1263);
INSERT INTO public.moon VALUES (7, 'Europa', 6, 'The smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet of all the 95 known moons of Jupiter.', 1610, 3100);
INSERT INTO public.moon VALUES (8, 'Amalthea', 6, 'The third-closest orbit around Jupiter among known moons and was the fifth moon of Jupiter to be discovered, so it is also known as Jupiter V.', 1892, 167);
INSERT INTO public.moon VALUES (9, 'Atlas', 7, 'An inner satellite of Saturn which was discovered by Richard Terrile in 1980 from Voyager photos and was designated S/1980 S 28. In 1983 it was officially named after Atlas of Greek mythology, because it "holds the rings on its shoulders"', 1980, 30);
INSERT INTO public.moon VALUES (10, 'Prometheus', 7, 'An inner satellite of Saturn. It was discovered on 24 October 1980 from photos taken by the Voyager 1 probe, and was provisionally designated S/1980 S 27.', 1980, 86);
INSERT INTO public.moon VALUES (11, 'Mimas', 7, 'Also designated Saturn I, is the seventh-largest natural satellite of Saturn.', 1789, 396);
INSERT INTO public.moon VALUES (12, 'Enceladus', 7, 'The sixth-largest moon of Saturn and the 19th-largest in the Solar System.', 1789, 500);
INSERT INTO public.moon VALUES (13, 'Tethys', 7, 'Saturn III is the fifth-largest moon of Saturn. It was discovered by Giovanni Domenico Cassini in 1684, and is named after the titan Tethys of Greek mythology.', 1684, 1060);
INSERT INTO public.moon VALUES (14, 'Rhea', 7, 'The second-largest moon of Saturn and the ninth-largest moon in the Solar System, with a surface area that is comparable to the area of Australia.', 1672, 1528);
INSERT INTO public.moon VALUES (15, 'Titan', 7, 'The largest moon of Saturn and the second-largest in the Solar System. It is the only moon known to have an atmosphere denser than the Earth''s and is the only known object in space—other than Earth—on which clear evidence of stable bodies of surface liquid has been found. Titan is one of seven gravitationally rounded moons of Saturn and the second-most distant among them. Frequently described as a planet-like moon, Titan is 50% larger in diameter than Earth''s Moon and 80% more massive. It is the second-largest moon in the Solar System after Jupiter''s Ganymede and is larger than Mercury, but only 40% as massive due to the latter being composed mainly of dense iron and rock, while a large portion of Titan is less-dense ice.', 1655, 5149);
INSERT INTO public.moon VALUES (16, 'Hyperion', 7, 'Also known as Saturn VII, is the eighth-largest moon of Saturn. It distinguished by its highly irregular shape, chaotic rotation, low density, and its unusual sponge-like appearance. It was the first non-rounded moon to be discovered.', 1848, 122);
INSERT INTO public.moon VALUES (17, 'Ariel', 8, 'Te fourth-largest moon of Uranus. Ariel orbits and rotates in the equatorial plane of Uranus, which is almost perpendicular to the orbit of Uranus and so has an extreme seasonal cycle.', 1851, 1155);
INSERT INTO public.moon VALUES (18, 'Bianca', 8, 'An inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on January 23, 1986, and was given the temporary designation S/1986 U 9.[9] It was named after the sister of Katherine in Shakespeare''s play The Taming of the Shrew. It is also designated Uranus VIII.', 1986, 51);
INSERT INTO public.moon VALUES (19, 'Juliet', 8, 'An inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 3 January 1986, and was given the temporary designation S/1986 U 2. It is named after the heroine of William Shakespeare''s play Romeo and Juliet.', 1986, 94);
INSERT INTO public.moon VALUES (20, 'Belinda', 8, 'An inner satellite of the planet Uranus. Belinda was discovered from the images taken by Voyager 2 on 13 January 1986 and was given the temporary designation S/1986 U 5. It is named after the heroine of Alexander Pope''s The Rape of the Lock. It is also designated Uranus XIV.', 1986, 90);
INSERT INTO public.moon VALUES (21, 'Larissa', 9, 'Larissa, also known as Neptune VII, is the fifth-closest inner satellite of Neptune. It is named after Larissa, a lover of Poseidon (the Greek equivalent of the Roman god Neptune).', 1981, 194);
INSERT INTO public.moon VALUES (22, 'Triton', 9, 'The largest natural satellite of the planet Neptune. It is the only moon of Neptune massive enough to be rounded under its own gravity and hosts a thin but well-structured atmosphere. Triton orbits Neptune in a retrograde orbit—an orbit in the direction opposite to the parent planet''s rotation—the only large moon in the Solar System to do so.', 1846, 2710);
INSERT INTO public.moon VALUES (23, 'Namaka', 10, 'The smaller, inner moon of the trans-Neptunian dwarf planet Haumea.', 2005, 170);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Quingluan', 2, 'Exoplanet orbiting Danfeng', false, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 'The closest planet to the sun. It is the second densest planet of the Solar System, but also the smallest planet.', false, 'planet', false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'The second planet from the Sun and the hottest.', false, 'planet', true);
INSERT INTO public.planet VALUES (4, 'Earth', 1, 'The third planet from the Sun and the fifth largest planet in the Solar System with the highest density.', true, 'planet', true);
INSERT INTO public.planet VALUES (5, 'Mars', 1, 'The second-smallest planet with a thin atmosphere, having the surface features reminiscent both of the impact craters of the Moon, and the valleys, deserts and polar ice caps of Earth.', false, 'planet', true);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 'The largest planet of the Solar System. It is the oldest planet of the Solar System thus it was the first to take shape out of the remains of the solar nebula.', false, 'planet', true);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 'The sixth planet from the Sun, with the largest planetary rings in the Solar System. It is the second-largest planet after Jupiter, and recently, with many other moons being discovered, it surpassed the number of Jupiter''s moons and is now considered the planet with the most numerous satellites.', false, 'planet', true);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Officially recognized in 1781 after many observations in the past, it is the third-largest planet of the Solar System.', false, 'planet', true);
INSERT INTO public.planet VALUES (9, 'Neptune', 1, 'The fourth largest and the farthest planet of the Solar System with the most powerful wind speeds out of all the planets. It is the smallest of the gas giants and is the first planet to be discovered by mathematical predictions in 1846.', false, 'planet', true);
INSERT INTO public.planet VALUES (10, 'Haumea', 1, 'The fastest rotating dwarf planet with the most interesting/controversial shape. It is located beyond the orbit of Neptune. It was discovered in 2004 and is the fourth largest dwarf planet.
', false, 'dwarf', false);
INSERT INTO public.planet VALUES (11, 'Ceres', 1, 'A  dwarf planet, and the only who isn''t located in the Kuiper Belt but rather in the inner solar system in the asteroid belt between the orbits of Mars and Jupiter. Discovered in 1801, it was considered a planet for a year, and then an asteroid, the first of its kind until 2006, when it was classified as of dwarf planet being the smallest of them.', false, 'dwarf', true);
INSERT INTO public.planet VALUES (12, 'Pluto', 1, 'The largest known dwarf planet in the Solar System, discovered in 1930. It was thought to be the 9th planet of our system for 75 years until the discovery of Eris and other similar objects that led to its demotion from a planet to a dwarf planet in 2006.', false, 'dwarf', true);
INSERT INTO public.planet VALUES (13, 'Eris', 1, 'The most distant dwarf planet, located beyond the orbit of Neptune. It was discovered in 2005 and was originally classified as a planet. It is the second-largest dwarf planet discovered and it led to both it and Pluto’s demotion from planets to dwarf planets.', false, 'dwarf', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1, 'The sun', NULL, 'Yellow dwarf', NULL, NULL);
INSERT INTO public.star VALUES (2, 'Danfeng', 4, 'The star has about 61% the mass and 60% the radius of the Sun.', 2020, 'Red dwarf', NULL, NULL);
INSERT INTO public.star VALUES (3, 'Gamma Andromedae', 2, 'The third-brightest point of light in the northern constellation of Andromeda.', 1778, '3-Star system', NULL, NULL);
INSERT INTO public.star VALUES (4, 'Atria', 3, 'The brightest star in the southern constellation of Triangulum Australe', NULL, 'K-type', NULL, NULL);
INSERT INTO public.star VALUES (5, 'Achernar', 1, 'The brightest star in the constellation of Eridanus', NULL, 'Spectral type B', 4869900, NULL);
INSERT INTO public.star VALUES (8, 'Schedar', 6, 'A second-magnitude star in the northern constellation of Cassiopeia.', NULL, 'B-type', 29428110, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

