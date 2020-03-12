--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: maryella
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    score integer,
    content character varying(1000) NOT NULL,
    winery_id integer,
    user_id integer,
    CONSTRAINT reviews_score_check CHECK (((score >= 0) AND (score <= 100)))
);


ALTER TABLE public.reviews OWNER TO maryella;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: maryella
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO maryella;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maryella
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: maryella
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    city character varying(200),
    state character varying(50),
    picture character varying(500)
);


ALTER TABLE public.users OWNER TO maryella;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: maryella
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO maryella;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maryella
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wineries; Type: TABLE; Schema: public; Owner: maryella
--

CREATE TABLE public.wineries (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    address character varying(200),
    street character varying(200),
    city character varying(200),
    state character varying(50),
    primary_vine character varying(50),
    picture character varying(500),
    zip numeric(10,0)
);


ALTER TABLE public.wineries OWNER TO maryella;

--
-- Name: wineries_id_seq; Type: SEQUENCE; Schema: public; Owner: maryella
--

CREATE SEQUENCE public.wineries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wineries_id_seq OWNER TO maryella;

--
-- Name: wineries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maryella
--

ALTER SEQUENCE public.wineries_id_seq OWNED BY public.wineries.id;


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wineries id; Type: DEFAULT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.wineries ALTER COLUMN id SET DEFAULT nextval('public.wineries_id_seq'::regclass);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: maryella
--

COPY public.reviews (id, score, content, winery_id, user_id) FROM stdin;
24	80	So much fun!	7	25
23	90	I went with a group and we all really enjoyed the wine. Our guide was very knowledgeable. We learned a lot and drank a lot - overall, a very nice time.\r\n            	7	25
22	95	Beautiful vineyard and tasty wines. Really enjoyed our trip and would recommend.	5	25
25	75	Another test review for display purposes. Hope no one really reads this.	7	25
26	80	Writing test reviews is really fun. I love writing test reviews. It would be even better with some wine!\r\n            	7	25
27	100	Yay for demos!! This is a demo review in front of the class!	9	26
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: maryella
--

COPY public.users (id, name, email, password, city, state, picture) FROM stdin;
1	example name	email@email.com	password	atlanta	ga	\N
2	MaryTest1	example@email.com	$2a$10$M.O6ebUpUniPkFASyPecRu24J3TA71mpBGEb.ghmD0b0MFttlTSWC	Atlanta	GA	\N
3	mary	me@me.com	$2a$10$vOOXy.TL02Kgwq53rlhaAOdU4Cqnyfq1vh85aVoIdUx.mUAiVw3/C	Atlanta	GA	\N
4	mary3	test@test.com	$2a$10$j9TQwLoBjkZNLM7KNkrZU.BhDNMsfqd5obmSsb9S6YLsl6LS89ZsC	New York	Texas	\N
5	redirecttest1	test1	$2a$10$.uOdbJgU/l23au/xUFAXKuHveuADPJDbPNR0w1yjvvx9b2XZ0yr/a	Atlanta	GA	\N
7	redirecttest	test2	$2a$10$R19BqW.TF9UkpFtauU9nD.mqquHwkOSJlG2gCM4zpEmf9En5hK2z6	City	State	\N
9	test	test3	$2a$10$4tf0zHJKk1/SyFjh0qBVQerGJ2gCd5mM910SPeeGyYKfUeZ2KoHb.	City	State	\N
10	test	test4	$2a$10$fJWFx997fu3xhNin7YoHweaWj59PUgIymmXsCngmLXxOKnoU6030m			\N
11	test	test5	$2a$10$jXxpgdHaOj7/KDdReqBlf.gq3qNG20XWqYjZjJ3bEyEezRIaBoWWC	City	State	\N
13	test	test6	$2a$10$A.VKP.4Yc96ZSWWSeMGBQ.mXwOIqN63Ub7Pw2DB4hYty6mxn8Daqe	city	state	\N
16	test	test7	$2a$10$DlZg48mi.U87bXbkhAiWp.zpAVTvrLArzj2sI5yk7FbQ8W0ljsHv.	city	state	\N
17	test	test8	$2a$10$Snor.XZOvOzgYeIzQh6ADuEcfcou4KuBbMIwhGFj6ejJCAcAU1w0m	city	state	\N
18	test	test9	$2a$10$eY..3CtDPAOQ3em4CPNstO4AkM.tUU9GR/U49RuUBvwaUa0Q1V25G	city	state	\N
19	test	test10	$2a$10$nT3pt1kTSfnXR/VLnV4SO.gfKI1d28HQrH7yMxTvjZD/nvYUzDrL2	city	state	\N
20	test	test11	$2a$10$HeGnyuJUucFcxOhNPjklgeaL/3oeLTxo38iO7JF33U.oH9pk2dx5G	city	state	\N
21	test	test12	$2a$10$QzpJpR95RNGYkqMsvZX34un/AFwVYc2JNae8BhhvcGaeJg4gqMBb6	city	state	\N
22	sam aparo	sam@gmail.com	$2a$10$2uodajfd84g4Rj5YPaWMyuVg2n69i7ZyJAlCGN1Uc2kTLe1t4CyVG	atlanta	georgia	\N
23	Bobby	bob@bob.com	$2a$10$FgDRQO1GMsmVVi4myVyTG.Lwb2iPHwh4F8KkeS91fQKeAZq6xWuru	Orlando	FL	\N
24	State Test	testing@test.com	$2a$10$se8WJnpA1CBh1kFN0oOn8uFJLlhwqeV.DvIBEq4VTVZoeuKsHWS2u	Montgomery	AL	\N
25	Mary Ella	me@me2.com	$2a$10$OmW.Iww8OlZXB5XC4oY5FOFrBmb4BC0l72Ezfz9rchJCLnu5nVSiu	Atlanta	GA	\N
26	Sean Reid	sean@sean.com	$2a$10$.clj4PwlDvthuAUT.CBR5OraMzgfWnZrWvALFaRH3XJisyDdvrxya	Decatur	GA	\N
\.


--
-- Data for Name: wineries; Type: TABLE DATA; Schema: public; Owner: maryella
--

COPY public.wineries (id, name, address, street, city, state, primary_vine, picture, zip) FROM stdin;
7	Yonah Mountain Vineyards	1717	Highway 255 South	Cleveland	GA	Cabernet Sauvignon	\N	30528
5	Cavender Creek Vineyard & Winery	3610	Cavender Creek Road	Dahlonega	GA	Red Blend	\N	30533
6	Habersham Vineyard & Winery	7025	 South Main Street	Helen	GA	White Blend	\N	30545
8	Wolf Mountain Vineyard & Winery	180	Wolf Mountain Trail	Dahlonega	GA	30533	\N	30533
9	Coders Delight	1630 	Piedmont	Atlanta	GA	Any wine	\N	30345
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maryella
--

SELECT pg_catalog.setval('public.reviews_id_seq', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maryella
--

SELECT pg_catalog.setval('public.users_id_seq', 26, true);


--
-- Name: wineries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maryella
--

SELECT pg_catalog.setval('public.wineries_id_seq', 9, true);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wineries wineries_name_key; Type: CONSTRAINT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.wineries
    ADD CONSTRAINT wineries_name_key UNIQUE (name);


--
-- Name: wineries wineries_pkey; Type: CONSTRAINT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.wineries
    ADD CONSTRAINT wineries_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews reviews_winery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maryella
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_winery_id_fkey FOREIGN KEY (winery_id) REFERENCES public.wineries(id);


--
-- PostgreSQL database dump complete
--

