--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    email character varying(50) NOT NULL,
    password character varying(50),
    open_from time(6) without time zone,
    open_until time(6) without time zone,
    reservation_slots integer,
    phone character varying(20),
    address character varying(500)
);


ALTER TABLE public.business OWNER TO postgres;

--
-- Name: customer_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_menu (
    id character varying(200) NOT NULL,
    title character varying(200),
    price double precision,
    description character varying(500)
);


ALTER TABLE public.customer_menu OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    email character varying(50) NOT NULL,
    firstname character varying(30),
    lastname character varying(30),
    password character varying(30)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedbacks (
    id character varying(200) NOT NULL,
    customer_id character varying(200),
    rating integer,
    "timestamp" timestamp(0) without time zone,
    feedback character varying(500)
);


ALTER TABLE public.feedbacks OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id character varying(200) NOT NULL,
    title character varying(200),
    price double precision,
    description character varying(500)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id character varying(200) NOT NULL,
    item character varying(200),
    customer character varying(200),
    price double precision,
    date date,
    reservation character varying(200),
    quantity bigint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipts (
    id character varying(200) NOT NULL,
    reservation character varying(200),
    customer character varying(200),
    date date,
    "time" time without time zone,
    subtotal double precision,
    tax double precision,
    tip bigint,
    total double precision,
    paid boolean
);


ALTER TABLE public.receipts OWNER TO postgres;

--
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    id character varying(50) NOT NULL,
    customer_id character varying(50),
    date date,
    "time" time(6) without time zone,
    special_notes character varying(200),
    table_id character varying(50),
    party_size integer,
    server character varying(50)
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- Name: restaurant_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_tables (
    id character varying(50) NOT NULL,
    capacity integer,
    server character varying(30)
);


ALTER TABLE public.restaurant_tables OWNER TO postgres;

--
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers (
    id character varying(50) NOT NULL,
    firstname character varying(30),
    lastname character varying(30)
);


ALTER TABLE public.servers OWNER TO postgres;

--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.business VALUES ('alfredo', 'password', '12:00:00', '23:59:00', 90, '(123) 456-7681', '123 Business St, Business City');


