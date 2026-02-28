--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE guessing_game;
--
-- Name: guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guessing_game OWNER TO freecodecamp;

\connect guessing_game

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1749220609113', 7, 317);
INSERT INTO public.players VALUES ('user_1749220518562', 21, 317);
INSERT INTO public.players VALUES ('user_1749220438721', 28, 317);
INSERT INTO public.players VALUES ('user_1749220350149', 35, 317);
INSERT INTO public.players VALUES ('Uca', 66, 317);
INSERT INTO public.players VALUES ('Steven', 56, 317);
INSERT INTO public.players VALUES ('user_1749220163738', 56, 317);
INSERT INTO public.players VALUES ('user_1749220163737', 54, 317);
INSERT INTO public.players VALUES ('user_1749220260866', 49, 317);
INSERT INTO public.players VALUES ('user_1749220260865', 47, 317);
INSERT INTO public.players VALUES ('user_1749220274588', 42, 317);
INSERT INTO public.players VALUES ('user_1749220274587', 40, 317);
INSERT INTO public.players VALUES ('user_1749220350148', 33, 317);
INSERT INTO public.players VALUES ('user_1749220438720', 26, 317);
INSERT INTO public.players VALUES ('user_1749220518561', 19, 317);
INSERT INTO public.players VALUES ('user_1749220537360', 14, 317);
INSERT INTO public.players VALUES ('user_1749220537359', 12, 317);
INSERT INTO public.players VALUES ('user_1749220609112', 5, 317);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

