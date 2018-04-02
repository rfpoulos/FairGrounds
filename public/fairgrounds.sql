--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: rachelpoulos
--

CREATE TABLE public.articles (
    articleid integer NOT NULL,
    topic character varying(500),
    url character varying(500) NOT NULL,
    author character varying(500),
    description character varying(500),
    publishedat character varying(500),
    urltoimage character varying(500),
    source character varying(500),
    title character varying(500)
);


ALTER TABLE public.articles OWNER TO rachelpoulos;

--
-- Name: articles_articleid_seq; Type: SEQUENCE; Schema: public; Owner: rachelpoulos
--

CREATE SEQUENCE public.articles_articleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_articleid_seq OWNER TO rachelpoulos;

--
-- Name: articles_articleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rachelpoulos
--

ALTER SEQUENCE public.articles_articleid_seq OWNED BY public.articles.articleid;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: rachelpoulos
--

CREATE TABLE public.ratings (
    ratingid integer NOT NULL,
    userid integer,
    articleid integer,
    fair integer,
    unfair integer,
    newsworthy integer,
    not_newsworthy integer
);


ALTER TABLE public.ratings OWNER TO rachelpoulos;

--
-- Name: ratings_ratingid_seq; Type: SEQUENCE; Schema: public; Owner: rachelpoulos
--

CREATE SEQUENCE public.ratings_ratingid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_ratingid_seq OWNER TO rachelpoulos;

--
-- Name: ratings_ratingid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rachelpoulos
--

ALTER SEQUENCE public.ratings_ratingid_seq OWNED BY public.ratings.ratingid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rachelpoulos
--

CREATE TABLE public.users (
    username character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    userid integer NOT NULL,
    leaning integer,
    email character varying(200)
);


ALTER TABLE public.users OWNER TO rachelpoulos;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: rachelpoulos
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO rachelpoulos;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rachelpoulos
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: articles articleid; Type: DEFAULT; Schema: public; Owner: rachelpoulos
--

ALTER TABLE ONLY public.articles ALTER COLUMN articleid SET DEFAULT nextval('public.articles_articleid_seq'::regclass);


--
-- Name: ratings ratingid; Type: DEFAULT; Schema: public; Owner: rachelpoulos
--