--
-- Data for Name: customer_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_menu VALUES ('ee4ab2e5-2521-4a2b-8405-349f6506169d', 'Big Mac', 5.679999828338623, 'Delicious burger made with pickels, onions and lettuce and special sauce');
INSERT INTO public.customer_menu VALUES ('4', 'Mushroom Risotto', 9.75, 'Creamy Arborio rice with wild mushrooms and a hint of truffle oil.');
INSERT INTO public.customer_menu VALUES ('5', 'Beef Burger', 10.99, 'Grilled beef patty with lettuce, tomato, and our secret sauce, served with fries.');
INSERT INTO public.customer_menu VALUES ('6', 'Grilled Salmon', 15.2, 'Freshly grilled salmon with a lemon butter sauce, served with vegetables.');
INSERT INTO public.customer_menu VALUES ('7', 'Tomato Bruchett', 7.5, 'Grilled bread with tomato, garlic, basil, and olive oil topping.');
INSERT INTO public.customer_menu VALUES ('9dfc9014-d8f7-4f3e-a1d2-a1ef67a46093', 'Pecan Pie', 5.989999771118164, 'Pecan pie is a classic American dessert featuring a sweet, custard-like filling loaded with pecans, all encased in a flaky pastry crust.');
INSERT INTO public.customer_menu VALUES ('9', 'Chicken Parmesan', 13.5, 'Breaded chicken breast topped with marinara sauce and melted cheese, served with pasta.');


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers VALUES ('john', 'john', 'doe', 'password');
INSERT INTO public.customers VALUES ('janedoe@email.com', 'jane', 'doe', 'password');
INSERT INTO public.customers VALUES ('max@email.com', 'max', 'payne', 'password');
INSERT INTO public.customers VALUES ('pouya@email.com', 'pouya', 'sameni', 'password');
INSERT INTO public.customers VALUES ('newCus@email.com', 'john', 'doe', 'password');
INSERT INTO public.customers VALUES ('nathan@email.com', 'Nathan', 'Fillion', 'password');


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.feedbacks VALUES ('655', 'Anonymous', 1, '2024-02-07 23:26:29', 'Food was cold and unappetizing, which was surprising given the restaurant''s reputation. Will think twice before coming back.');
INSERT INTO public.feedbacks VALUES ('251', 'John Doe', 2, '2024-02-07 23:26:29', 'Not what I expected, quite bland. I had heard good things, so this was a letdown. Hope it improves.');
INSERT INTO public.feedbacks VALUES ('693', 'Jane Smith', 5, '2024-02-28 23:26:29', 'Excellent service and food! Every dish was a delight, and the staff went above and beyond to ensure a memorable experience.');
INSERT INTO public.feedbacks VALUES ('204', 'Anonymous', 5, '2024-02-17 23:26:29', 'Outstanding in every way! The attention to detail, the exquisite flavors, and the warm atmosphere made our dinner unforgettable.');
INSERT INTO public.feedbacks VALUES ('460', 'Linda Davis', 3, '2024-02-05 23:26:29', 'Average, nothing special. It was an okay visit, but nothing stood out to me as memorable or particularly enjoyable.');
INSERT INTO public.feedbacks VALUES ('778', 'David Wilson', 4, '2024-02-20 23:26:29', 'Enjoyed the meal, will come again. The dishes were well prepared, and I appreciated the unique flavors.');
INSERT INTO public.feedbacks VALUES ('160', 'Anonymous', 3, '2024-02-27 23:26:29', 'Average, nothing special. It was an okay visit, but nothing stood out to me as memorable or particularly enjoyable.');
INSERT INTO public.feedbacks VALUES ('390', 'Jennifer Garcia', 3, '2024-02-03 23:26:29', 'Okay food, but service lacks. I think with a bit more effort, this could be a great place, but it''s just not there yet.');
INSERT INTO public.feedbacks VALUES ('800', 'Anonymous', 4, '2024-02-15 14:35:20', 'Great ambiance and friendly service. The food was quite good, with some dishes being truly exceptional.');
INSERT INTO public.feedbacks VALUES ('801', 'Chris Evans', 2, '2024-02-16 17:30:45', 'The atmosphere was nice, but the food did not live up to expectations. Somewhat disappointed.');
INSERT INTO public.feedbacks VALUES ('802', 'Alex Johnson', 5, '2024-02-18 19:22:33', 'Fantastic experience! The culinary creativity is off the charts. Highly recommend.');
INSERT INTO public.feedbacks VALUES ('803', 'Sam Lee', 3, '2024-02-19 12:15:47', 'It was a decent meal, but I think the menu could use more variety. Service was good.');
INSERT INTO public.feedbacks VALUES ('804', 'Kimberly White', 1, '2024-02-21 20:45:10', 'Not worth the hype. Slow service and the food was below average. Unlikely to return.');
INSERT INTO public.feedbacks VALUES ('805', 'Patricia Brown', 4, '2024-02-22 18:30:55', 'Very enjoyable dinner with innovative dishes. A pleasant surprise and will visit again.');
INSERT INTO public.feedbacks VALUES ('806', 'Michael Scott', 3, '2024-02-23 16:40:29', 'The meal was okay, but nothing that makes me eager to come back. Just average.');
INSERT INTO public.feedbacks VALUES ('807', 'Anonymous', 4, '2024-02-24 21:55:13', 'Lovely place with a cozy atmosphere. The staff is welcoming, and the food is consistently good.');
INSERT INTO public.feedbacks VALUES ('808', 'Nancy Green', 2, '2024-02-25 13:05:22', 'Expected more based on reviews. The dishes were just okay, and the service was slow.');
INSERT INTO public.feedbacks VALUES ('809', 'Frank Wright', 5, '2024-02-26 22:10:36', 'An absolute gem! Every dish was delightful and presented beautifully. Will definitely return.');
INSERT INTO public.feedbacks VALUES ('810', 'Julia Roberts', 3, '2024-02-01 17:20:48', 'Had a better experience last time. The food was good but not outstanding. Service was great, though.');
INSERT INTO public.feedbacks VALUES ('811', 'Daniel Lewis', 1, '2024-02-02 15:35:29', 'Disappointing visit. Waited too long for our meals, and they were just lukewarm.');
INSERT INTO public.feedbacks VALUES ('812', 'Morgan Freeman', 4, '2024-02-04 18:45:55', 'Very good food with an excellent selection of wine. The ambiance adds to the experience.');
INSERT INTO public.feedbacks VALUES ('813', 'Emma Watson', 5, '2024-02-06 20:50:12', 'Incredible dining experience from start to finish. The staff made us feel special and the food was spectacular.');
INSERT INTO public.feedbacks VALUES ('814', 'Ryan Gosling', 2, '2024-02-08 12:30:44', 'Was expecting more from the rave reviews. Found the food to be quite average.');
INSERT INTO public.feedbacks VALUES ('815', 'Sophia Loren', 3, '2024-02-09 19:40:31', 'A nice place with solid service, but the food didn’t quite hit the mark for me.');
INSERT INTO public.feedbacks VALUES ('816', 'Leonardo DiCaprio', 4, '2024-02-11 14:25:53', 'Really enjoyed the meal here. The seafood dishes are a must-try!');
INSERT INTO public.feedbacks VALUES ('817', 'Sandra Bullock', 2, '2024-02-12 13:15:42', 'The service was good, but the food didn’t meet my expectations. Not sure I’d return.');
INSERT INTO public.feedbacks VALUES ('818', 'Tom Hanks', 5, '2024-02-13 22:05:29', 'Absolutely fantastic! The flavors are complex and satisfying. A must-visit for food lovers.');
INSERT INTO public.feedbacks VALUES ('819', 'Meryl Streep', 1, '2024-02-14 17:50:11', 'Very disappointed with the quality of the food. Expected much better.');
INSERT INTO public.feedbacks VALUES ('594b7f3f-930e-496c-a53f-4d99cf39ec34', 'Anonymous', 4, '2024-03-11 01:04:48', 'I think the restaurant had great vibes and was very romantic for my anniversary!');
INSERT INTO public.feedbacks VALUES ('1', 'John Doe', 4, '2023-03-10 08:00:00', 'Great service!');
INSERT INTO public.feedbacks VALUES ('2', 'Jane Smith', 5, '2023-03-10 12:00:00', 'Loved the ambiance.');
INSERT INTO public.feedbacks VALUES ('3', 'Emily Johnson', 3, '2023-03-10 16:00:00', 'Good, but too noisy.');
INSERT INTO public.feedbacks VALUES ('5', 'Linda Davis', 4, '2023-03-11 13:00:00', 'Very friendly staff.');
INSERT INTO public.feedbacks VALUES ('6', 'Robert Wilson', 5, '2023-03-11 17:00:00', 'Best coffee in town.');
INSERT INTO public.feedbacks VALUES ('7', 'Patricia Miller', 4, '2023-03-12 10:00:00', 'Delicious breakfast options.');
INSERT INTO public.feedbacks VALUES ('8', 'David Moore', 3, '2023-03-12 14:00:00', 'Average experience.');
INSERT INTO public.feedbacks VALUES ('9', 'Lucas Anderson', 5, '2023-03-12 18:00:00', 'I will definitely come back!');
INSERT INTO public.feedbacks VALUES ('10', 'Maria Thomas', 4, '2023-03-13 11:00:00', 'Lovely place for a quick snack.');
INSERT INTO public.feedbacks VALUES ('14234', 'John Doe', 4, '2024-03-09 08:00:00', 'Great service!');
INSERT INTO public.feedbacks VALUES ('223423', 'Jane Smith', 5, '2024-03-09 12:00:00', 'Loved the ambiance.');
INSERT INTO public.feedbacks VALUES ('44123', 'Michael Brown', 2, '2024-03-05 09:00:00', 'Service was slow.');
INSERT INTO public.feedbacks VALUES ('52342', 'Linda Davis', 4, '2024-03-05 13:00:00', 'Very friendly staff.');
INSERT INTO public.feedbacks VALUES ('62134', 'Robert Wilson', 5, '2024-03-05 17:00:00', 'Best coffee in town.');
INSERT INTO public.feedbacks VALUES ('75345', 'Patricia Miller', 4, '2024-03-01 10:00:00', 'Delicious breakfast options.');
INSERT INTO public.feedbacks VALUES ('64568', 'David Moore', 3, '2024-03-01 14:00:00', 'Average experience.');
INSERT INTO public.feedbacks VALUES ('9234', 'Lucas Anderson', 5, '2024-03-01 18:00:00', 'I will definitely come back!');
INSERT INTO public.feedbacks VALUES ('10234', 'Maria Thomas', 4, '2024-03-08 11:00:00', 'Lovely place for a quick snack.');
INSERT INTO public.feedbacks VALUES ('6c9c4721-772f-4eaa-9679-11f9260bd64f', 'john doe', 5, '2024-03-11 16:29:03', 'This place has the best cake for any celebration');
INSERT INTO public.feedbacks VALUES ('7e16b5fc-0f4a-45e3-b2ca-c57f10b07eb4', 'john doe', 3, '2024-03-11 17:26:48', 'This was great');


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menu VALUES ('4', 'Mushroom Risotto', 9.75, 'Creamy Arborio rice with wild mushrooms and a hint of truffle oil.');
INSERT INTO public.menu VALUES ('ee4ab2e5-2521-4a2b-8405-349f6506169d', 'Big Mac', 5.679999828338623, 'Delicious burger made with pickels, onions and lettuce and special sauce');
INSERT INTO public.menu VALUES ('5', 'Beef Burger', 10.99, 'Grilled beef patty with lettuce, tomato, and our secret sauce, served with fries.');
INSERT INTO public.menu VALUES ('6', 'Grilled Salmon', 15.2, 'Freshly grilled salmon with a lemon butter sauce, served with vegetables.');
INSERT INTO public.menu VALUES ('7', 'Tomato Bruchett', 7.5, 'Grilled bread with tomato, garlic, basil, and olive oil topping.');
INSERT INTO public.menu VALUES ('9dfc9014-d8f7-4f3e-a1d2-a1ef67a46093', 'Pecan Pie', 5.989999771118164, 'Pecan pie is a classic American dessert featuring a sweet, custard-like filling loaded with pecans, all encased in a flaky pastry crust.');
INSERT INTO public.menu VALUES ('9', 'Chicken Parmesan', 13.5, 'Breaded chicken breast topped with marinara sauce and melted cheese, served with pasta.');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES ('d02bd481-3f49-4c50-b299-9744b62718a2', 'Grilled Salmon', 'max@email.com', 15.199999809265137, '2024-03-25', '4e744049-dcce-4186-bb77-c60c051647f6', 9);
INSERT INTO public.orders VALUES ('86abc12c-f19b-442d-91d0-0c17c4e02079', 'Beef Burger', 'max@email.com', 10.989999771118164, '2024-03-25', '4e744049-dcce-4186-bb77-c60c051647f6', 4);
INSERT INTO public.orders VALUES ('17522474-6c8e-4763-90cb-f6392cac58a8', 'Mushroom Risotto', 'max@email.com', 9.75, '2024-03-25', '4e744049-dcce-4186-bb77-c60c051647f6', 11);
INSERT INTO public.orders VALUES ('91d4d9a0-b4e9-4bf8-bbb7-c0a608e0b382', 'Beef Burger', 'janedoe@email.com', 10.989999771118164, '2024-03-26', '55d9aecc-b7c9-407c-9819-b7db4ca7da9f', 2);
INSERT INTO public.orders VALUES ('85ef088b-aabf-4e09-b2e4-03c08b6ce354', 'Beef Burger', 'johndoe@example.com', 10.989999771118164, '2024-03-30', '3173184f-b81a-418e-a4b8-492296ac0c5d', 5);
INSERT INTO public.orders VALUES ('b0124639-53f5-463d-b22a-bd168dfd7343', 'Tomato Bruchett', 'johndoe@example.com', 7.5, '2024-03-30', '3173184f-b81a-418e-a4b8-492296ac0c5d', 10);
INSERT INTO public.orders VALUES ('4b522014-e30e-4f4f-9502-32a1fc892516', 'Chicken Parmesan', 'johndoe@example.com', 13.5, '2024-03-30', '3173184f-b81a-418e-a4b8-492296ac0c5d', 2);