ALTER TABLE ONLY public.ratings ALTER COLUMN ratingid SET DEFAULT nextval('public.ratings_ratingid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: rachelpoulos
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: rachelpoulos
--

COPY public.articles (articleid, topic, url, author, description, publishedat, urltoimage, source, title) FROM stdin;
1	\N	https://www.ccn.com/vitalik-buterin-makes-semi-legitimate-proposal-on-capping-ether-supply/	null	Ethereum’s most well-known founder and, perhaps, most benevolent influence-wielder is starting April off the way he normally does: cracking jokes	2018-04-02T16:41:30Z	https://www.ccn.com/wp-content/uploads/2014/06/Vitalik-Buterin-ghash-51-attack.jpg	Crypto Coins News	Vitalik Buterin Makes (Semi-)Legitimate Proposal on Capping Ether Supply
563	\N	https://www.ccn.com/bitcoin-price-leads-crypto-comeback-after-market-briefly-dips-below-250-billion/	null	Join our community of 10 000 traders on Hacked.com for just $39 per month. The Bitcoin price led a comprehensive cryptocurrency comeback on Monday after the market briefly dipped below $250 billion on Sunday. Altogether, 97 of the top 100 cryptocurrencies pos…	2018-04-02T17:42:12Z	https://www.ccn.com/wp-content/uploads/2018/03/Bitcoin-glass-reflection.jpg	Crypto Coins News	Bitcoin Price Leads Crypto Comeback after Market Briefly Dips Below $250 Billion
817	\N	http://www.telegraph.co.uk/health-fitness/mind/could-british-hold-secret-long-term-happiness/	Judith Woods	Mindfulness.	2018-04-02T18:00:04Z	https://www.telegraph.co.uk/content/dam/health-fitness/2018/04/02/TELEMMGLPICT000159273853-xlarge_trans_NvBQzQNjv4BqlQxrnBRGMq_NQR-lerxniqYLpfpdzuAeaWi3BfWg80U.jpeg	The Telegraph	Could the British hold the secret to long-term happiness?
585	\N	http://www.dailymail.co.uk/news/article-5569383/Tougher-MOT-rules-leave-British-drivers-open-2-500-fine.html	By Alexander Robertson For Mailonline	British drivers could face the hefty penalty should they put their car in for an early MOT and it fails, but continue to drive their car until the previous certificate runs out.	2018-04-02T16:54:07+00:00	http://i.dailymail.co.uk/i/newpix/2018/04/02/11/4AC2D79900000578-0-image-a-33_1522666231057.jpg	Daily Mail	Tougher MOT rules could leave British drivers open to a £2,500 fine
596	\N	https://www.axios.com/costa-rica-rejects-preacher-gay-marriage-alvarado-a7936e44-94b2-4b01-86f3-80ec3d1b3604.html?utm_source=sidebar	Dave Lawler	Carlos beat Fabricio in battle of Alvarados	2018-04-02T16:45:03.5625683Z	https://images.axios.com/tE0Koe-rt3vnTlim9XaGG8rCJLk=/0x318:4763x2997/1920x1080/2018/04/02/1522686203405.jpg	Axios	Costa Rica rejects anti-establishment preacher in presidential election
600	\N	http://business.financialpost.com/investing/market-moves/stocks-tumble-on-tech-rout-as-support-levels-fail-markets-wrap	Bloomberg News	The fourth time proved to be too much.The S&P 500 Index finally tumbled below its 200-day moving average, dragged down by tech troubles and tariffs. To chart watchers, the failure portends even…	2018-04-02T16:38:58Z	https://financialpostcom.files.wordpress.com/2018/04/traders.jpg	Financial Post	S&P 500 just fell below its 200-day moving average, a warning of bigger drops to come
604	\N	http://www.business-standard.com/article/pti-stories/icici-bank-board-clears-redemption-of-350-unlisted-preference-shares-118040201214_1.html	Press Trust of India	Private sector ICICI Bank board today approved redemption of 350 unlisted preference shares of Rs 1 crore each and decided to reclassify all kinds authorised share capital into equity.\nHowever, the bank did not say anything with regard to review of	2018-04-02T16:35:39+00:00	http://bsmedia.business-standard.com/include/_mod/site/html5/images/no-meta-preview.jpg	Google News (India)	ICICI Bank board clears redemption of 350 unlisted preference shares
609	\N	http://www.ign.com/articles/2018/04/02/walking-dead-helicopter-season-8-jadis-negan	Laura Prudom	The Walking Dead just brought back a plot point that could give us a big hint about Season 9.	2018-04-02T16:30:19Z	http://assets1.ignimgs.com/2018/04/02/the-walking-dead-helicopter-jadis-1522645386195_1280w.jpg	IGN	The Walking Dead: Mystery Helicopter Reappears in Season 8, Episode 14 - IGN
614	\N	https://www.washingtonpost.com/lifestyle/style/as-sinclairs-sound-alike-anchors-draw-criticism-for-fake-news-promos-trump-praises-broadcaster/2018/04/02/a1be67e8-367a-11e8-9c0a-85d477d9a226_story.html	Paul Farhi, Paul Farhi	Controversy grows over nation’s largest TV station owner ordering on-air stars to denounce other media.	2018-04-02T16:28:00Z	https://www.washingtonpost.com/rf/image_1484w/2010-2019/WashingtonPost/2018/04/02/Style/Images/Sinclair_Broadcast_Group_71513-67f69.jpg?t=20170517	The Washington Post	As Sinclair’s sound-alike anchors draw criticism for ‘fake news’ promos, Trump praises broadcaster
622	\N	https://www.news24.com/SouthAfrica/News/south-africans-mourn-the-passing-of-mother-of-the-nation-20180402	null	Tributes have started pouring in for the Mother of the Nation, Mama Winnie Madikizela-Mandela, who has died at the age of 81.	2018-04-02T16:24:20+00:00	http://cdn.24.co.za/files/Cms/General/d/5029/1641c0a2b9b54199a5e6379f56f34382.jpg	News24	South Africans mourn the passing of Mother of the Nation
627	\N	http://www.dailymail.co.uk/news/article-5568831/Easter-Monday-washout.html	By Thomas Burrows	Torrential rain and snow is making it a miserable Easter Monday for millions today with up to six inches of snow falling across much of Wales, northern England and Northern Ireland.	2018-04-02T16:21:21+00:00	http://i.dailymail.co.uk/i/newpix/2018/04/02/15/4AC37D4100000578-0-image-a-22_1522678734452.jpg	Daily Mail	Easter Monday washout!
865	\N	https://www.telegraph.co.uk/business/2018/04/02/china-hits-back-trump-tariffs-us-could-launch-new-tech-taxes/	Tim Wallace	US stocks fell as China followed through on a threat to retaliate against American tariffs with border taxes of its own.	2018-04-02T16:38:00+00:00	https://www.telegraph.co.uk/content/dam/business/2018/04/02/TELEMMGLPICT000159284539-xlarge_trans_NvBQzQNjv4Bq6844extr6dIv-d8O8PIpPvPWrgxCK26Tfw5tRwva21g.jpeg	Google News (UK)	China hits back at Trump tariffs - but US could launch new tech taxes this week
564	\N	https://www.washingtonpost.com/world/israel-says-it-has-reached-unprecedented-deal-to-resettle-african-migrants-in-the-west/2018/04/02/caf86280-367a-11e8-af3c-2123715f78df_story.html	Adam Taylor, Adam Taylor	More 16,000 African migrants would leave the country under the agreement with the U.N. refugee agency, the government said.	2018-04-02T17:03:00Z	https://www.washingtonpost.com/rf/image_1484w/2010-2019/WashingtonPost/2018/04/02/Foreign/Images/2018-03-24T211733Z_1838388782_RC13639B1990_RTRMADP_3_ISRAEL-AFRICA-MIGRANTS.jpg?t=20170517	The Washington Post	Israel says it has reached ‘unprecedented’ deal to resettle African migrants in the West
587	\N	https://www.ft.com/content/ed11507c-334e-11e8-ac48-10c6fdc22f03	null	null	2018-04-02T16:53:02.7675134Z	https://www.ft.com/__assets/creatives/brand-ft/icons/v3/open-graph.png	Financial Times	Swiss bankers’ hopes for EU access dashed by Brexit
827	\N	http://www.metronews.ca/news/world/2018/04/02/teen-plunges-25-feet-into-drainage-pipe-at-los-angeles-park.html	null		2018-04-02T17:08:57+00:00	http://www.metronews.ca/etc/designs/thestar/images/apple-touch.png	Google News (Canada)	Teen rescued 12 hours after falling into Los Angeles pipe
606	\N	http://www.telegraph.co.uk/news/2018/04/02/good-riddance-alison-saunders-cps-put-fashionable-campaigns/	Ross Clark	I won&rsquo;t be sorry to see the back of Alison Saunders as Director of Public Prosecutions when she steps down this October after five years in the job.	2018-04-02T16:31:26Z	https://www.telegraph.co.uk/content/dam/news/2016/05/01/alisonsaunders-xlarge_trans_NvBQzQNjv4BqpJliwavx4coWFCaEkEsb3kvxIt-lGGWCWqwLa_RXJU8.jpg	The Telegraph	Good riddance to Alison Saunders. Her CPS put fashionable campaigns ahead of the public interest
612	\N	https://www.polygon.com/2018/4/2/17188486/lets-talk-about-the-ending-of-far-cry-5	Russ Frushtick	Hope County real estate is probably not the best investment	2018-04-02T16:30:02Z	https://cdn.vox-cdn.com/thumbor/itvXL0Z2O0o5zMzt9vnZh9weKu8=/0x33:1840x996/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/10571043/Screen_Shot_2018_04_01_at_2.11.57_PM.png	Polygon	Let’s talk about the ending of Far Cry 5
621	\N	http://www.bloomberg.com/news/articles/2018-04-02/musk-sees-one-week-model-3-output-exceeding-2-000-report-says	Craig Trudell	Tesla Inc. Chief Executive Officer Elon Musk told employees in an email early Monday morning that the electric-car maker may exceed a weekly production rate of 2,000 Model 3 sedans, according to the blog Jalopnik.	2018-04-02T16:25:19Z	https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iA6Vp.gpun5M/v1/1200x800.jpg	Bloomberg	Musk Sees One-Week Model 3 Output Exceeding 2,000, Report Says
831	\N	https://www.theverge.com/2018/4/2/17188782/apple-virtual-augmented-reality-patent-self-driving-cars	Dani Deahl	Apple has applied to patent a VR system for autonomous cars that would use interior screens and VR headsets to alter the interior of the vehicle.	2018-04-02T17:03:15Z	https://cdn.vox-cdn.com/thumbor/NRo_pBxSD7YlbGR0keQQJbmhywM=/0x80:802x500/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/10571611/Screen_Shot_2018_04_02_at_11.39.51_AM.png	The Verge	Apple applies for patent that lets riders virtually fight zombies or hang glide in self-driving cars
837	\N	http://www.thehindu.com/news/cities/kolkata/damaged-kolkata-flyover-may-collapse-any-time/article23417644.ece	Soumya Das	Residents say remaining portion of the under-construction bridge that collapsed in 2016 killing 28 people poses imminent threat	2018-04-02T16:59:13Z	http://www.thehindu.com/news/cities/kolkata/article23417642.ece/ALTERNATES/LANDSCAPE_615/02THRDFLYOVER	The Hindu	‘Damaged Kolkata flyover may collapse any time’
946	\N	https://www.theverge.com/2018/4/2/17189048/fortnite-battle-royale-ios-mobile-epic-games-available-now-download	Nick Statt	Epic Games’ Fortnite is officially out of beta on mobile, meaning anyone with an iPhone SE / 6S or later running iOS 11 (or an iPad mini 4 / Air 2 or later) can download the game and jump into a match. Epic announced the news on its Twitter feed this morning.	2018-04-02T17:17:28Z	https://cdn.vox-cdn.com/thumbor/sp0QmJB-nQwVhbU0_v3yHU_EAtc=/0x181:2600x1542/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/10437351/fortniteiphonex.JPG	The Verge	Fortnite is now open to everyone on iOS
824	\N	https://marc.info/?l=openbsd-announce&amp;m=152267725618055	null	null	2018-04-02T17:07:04.7093739Z	null	Hacker News	OpenBSD 6.3 released
579	\N	http://mashable.com/2018/04/02/migos-drake-dr-seuss-walk-it-like-i-talk-it/	Nicole Gallucci	Storytime just got lit AF.	2018-04-02T16:55:58Z	https://i.amz.mshcdn.com/Vv3Ec3vZX8eMSFOTz6QLdhrbwXg=/1200x630/2018%2F04%2F02%2F56%2F3eb05bcf28ff4f419fc610e1132f1f05.66913.png	Mashable	Who knew a Dr. Seuss and Migos collab was exactly what the world needed?
584	\N	https://www.ft.com/content/3eadeae4-3688-11e8-8b98-2f31af407cc8	null	null	2018-04-02T16:52:50.7009157Z	https://www.ft.com/__assets/creatives/brand-ft/icons/v3/open-graph.png	Financial Times	Anti-apartheid leader Winnie Madikizela-Mandela dies
592	\N	https://www.buzzfeed.com/jennifertonti/beauty-products-on-jet-that-only-look-expensive	Jennifer Tonti	Everything in this post is $20 or under!	2018-04-02T16:50:06Z	https://img.buzzfeed.com/buzzfeed-static/static/2018-03/30/19/enhanced/buzzfeed-prod-web-06/original-7384-1522451703-2.jpg?crop=1744:913;30,0	Buzzfeed	19 Beauty Products On Jet That Only Look Expensive
598	\N	http://ftw.usatoday.com/2018/04/little-caesars-free-lunch-combo-long-lines-umbc-virginia-ncaa-tournament-videos-photos?utm_source=google&utm_medium=amp&utm_campaign=speakabl	null	People are thanking UMBC for the huge first-round upset.	2018-04-02T16:40:42+00:00	https://www.gannett-cdn.com/-mm-/16fd39dd2a3de44167843048b16c9a53ad7b3c39/c=0-92-1500-936&r=x1683&c=3200x1680/local/-/media/2018/04/02/USATODAY/usatsports/xxx_pizzax_background_66642718-1.jpg	USA Today	See the super-long lines for free Little Caesars
608	\N	http://www.fourfourtwo.com/news/no-chance-heynckes-tells-real-madrid-forget-lewandowski	FourFourTwo	Jupp Heynckes has sought to end talk of Robert Lewandowski leaving Bayern Munich, but he was less clear on Arjen Robben and Franck Ribery.	2018-04-02T16:31:01Z	https://images.cdn.fourfourtwo.com/sites/fourfourtwo.com/files/robertlewandowski-cropped_11fsup4h8fwe412kixokpv75a5.jpg	FourFourTwo	No chance! Heynckes tells Real Madrid to forget Lewandowski
613	\N	https://www.usatoday.com/story/news/nation/2018/04/02/teacher-strikes-shut-down-schools-across-oklahoma-kentucky/478102002/?utm_source=google&utm_medium=amp&utm_campaign=speakable	null	Classes were canceled Monday for hundreds of thousands of students across two states as striking teachers rallied at Capitols in Oklahoma and Kentucky.	2018-04-02T16:29:04+00:00	https://www.gannett-cdn.com/-mm-/1b3d05c41a09bd1c8a04246baf04ff907e436fe2/c=0-213-3078-1952&r=x1683&c=3200x1680/local/-/media/2018/04/02/USATODAY/USATODAY/636582663928745625-AP-Teacher-Walkout-Oklahoma.jpg	USA Today	Teacher strikes shut down schools across Oklahoma, Kentucky
625	\N	https://arstechnica.com/gaming/2018/04/poorly-selling-steam-machines-finally-removed-from-steam-store-front-page/	Kyle Orland	Move seems to be final nail in coffin for SteamOS-based hardware push.	2018-04-02T16:21:59+00:00	https://cdn.arstechnica.net/wp-content/uploads/2015/10/steamos9-640x215.jpg	Ars Technica	Poorly selling Steam Machines finally removed from Steam store front page
630	\N	http://www.dailymail.co.uk/news/article-5569733/Leaked-emails-Kremlin-prepared-pay-hacking.html	By Tim Sculthorpe, Deputy Political Editor For Mailonline	Tory MP and Russia analyst Bob Seely (pictured) today said it was vital for Britain to understand the methods used by the Kremlin regime to stand a chance of stopping them here.	2018-04-02T16:18:43+00:00	http://i.dailymail.co.uk/i/newpix/2018/04/02/14/4AC3489900000578-0-image-a-41_1522674994272.jpg	Daily Mail	Leaked emails show Kremlin is prepared to pay for hacking
945	\N	https://www.wsj.com/articles/technology-shares-plunge-again-amid-growing-backlash-1522689491	Akane Otani	Investors rushed out of the biggest names in the tech industry, the latest sign that scrutiny from lawmakers and regulators, backlash from consumers and flagging share performance is threatening to undermine their dominance in the stock market.	2018-04-02T17:18:00Z	https://images.wsj.net/im-5768/social	The Wall Street Journal	Technology Shares Plunge Again Amid Growing Backlash
835	\N	https://www.buzzfeed.com/yiyang/ways-to-be-a-better-adult-in-april-2018	Yi Yang	I ate an apple instead of gummy bears today — am I an adult yet?!	2018-04-02T17:01:05Z	https://img.buzzfeed.com/buzzfeed-static/static/2018-03/30/12/enhanced/buzzfeed-prod-web-02/original-781-1522426743-2.png?crop=676:354;17,0	Buzzfeed	23 Ways To Be A Better Adult In April
839	\N	https://www.ndtv.com/business/icici-bank-board-clears-redemption-of-350-unlisted-preference-shares-1831919	null	However, the bank did not say anything regarding insolvency cases which was part of board meeting agenda.	2018-04-02T16:58:40+00:00	https://i.ndtvimg.com/i/2017-10/icici-bank-650_650x400_51507010813.jpg	Google News (India)	ICICI Bank Board Clears Redemption Of 350 Unlisted Preference Shares
854	\N	https://www.vox.com/2018/4/2/17187900/trump-immigration-caravan-daca-nuclear-option	Dara Lind	Decoding Trump’s latest immigration Twitter tantrums.	2018-04-02T16:50:00+00:00	https://cdn.vox-cdn.com/thumbor/JWUQ-gMhKLpP4DMMwLRMnsl_Dc8=/0x0:3516x1841/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/4340215/GettyImages-499670390.jpg	Google News (Australia)	Donald Trump is extremely mad about immigration, and also extremely confused
566	\N	https://news.nationalgeographic.com/2018/03/war-in-syria--real-people-tell-their-stories-of-survival--hope.html	Simon Worrall	A reporter follows a group of Syrians from all sides of the war—fighters, students, children—and their struggles to survive the conflict.	2018-04-02T17:00:18.2221417Z	https://news.nationalgeographic.com/content/dam/news/2018/03/31/bt-no-turning-back/book-talk-no-turning-back-syria_03.jpg	National Geographic	War in Syria: Stories of Survival and Hope
580	\N	https://www.ft.com/content/0b892c0c-32c1-11e8-b5bf-23cb17fd1498	null	null	2018-04-02T16:52:59.8016626Z	https://www.ft.com/__assets/creatives/brand-ft/icons/v3/open-graph.png	Financial Times	Zara owner Inditex ramps up digital assault
586	\N	https://www.ft.com/content/b5d849c2-3668-11e8-8b98-2f31af407cc8	null	null	2018-04-02T16:52:47.1444964Z	https://www.ft.com/__assets/creatives/brand-ft/icons/v3/open-graph.png	Financial Times	Mark Zuckerberg hits back at Tim Cook over criticism
590	\N	http://www.dailymail.co.uk/news/article-5569607/Number-killed-Bank-Holiday-crashes-rises-seven.html	By Amie Gordon For Mailonline	Several motorists have died in fatal crashes on roads up and down the UK, including the M25, M5 and M62 drivers are being urged to take care amid the carnage on one of the busiest days of the year.	2018-04-02T16:55:22+00:00	http://i.dailymail.co.uk/i/newpix/2018/04/02/16/4AC39C3500000578-0-image-a-30_1522681522660.jpg	Daily Mail	Number killed in Bank Holiday crashes rises to seven
594	\N	http://indianexpress.com/article/who-is/winnie-madikizela-mandela-dead-nelson-mandela-anti-apartheid-activist-south-africa-5120961/	Express Web Desk	Known to her supporters as the "Mother of the Nation," Winnie Mandela played a prominent role in the battle to end white supremacy in South Africa. Her name, however, was also often linked with violence and corruption.	2018-04-02T16:47:11+00:00	http://images.indianexpress.com/2018/04/winnie-nelsom.jpg?w=759	Google News (India)	Who was Winnie Madikizela-Mandela?
599	\N	http://feeds.reuters.com/~r/reuters/topNews/~3/D2XnSz5v3ek/tesla-making-2000-model-3s-per-week-report-idUSKCN1H91IC	Reuters Editorial	Tesla Inc (TSLA.O) will fall short of its 2,500 per week target for production of the crucial Model 3 sedan when it reports its numbers this week, according to a report by tech website Jalopnik, citing an email from Chief Executive Officer Elon Musk to employ…	2018-04-02T16:40:26Z	https://s4.reutersmedia.net/resources/r/?m=02&d=20180402&t=2&i=1247325854&w=1200&r=LYNXNPEE310Y8	Reuters	Tesla making 2,000 Model 3s per week: report
601	\N	https://www.theverge.com/2018/4/2/17188752/espn-plus-launching-april-12th-pricing-features-content	Chris Welch	ESPN’s standalone subscription service doesn’t include the actual cable channel, but it will offer thousands of hours of live events and original shows.	2018-04-02T16:38:22Z	https://cdn.vox-cdn.com/thumbor/JRYL6KyeX2_LIApWOY8qLdAfE4A=/0x27:660x373/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/10571471/ESPNPlus.jpg	The Verge	ESPN+ will launch on April 12th for $4.99 per month
826	\N	https://www.polygon.com/2018/4/2/17188726/video-game-flops-where-the-water-tastes-like-wine-sales	Allegra Frank	Where the Water Tastes Like Wine showed promise, but creator calls it a major flop	2018-04-02T17:10:33Z	https://cdn.vox-cdn.com/thumbor/4EwcE6AhmXhQoxFnOhwREvP8RFo=/0x25:1280x695/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/10571731/where_the_water_tastes_like_wine_recensione_fiabe_leggende_miti_americani_recensione_v8_37655_1280x16.jpg	Polygon	An honest look behind the scenes of a huge commercial flop
610	\N	http://www.news.com.au/technology/online/social/court-of-facebook-zuckerberg-slams-apple-unveils-networks-chilling-ambitions/news-story/54c9e7b9c9621a685d5cfaed9ceb4146	Emma Reynolds	MARK Zuckerberg has hit out at Apple in an escalating war of words with CEO Tim Cook, who last week criticised Facebook for violating users’ “human right” to privacy.	2018-04-02T16:30:18Z	http://cdn.newsapi.com.au/image/v1/43e263839c5a460b7e6c64dc079dc6a9	News.com.au	Facebook vs. Apple as war of words heats up
620	\N	https://www.cnbc.com/2018/04/02/companies-prepare-to-come-to-the-rescue-of-faltering-stock-market.html	Jeff Cox	The current stock market tumult should ease once companies accelerate the repurchase of their own shares, according to a Deutsche Bank analysis. Deutsche strategist Binky Chadha predicts S&P 500 company buybacks to total $650 billion, which would amount to a …	2018-04-02T16:25:57Z	https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2018/03/08/105052195-GettyImages-653391744.1910x1000.jpg	CNBC	Companies prepare to come to the rescue of faltering stock market
624	\N	http://thehill.com/policy/finance/381265-stocks-slide-as-china-announces-tariffs-on-us-imports	Sylvan Lane	U.S. stocks slid Monday after China announced new tariffs on agricultural imports from the States in response to President Trump’s levies on foreign steel in aluminum.	2018-04-02T16:22:31Z	http://thehill.com/sites/default/files/china_flag.jpg	The Hill	Stocks slide as China announces tariffs on US imports
628	\N	https://www.ctvnews.ca/world/anti-apartheid-activist-winnie-madikizela-mandela-dies-at-81-1.3867788	Christopher Torchia	Winnie Madikizela-Mandela, a prominent anti-apartheid activist and the ex-wife of Nelson Mandela, died in a hospital on Monday after a long illness. She was 81.	2018-04-02T16:19:07+00:00	https://www.ctvnews.ca/polopoly_fs/1.2524939.1440035117!/httpImage/image.jpg_gen/derivatives/landscape_620/image.jpg	Google News (Canada)	Anti-apartheid activist Winnie Madikizela-Mandela dies at 81
834	\N	http://ew.com/tv/2018/04/02/futurama-cast-reunion-atx/	Dan Snierson		2018-04-02T17:01:59Z	https://ewedit.files.wordpress.com/2017/06/futurama.jpg?crop=0px%2C127px%2C3183px%2C1673px&resize=1200%2C630	Entertainment Weekly	<em>Futurama </em>reunion coming to ATX Television Festival
850	\N	http://www.bbc.co.uk/news/world-us-canada-43621837	BBC News	The boy spent 13 hours trapped in a sewage system after falling through a roof, officials say.	2018-04-02T16:57:11Z	https://ichef.bbci.co.uk/news/1024/branded_news/17FD0/production/_100665289_care634634pture.jpg	BBC News	California teen rescued from sewage pipe
567	\N	https://news.nationalgeographic.com/2018/03/red-coral-ocean-animals-longevity-lifespan-environment.html	Liz Langley	Animals that live in deeper waters and don’t move a whole lot are likely to have longer lives.	2018-04-02T17:00:18.6155207Z	https://news.nationalgeographic.com/content/dam/news/2018/03/31/waq-deep-sea-longevity/01-waq-deep-sea-longevity-BNPRXD.jpg	National Geographic	Why This Animal Can Live for Over 500 Years
581	\N	http://www.dailymail.co.uk/news/article-5569145/Met-abandons-policy-automatically-believing-rape-complainants.html	By Thomas Burrows	Cressida Dick said officers must investigate rather than blindly believe an allegation, and should keep an open mind when a victim has come forward.	2018-04-02T16:52:55+00:00	http://i.dailymail.co.uk/i/newpix/2018/04/02/10/170618B800000514-0-image-a-15_1522659615510.jpg	Daily Mail	Met abandons policy of automatically believing rape complainants
582	\N	https://news.nationalgeographic.com/2018/04/oumuanua-asteroid-life-earth-solar-system-space-spd.html	Sarah Gibbens	Asteroids helped shape life on Earth, and astronomers are studying the chunks of rock to learn about life in other solar systems.	2018-04-02T17:00:13.4925752Z	https://news.nationalgeographic.com/content/dam/news/2018/04/02/asteroid-impact-earth-one-strange-rock/01-interstellar-asteroid.jpg	National Geographic	How Do Asteroids Create Life?
588	\N	https://www.ft.com/content/1d9d85e8-3684-11e8-8eee-e06bde01c544	null	null	2018-04-02T16:52:44.1376074Z	https://www.ft.com/__assets/creatives/brand-ft/icons/v3/open-graph.png	Financial Times	Trump asked Putin to White House during Skripal storm
595	\N	http://ew.com/tv/2018/04/02/imposters-season-2-30-seconds/	Samantha Highfill		2018-04-02T16:46:51Z	https://ewedit.files.wordpress.com/2018/04/imposters.jpg?crop=0px%2C0px%2C2700px%2C1419px&resize=1200%2C630	Entertainment Weekly	The <em>Imposters</em> cast describes season 1 in 30 seconds
602	\N	https://www.theguardian.com/world/2018/apr/02/winnie-madikizela-mandela-obituary	David Beresford, Dan van der Vat	South African activist, ANC politician and wife of Nelson Mandela whose reputation became mired in allegations of murder and fraud	2018-04-02T16:38:00+00:00	https://i.guim.co.uk/img/media/5f475f7164166681098c8abc55f02ee20e4e0248/709_409_1635_981/master/1635.jpg?w=1200&h=630&q=55&auto=format&usm=12&fit=crop&crop=faces%2Centropy&bm=normal&ba=bottom%2Cleft&blend64=aHR0cHM6Ly91cGxvYWRzLmd1aW0uY28udWsvMjAxOC8wMS8zMS9mYWNlYm9va19kZWZhdWx0LnBuZw&s=85e266fa0bdeea00a8db4ed872116b2f	Google News (UK)	Winnie Madikizela-Mandela obituary
611	\N	http://www.msnbc.com/velshi-ruhle/watch/oklahoma-teachers-protest-for-more-support-from-the-state-1200374339891	MSNBC	Oklahoma teachers protest for more funding and an increase in wages. Protests such as this have been happening in states across the country.	2018-04-02T16:30:16.4267997Z	https://media1.s-nbcnews.com/j/MSNBC/Components/Video/201804/n_vr_brk_OklahomaTeacher_180402_1920x1080.1200;630;7;70;5.jpg	MSNBC	Oklahoma teachers protest for more support from the state
617	\N	http://www.msnbc.com/andrea-mitchell-reports/watch/trump-and-putin-discussed-white-house-as-possible-meeting-venue-sanders-confirms-1200421443825	MSNBC	White House Press Secretary Sarah Huckabee Sanders issued a statement after an aide to Russian president Vladimir Putin commented on the yet-to-be-announced meeting. NBC’s Peter Alexander reports.	2018-04-02T16:30:14.1856702Z	https://media1.s-nbcnews.com/j/MSNBC/Components/Video/201804/n_mitchell_brk_alexander_putin_180402_1920x1080.1200;630;7;70;5.jpg	MSNBC	Trump and Putin discussed White House as possible meeting venue, Sanders confirms
618	\N	https://techcrunch.com/2018/04/02/wtf-are-cdrs/	Danny Crichton	Over the past few days, the Chinese government announced the potential creation of a new trillion dollar investment market, and it isn’t an April Fools joke. China’s tech giants like Alibaba and Tencent are some of the most valuable in the world, and upcoming…	2018-04-02T16:26:51Z	https://techcrunch.com/wp-content/uploads/2018/04/gettyimages-483218056.jpg?w=600	TechCrunch	WTF are CDRs? (other than a potential trillion dollar market)
629	\N	https://www.mirror.co.uk/news/us-news/outrage-primary-school-age-pupils-12291758	Dave Burke	The school in Atlanta, US, has been forced to apologise after the performance	2018-04-02T16:18:59Z	https://i2-prod.mirror.co.uk/incoming/article12291898.ece/ALTERNATES/s1200/Outrage-after-shocking-after-primary-school-age-pupils-hold-up-BLACKFACE-masks-during-school-play.jpg	Mirror	Outrage as primary school-age pupils hold up blackface masks during performance
944	\N	https://arstechnica.com/tech-policy/2018/04/charters-claim-that-union-sabotaged-cable-network-gets-tossed-from-court/	Jon Brodkin	Charter lawsuit against union dismissed by judge as strike enters second year.	2018-04-02T17:20:56+00:00	https://cdn.arstechnica.net/wp-content/uploads/2017/10/fiber-cable-760x380.jpg	Ars Technica	Charter’s claim that union sabotaged cable network gets tossed from court
838	\N	https://www.usatoday.com/story/money/2018/04/02/dow-drops/478304002/?utm_source=google&utm_medium=amp&utm_campaign=speakable	null	Dow suffers big decline as tech stock selloff and trade war fears spook Wall Street. China announces tariffs on U.S. goods and President Trump goes after Amazon via Twitter. Uncertainty hurts market.	2018-04-02T16:59:32+00:00	https://www.gannett-cdn.com/-mm-/fc6c4ade4c8230beb5a8d47a20ed0e0f97ff56ea/c=0-293-5760-3547&r=x1683&c=3200x1680/local/-/media/2018/04/02/USATODAY/USATODAY/636582692739212909-STOCKSAPRIL2ND.JPG	USA Today	Stocks in selloff mode as trade, tech worries drag prices down
861	\N	http://www.bloomberg.com/news/articles/2018-04-02/goldman-sachs-sees-equity-volatility-spillover-urges-hedging	Lu Wang	Equity volatility is elevated but options trading shows investors’ appetite for protection hasn’t picked up, indicating hedging is needed, according to Goldman Sachs Group Inc.	2018-04-02T16:39:25Z	https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i0P4dmP0t6L4/v0/1200x801.jpg	Bloomberg	Goldman Sachs Sees Equity Volatility Spillover, Urges Hedging
825	\N	https://www.nbcnews.com/news/us-news/oklahoma-kentucky-public-schools-close-thousands-teachers-strike-n861946	Kalhan Rosenblatt, The Associated Press	Thousands of Oklahoma and Kentucky teachers descended on their state capitals on Monday to demand lawmakers approve more education funding and higher wages.	2018-04-02T17:03:15+00:00	https://media4.s-nbcnews.com/j/newscms/2018_14/2384836/180402-kentucky-teachers-strike-capitol-njs-1256_a78c8c23d4e78113bd6f4551d67c251c.1200;630;7;70;5.jpg	Google News	Oklahoma, Kentucky public schools close as thousands of teachers strike
583	\N	https://www.ft.com/content/6c6c730e-3298-11e8-ac48-10c6fdc22f03	null	null	2018-04-02T16:52:54.4565252Z	https://www.ft.com/__assets/creatives/brand-ft/icons/v3/open-graph.png	Financial Times	Information economy threatens traditional companies
589	\N	https://www.ft.com/content/3285c3de-3324-11e8-b5bf-23cb17fd1498	null	null	2018-04-02T16:52:52.9090369Z	https://www.ft.com/__assets/creatives/brand-ft/icons/v3/open-graph.png	Financial Times	Self-driving technology adds pressure on carmakers
593	\N	http://www.economist.com/blogs/democracyinamerica/2018/04/doctor-s-oath	The Economist	The governor’s plan may yet be scuppered by warring Republicans	2018-04-02T16:49:48Z	https://cdn.static-economist.com/sites/default/files/20180324_USP508.jpg	The Economist	Ralph Northam pushes for Medicaid expansion in Virginia
607	\N	http://thehill.com/homenews/house/381269-esty-seeks-ethics-investigation-into-her-own-conduct	Mike Lillis	Rep. Elizabeth Esty (D-Conn.) on Monday took the remarkable step of requesting an official ethics investigation into her own conduct.	2018-04-02T16:31:24Z	http://thehill.com/sites/default/files/article_images/estyelizabeth_100716getty.jpg	The Hill	Esty seeks Ethics investigation into her own conduct
615	\N	https://www.buzzfeed.com/tolanishoneye/the-hardest-game-of-would-you-rather-for-any-woman	Tolani Shoneye	Itchy pubes or a crumb filled bra.	2018-04-02T16:31:03Z	https://img.buzzfeed.com/buzzfeed-static/static/2018-03/29/10/enhanced/buzzfeed-prod-web-08/original-8811-1522332654-7.jpg?crop=1732:907;0,403	Buzzfeed	"Would You Rather" Questions That Will Make Any Woman Think Long And Hard
616	\N	https://www.washingtonpost.com/world/national-security/trump-again-criticizes-justice-dept-calls-response-to-congressional-requests-embarrassment-to-our-country/2018/04/02/14e2680c-3683-11e8-9c0a-85d477d9a226_story.html	Matt Zapotosky, Matt Zapotosky	The president has frequently taken aim at the department and his handpicked attorney general, Jeff Sessions.	2018-04-02T16:27:00Z	https://www.washingtonpost.com/rf/image_1484w/2010-2019/WashingtonPost/2018/04/02/National-Security/Images/2018-04-02T150303Z_349927566_HP1EE4215T2PL_RTRMADP_3_RELIGION-EASTER-USA-WHITEHOUSE.jpg?t=20170517	The Washington Post	Trump again criticizes Justice Dept., calls response to congressional requests ‘embarrassment to our country!’
623	\N	http://www.ign.com/articles/2018/04/02/fortnite-mobile-is-now-available-to-the-public-on-ios	Alex Gilyadov	Prior to today, players needed an invitation or a special link to play Battle Royale.	2018-04-02T16:22:56Z	http://assets1.ignimgs.com/2017/09/12/fortnite-1280-1505174977571_1280w.jpg	IGN	Fortnite Mobile is Now Available to the Public on iOS - IGN
626	\N	http://www.bbc.co.uk/sport/horse-racing/43620723	BBC Sport	General Principle wins the Irish Grand National at Fairyhouse as trainer Gordon Elliott claims a first victory in the race.	2018-04-02T16:21:42Z	https://ichef.bbci.co.uk/onesport/cps/624/cpsprodpb/13590/production/_97584297_breaking_news.png	BBC Sport	Irish Grand National: General Principle wins in first victory for Gordon Elliott
631	\N	https://www.theguardian.com/environment/2018/apr/02/underwater-melting-of-antarctic-ice-far-greater-than-thought-study-finds	Jonathan Watts	The base of the ice around the south pole shrank by an area the size of Greater London between 2010 and 2016	2018-04-02T16:18:33Z	https://i.guim.co.uk/img/media/a77c349ba4a6b9bc877c8a101578e13dfc4b5013/0_102_3000_1801/master/3000.jpg?w=1200&h=630&q=55&auto=format&usm=12&fit=crop&crop=faces%2Centropy&bm=normal&ba=bottom%2Cleft&blend64=aHR0cHM6Ly91cGxvYWRzLmd1aW0uY28udWsvMjAxOC8wMS8zMS9mYWNlYm9va19kZWZhdWx0LnBuZw&s=1b338d1de5d74a26f1dfeb80034bbae6	The Guardian (AU)	Underwater melting of Antarctic ice far greater than thought, study finds
829	\N	https://www.theguardian.com/uk-news/2018/apr/02/northern-ireland-six-men-appear-court-irish-dissident-republican-parade-lurgan	Henry McDonald	Molotov cocktails thrown at police vehicles, after six men face court over separate parade	2018-04-02T17:06:24Z	https://i.guim.co.uk/img/media/c4b9ff0f4dff3fbd3ef4b4f003d4f26b538cc11f/61_145_3386_2032/master/3386.jpg?w=1200&h=630&q=55&auto=format&usm=12&fit=crop&crop=faces%2Centropy&bm=normal&ba=bottom%2Cleft&blend64=aHR0cHM6Ly91cGxvYWRzLmd1aW0uY28udWsvMjAxOC8wMS8zMS9mYWNlYm9va19kZWZhdWx0LnBuZw&s=9ffaa8300811e9d5909394469a711308	The Guardian (UK)	Police attacked during dissident republican parade in Derry
576	\N	https://www.nationalgeographic.com/travel/destinations/asia/israel/masada-unesco-world-heritage-site.html	Abby Sewell	This remote palace complex of Masada looks as dramatic as the stories behind it.	2018-04-02T17:00:14.1211768Z	https://www.nationalgeographic.com/content/dam/travel/rights-exempt/masada-unesco/masada-unesco.jpg	National Geographic	Soar Over a Legendary Fortress in the Judean Desert
591	\N	https://www.ft.com/content/0e668624-3684-11e8-8eee-e06bde01c544	null	Tech-heavy index approaches correction territory as it falls 9.5% since March peak	2018-04-02T16:52:39.5992434Z	https://www.ft.com/__origami/service/image/v2/images/raw/http%3A%2F%2Fprod-upp-image-read.ft.com%2F2f8472ac-1b50-11e8-a748-5da7d696ccab?source=next-opengraph&fit=scale-down&width=900	Financial Times	Nasdaq falls sharply as Amazon and Tesla weigh on shares
603	\N	https://github.com/SINTEF-9012/grindr-privacy-leaks	SINTEF-9012	grindr-privacy-leaks - Report and raw data about privacy leaks in Grindr.	2018-04-02T16:37:40.1098382Z	https://avatars1.githubusercontent.com/u/2069861?s=400&v=4	Hacker News	SINTEF-9012/grindr-privacy-leaks
101	\N	https://www.washingtonpost.com/business/economy/fresh-shockwaves-hit-us-markets-after-trump-tweets-china-steps-up-trade-war/2018/04/02/1f3beebe-3678-11e8-9c0a-85d477d9a226_story.html	Thomas Heath, Thomas Heath	The Dow sheds 500 points in early trading after tech company troubles and Beijing’s tariffs on 128 U.S. products	2018-04-02T17:20:00Z	https://www.washingtonpost.com/rf/image_1484w/2010-2019/WashingtonPost/2018/04/02/National-Economy/Images/Financial_Markets_Wall_Street_91334.jpg-3cea8.jpg?t=20170517	The Washington Post	Fresh shockwaves hit U.S. markets after Trump tweets, China steps up trade war
619	\N	https://www.axios.com/dow-plunges-nearly-500-points-amazon-trump-fbbae4de-98eb-4b82-a257-d923f93c57c2.html?utm_source=sidebar	Michael Sykes	The drop comes after the president attacked Amazon on Twitter.	2018-04-02T16:30:05.2800884Z	https://images.axios.com/VeIakJuePUl1RhR9sNQxo5v_qA8=/0x58:3000x1746/1920x1080/2018/04/02/1522685422182.jpg	Axios	Dow plunges 500 points as Amazon tumbles
632	\N	http://www.newsweek.com/amazon-bernie-sanders-donald-trump-us-postal-service-868445	Joe Difazio	Amazon has some critical politicians eyeing the business in Washington D.C.	2018-04-02T16:21:18Z	http://s.newsweek.com/sites/www.newsweek.com/files/styles/full/public/2018/04/02/gettyimages-857521768.jpg	Newsweek	Bernie Sanders and Trump agree: Amazon has too much power
833	\N	https://www.nhl.com/news/daniel-and-henrik-sedin-to-retire-from-nhl-after-18-seasons-with-vancouver-canucks/c-297575404	NHL.com	Daniel Sedin and Henrik Sedin of the Vancouver Canucks announced Monday they will retire from the NHL at the end of the 2017-18 regular season.	2018-04-02T17:02:16Z	https://nhl.bamcontent.com/images/photos/297575574/1024x576/cut.jpg	NHL News	Sedins to retire from NHL after 18 seasons with Canucks
986	\N	http://www.newsweek.com/oklahoma-state-capitol-regan-killackey-teachers-protest-class-ap-english-868623	Benjamin Fearnow	"This is a symbolic way for the students to participate in their actual education."	2018-04-02T16:47:57Z	http://s.newsweek.com/sites/www.newsweek.com/files/styles/full/public/2018/04/02/screen-shot-2018-04-02-12_0.png	Newsweek	An AP English teacher is hosting classes on the lawn of the Oklahoma State Capitol building amid protests
880	\N	https://gfycat.com/RipeFrailHydatidtapeworm	GFYCAT	Watch signature machine GIF by pmmesteamk3ys on Gfycat. Discover more GIFS online at Gfycat.	2018-04-02T17:23:29.6565785Z	https://thumbs.gfycat.com/RipeFrailHydatidtapeworm-size_restricted.gif	Reddit /r/all	signature machine - Create, Discover and Share GIFs on Gfycat
894	\N	https://apnews.com/82b205a0b2da4a2a904fdbb7b92b4e07	DARLENE SUPERVILLE	WASHINGTON (AP) — President Donald Trump helped kick off the White House Easter Egg Roll on Monday with a "ready," 'set" and the blow of a whistle. "You ready kids?" the president said before he and first lady Melania Trump blew whistles to launch a group of…	2018-04-02T17:09:42Z	https://storage.googleapis.com/afs-prod/media/media:0c9a405cebd24477a691b5fcf46cada1/3000.jpeg	Associated Press	With the blow of a whistle, Trump kicks off Easter Egg Roll
891	\N	https://www.cnbc.com/2018/04/02/bitcoin-climbs-back-above-7000-even-as-stocks-fall.html	Kate Rooney	Bitcoin prices recovered above $7,000 to start the second quarter Monday, following a week where the cryptocurrency shed more than 25 percent of its value.	2018-04-02T17:10:31Z	https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2017/12/11/104891350-RTR3KH14.1910x1000.jpg	CNBC	Bitcoin climbs back above $7,000 even as stocks fall
909	\N	http://www.newsweek.com/space-station-tiangong-1-crash-down-garbage-threatening-earth-868569	Elana Glowatz	Tiangong-1 crashed on Earth, but there’s plenty more dangerous objects in our atmosphere.	2018-04-02T16:58:47Z	http://s.newsweek.com/sites/www.newsweek.com/files/styles/full/public/2018/04/02/spacex-debris.JPG	Newsweek	If you thought the Chinese space station’s crashdown was exciting, there’s more where that came from
883	\N	https://www.nextbigfuture.com/tag/asia	brian wang	null	2018-04-02T17:22:27.4848435Z	null	Next Big Future	asia
907	\N	https://www.wired.com/story/google-bans-all-cryptomining-extensions-from-the-chrome-store/	Lily Hay Newman	As cryptojacking takes over the web, Google will put a stop to cryptomining extensions that prey on unsuspecting installers.	2018-04-02T16:59:55Z	https://media.wired.com/photos/5ac242ed624d1d6458b78929/191:100/pass/Cryptomining-902260434.jpg	Wired	Google Bans All Cryptomining Extensions From the Chrome Store
888	\N	https://www.nytimes.com/2018/04/02/world/europe/trump-putin-white-house-meeting.html	Andrew Higgins	But the offer, supposedly issued in a March 20 telephone call, may be less than solid, especially as relations have spiraled downward since.	2018-04-02T17:14:31Z	https://static01.nyt.com/images/2018/04/03/world/03putin1/03putin1-facebookJumbo.jpg	The New York Times	Trump Suggested Putin Visit the White House, Officials Say
889	\N	https://www.nytimes.com/2018/04/02/us/teacher-strikes-oklahoma-kentucky.html	Dana Goldstein	Thousands walked off the job Monday, part of a wave of strikes in red states that has been organized largely by ordinary teachers.	2018-04-02T17:14:41Z	https://static01.nyt.com/images/2018/04/03/us/03teachers-01ALT/03teachers-01ALT-facebookJumbo.jpg	The New York Times	‘It Really Is a Wildfire’: Teachers Go on Strike in Oklahoma and Kentucky
932	\N	http://www.newsweek.com/emma-gonzalez-conspiracy-theory-explained-debunked-parkland-florida-shooting-868497	Gillian Edevane	No, Emma González did not proudly admit to bullying the Florida school shooter.	2018-04-02T16:42:00Z	http://s.newsweek.com/sites/www.newsweek.com/files/styles/full/public/2018/04/02/emma-gonzalez.jpg	Newsweek	Yet another conspiracy theory is floating around about Parkland survivor Emma González. Here it is, debunked
930	\N	https://www.nytimes.com/2018/04/02/business/dealbook/tesla-elon-musk.html		Tesla’s shares were once again sliding on Monday after Elon Musk joked on April 1 that Tesla had gone bankrupt.	2018-04-02T16:45:00+00:00	https://static01.nyt.com/images/2018/04/01/business/03db-newsletter-tesla/merlin_120749369_bd69abe8-7ba7-49b4-8083-f689a5939d9f-facebookJumbo.jpg	Google News	Musk’s Jokes Aside, Tesla’s Tumult Continues: DealBook Briefing
893	\N	http://fortune.com/2018/04/02/stella-artois-recalls-beer-glass-shards-bottles/	null		2018-04-02T17:14:23Z	https://fortunedotcom.files.wordpress.com/2017/01/stella-artois-gettyimages-607427722.jpg	Fortune	Stella Artois Recalls Beer Due to Risk of Glass Shards in the Bottles
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: rachelpoulos
--

COPY public.ratings (ratingid, userid, articleid, fair, unfair, newsworthy, not_newsworthy) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rachelpoulos
--

COPY public.users (username, password, userid, leaning, email) FROM stdin;
\.


--
-- Name: articles_articleid_seq; Type: SEQUENCE SET; Schema: public; Owner: rachelpoulos
--

SELECT pg_catalog.setval('public.articles_articleid_seq', 1099, true);


--
-- Name: ratings_ratingid_seq; Type: SEQUENCE SET; Schema: public; Owner: rachelpoulos
--

SELECT pg_catalog.setval('public.ratings_ratingid_seq', 1, false);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: rachelpoulos
--

SELECT pg_catalog.setval('public.users_userid_seq', 1, false);


--
-- Name: articles articles_url_key; Type: CONSTRAINT; Schema: public; Owner: rachelpoulos
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_url_key UNIQUE (url);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: rachelpoulos
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (ratingid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rachelpoulos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: rachelpoulos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