--
-- Data for Name: receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.receipts VALUES ('b0cf994e-6c5b-4ffc-b7ca-986a1bccb9e6', '55d9aecc-b7c9-407c-9819-b7db4ca7da9f', 'janedoe@email.com', '2024-03-26', '18:01:39', 21.98, 2.86, 35, 33.53, true);
INSERT INTO public.receipts VALUES ('46613ec8', 'cb35627a', '255cedbe', '2024-02-23', '11:20:00', 36.52, 2.56, 96, 135.08, true);
INSERT INTO public.receipts VALUES ('4c24d74c-70b2-472d-9e43-f7c521ee4671', 'a27d226e-70d4-4146-8a6e-fa04a44fd017', '79a66b23', '2024-02-05', '14:34:56', 55, 3.85, 8, 50.85, false);
INSERT INTO public.receipts VALUES ('6aa17f0b-4f9d-43d7-97b0-c66ce6cf3709', '1242f1b7-90f2-4235-8853-69bb056f8ba0', '58ef13f5', '2024-02-09', '20:27:53', 60, 4.2, 15, 49.2, true);
INSERT INTO public.receipts VALUES ('04096550-60cc-4482-a7ad-aa979fa65ff8', 'f382919f-072d-4b73-b518-02c72004e720', '701363c6', '2024-02-11', '06:30:28', 65, 4.55, 70, -0.45, false);
INSERT INTO public.receipts VALUES ('8fe52676-3720-4c89-b1a6-4e89c4474ee8', 'f95e5250-4d4d-4a75-abdf-12d85a0f4ff3', '3351e190', '2024-02-13', '01:06:44', 70, 4.9, 34, 40.9, false);
INSERT INTO public.receipts VALUES ('52651b35-9fa7-459e-9cfb-12795974b426', '3105e508-e7d5-468d-a3a6-e34e44ff5976', '6e275a10', '2024-02-17', '12:26:56', 75, 5.25, 64, 16.25, true);
INSERT INTO public.receipts VALUES ('d4ac7413-19ca-4812-868b-b2a8a3bd89e4', 'f63123a7-eb29-4b3c-b918-139e0063be69', '0c56fc85', '2024-02-18', '12:03:54', 80, 5.6, 14, 71.6, true);
INSERT INTO public.receipts VALUES ('0d672d2d-1e00-4ec7-8bdd-ca409d8f337c', '2be4a007-c388-4813-bb92-2376d85e0c77', '689d3eba', '2024-02-19', '00:19:08', 85, 5.95, 48, 42.95, false);
INSERT INTO public.receipts VALUES ('ad58ba95-f783-4b60-abf4-55632be4217f', 'b9c9745a-f600-449c-8750-077f81b46887', 'a8bfaed5', '2024-02-21', '14:46:49', 90, 6.3, 21, 75.3, false);
INSERT INTO public.receipts VALUES ('5498cd23-3841-46e5-8104-1febc1b7ccd4', '8d588550-db5f-4ce8-9bd9-6dbcfc76b8f5', '83c62de2', '2024-02-28', '04:08:35', 95, 6.65, 36, 65.65, true);
INSERT INTO public.receipts VALUES ('bda68558-f82e-456f-8e85-14aa60f41ab6', '737da2e2-2b83-449f-a5f2-7a1291dc20f0', 'c480a716', '2024-02-29', '08:53:01', 100, 7, 45, 62, false);
INSERT INTO public.receipts VALUES ('3e2e244f', '792a0b56', 'd2249ba1', '2024-03-17', '13:02:00', 120, 26.49, 88, 492.95, true);
INSERT INTO public.receipts VALUES ('4f945aff', 'c3ee7d2c', 'fd03452c', '2024-02-27', '09:04:00', 96, 24.77, 17, 395.57, true);
INSERT INTO public.receipts VALUES ('5823cd52', '679336f8', '7f7880ff', '2024-02-21', '09:02:00', 134, 13.11, 6, 206.46, false);
INSERT INTO public.receipts VALUES ('76560357-3234-4ef1-a8fa-c373ed0ffb85', '4e744049-dcce-4186-bb77-c60c051647f6', 'max@email.com', '2024-03-25', '23:00:44', 186, 37.44, 18, 384.03, true);
INSERT INTO public.receipts VALUES ('810f48b4', '13300fe3', 'ff987ade', '2024-02-23', '17:28:00', 89, 14.25, 44, 261.86, false);
INSERT INTO public.receipts VALUES ('eaba3680', '528e758c', '0da54103', '2024-03-10', '00:20:00', 200, 32.49, 67, 563.58, false);
INSERT INTO public.receipts VALUES ('ede1029b', 'c1bcc336', '669dbc21', '2024-03-18', '12:17:00', 167, 32.27, 24, 517.31, false);
INSERT INTO public.receipts VALUES ('f406054c', '89507d95', '6da8a75b', '2024-03-16', '22:21:00', 156, 33.08, 72, 577.63, true);
INSERT INTO public.receipts VALUES ('577ec079-5d0e-4c7e-b3f2-9546077390ed', '3173184f-b81a-418e-a4b8-492296ac0c5d', 'johndoe@example.com', '2024-03-30', '16:15:08', 156.95, 20.4, 10, 195.08, true);


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservations VALUES ('85072301-79b0-4705-8be2-3175c1a1292d', 'john', '2024-02-19', '15:00:00', '', 'table1', 1, 'Peter Parker');
INSERT INTO public.reservations VALUES ('c8ebfc03-9c6c-4553-a10d-3e3516a0d984', 'idonotexist', '2024-02-27', '12:00:00', '', 'table1', 0, 'Peter Parker');
INSERT INTO public.reservations VALUES ('be02dcdd-0f5b-4460-bb4c-778dc8828d18', 'johndoe@example.com', '2024-03-02', '12:00:00', 'Near Window', 'table4', 8, 'James Smith');
INSERT INTO public.reservations VALUES ('9dcd2721-8e71-438c-814d-cafc81aa98d5', 'johndoe@example.com', '2024-03-02', '12:00:00', 'Near Window', 'table4', 8, 'James Smith');
INSERT INTO public.reservations VALUES ('28153cb5-c68f-4334-9876-9609d22ad347', 'johndoe@example.com', '2024-03-02', '12:00:00', 'Near Window', 'table4', 8, 'James Smith');
INSERT INTO public.reservations VALUES ('b84b7797-4b1e-4049-9c0c-fc54c6dd6936', 'johndoe@example.com', '2024-03-02', '12:00:00', 'Near Window', 'table4', 8, 'James Smith');
INSERT INTO public.reservations VALUES ('7bba1e4f-09b6-4259-8540-382318b9f9ca', 'john', '2024-03-27', '19:00:00', 'This is my Anniversary', 'table99', 6, 'Peter Parker');
INSERT INTO public.reservations VALUES ('95c06bb9-fcb2-4679-bed4-29247836d6ea', 'john', '2024-02-25', '12:00:00', '', 'table1', 5, 'Peter Parker');
INSERT INTO public.reservations VALUES ('92c29c80-e3a0-4ad1-984d-845b45cff4ad', 'idonotexist', '2024-03-11', '12:00:00', '', 'table1', 0, 'Peter Parker');
INSERT INTO public.reservations VALUES ('3173184f-b81a-418e-a4b8-492296ac0c5d', 'johndoe@example.com', '2024-03-31', '12:00:00', 'Near Window + Candles', 'table3', 8, 'James Smith');
INSERT INTO public.reservations VALUES ('4e744049-dcce-4186-bb77-c60c051647f6', 'max@email.com', '2024-03-31', '13:30:00', 'This is gonna be my friends birthday', 'table10', 6, 'Peter Parker');
INSERT INTO public.reservations VALUES ('55d9aecc-b7c9-407c-9819-b7db4ca7da9f', 'janedoe@email.com', '2024-03-31', '13:30:00', 'Trying 2', 'table1', 1, 'Peter Parker');
INSERT INTO public.reservations VALUES ('8d476932-9fa9-4a2b-a433-6364e4ba49f2', 'john', '2024-03-19', '13:30:00', '', 'table10', 4, 'Peter Parker');


--
-- Data for Name: restaurant_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurant_tables VALUES ('table1', 2, '1');
INSERT INTO public.restaurant_tables VALUES ('table2', 4, '2');
INSERT INTO public.restaurant_tables VALUES ('table3', 6, '3');
INSERT INTO public.restaurant_tables VALUES ('table4', 6, '4');
INSERT INTO public.restaurant_tables VALUES ('table5', 10, '5');


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.servers VALUES ('1', 'Peter', 'Parker');
INSERT INTO public.servers VALUES ('2', 'Alex', 'Johnson');
INSERT INTO public.servers VALUES ('3', 'Maria', 'Gonzalez');
INSERT INTO public.servers VALUES ('4', 'James', 'Smith');
INSERT INTO public.servers VALUES ('5', 'Linda', 'Brown');


--
-- Name: business business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (email);


--
-- Name: customer_menu customer_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_menu
    ADD CONSTRAINT customer_menu_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (email);


--
-- Name: feedbacks feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: receipts receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- Name: restaurant_tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

