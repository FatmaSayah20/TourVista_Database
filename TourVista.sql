--CREATE--
create database Tour_Vista;

use Tour_Vista;
--Hotel
create table Hotel(
	Hotel_Name varchar(40)  not null ,
	tel varchar(20) not null ,
);
alter table Hotel add constraint Hotel_pk primary key(Hotel_Name);
--drop table Hotel;

--Hotel_Price
create table Hotel_Price(
	price int,
	Hotel_Name varchar(40) ,
	constraint Hotel_price_fk foreign key (Hotel_Name)references Hotel(Hotel_Name)
);
--drop table Hotel_Price;

--Events_Festivals
create table Events_Festivals(
	Events_time time not null ,
	Events_date date not null ,
	Area varchar(40) not null ,
	Street varchar(40) not null ,
	Events_Type varchar(40) not null ,
	Hotel_Name varchar(40) not null,
	constraint Events_Festivals_pk primary key(Events_time,Events_date) ,
	constraint Events_Festivals_fk foreign key (Hotel_Name)references Hotel(Hotel_Name)
);
--drop table Events_Festivals;

--Administrators
create table Administrators (
	administrator_number int not null,
	administrator_name varchar(20) not null,
	position varchar(20) ,
	telephone varchar(20) unique not null,
	constraint administrator_pk primary key(administrator_number)
);
--drop table Administrators;

--TravelAgent
create table TravelAgent(
	TravelAgent_id int not null,
	TravelAgent_name varchar(40) not null ,
	Tel varchar(20) not null,
	TravelAgent_Address varchar(40) ,
	constraint TravelAgent_pk primary key(TravelAgent_id)
);
--drop table TravelAgent;

--Services_
create table Services_(
	service_number int not null ,
	shops varchar(40) ,
	restaurants varchar(40) ,
	cinema varchar(40) ,
	administrator_number int,
	TravelAgent_id int,
	constraint service_pk primary key(service_number),
	constraint Services_FK foreign key (administrator_number)
	references Administrators(administrator_number) ,
	constraint TravelAgent_fk foreign key (TravelAgent_id)references TravelAgent(TravelAgent_id)
);
--drop table Services_;

--Tours
create table Tours(
Code_tour int identity ,
Path varchar(100),
Pick_up date,
Arrive date,
primary key(Code_tour)
);
--drop table Tours;

--Tour_Services
create table Tour_Services(
	service_number int ,
	Code_tour int   ,
	constraint Tour_Services_pk primary key(service_number,Code_tour) ,
	constraint Tour_Services_fk foreign key (service_number)references Services_(service_number),
	constraint Tours_fk foreign key (Code_tour)references Tours(Code_tour)
);
--drop table Tour_Services;


--National_place
create table National_place(
Name varchar(100) not null,
Loc varchar(100) not null,
Type varchar(50),
History varchar(100),
primary key(Name,Loc)
);
--drop table National_place;

--NationalPlace_Tour
CREATE TABLE NationalPlace_Tour (
    NationalPlace_Name VARCHAR(100) NOT NULL,
    NationalPlace_Loc VARCHAR(100) NOT NULL,
    Tour_Code INT,
    PRIMARY KEY (NationalPlace_Name, NationalPlace_Loc, Tour_Code),
    FOREIGN KEY (NationalPlace_Name, NationalPlace_Loc) REFERENCES National_place(Name, Loc),
    FOREIGN KEY (Tour_Code) REFERENCES Tours(Code_tour)
);
--drop table Nationalplace_Tour;

--Booking
create table Booking(
	Booking_id int  not null ,
	Arrival_Airport_name varchar(40) ,
	Arrival_Date date not null ,
	Book_type varchar (15) ,
	Price int not null ,
	constraint Booking_pk primary key(Booking_id)
);
--drop table Booking;

--Tourist
create table Tourist(
	F_Name varchar(15) not null ,
	L_Name varchar(15) not null ,
	Tourist_id int,
	Tell varchar(15) unique ,
	Nationality varchar(15) ,
	Hotel_Name varchar(40) ,
	TravelAgent_id int , 
	Booking_id int ,
	constraint Tourist_pk primary key(Tourist_id),
);
alter table Tourist add constraint Hotel_tourist_fk foreign key (Hotel_Name)references Hotel(Hotel_Name);
alter table Tourist add constraint TravelAgent_tourist_fk foreign key (TravelAgent_id)references TravelAgent(TravelAgent_id);
alter table Tourist add constraint Booking_tourist_fk foreign key (Booking_id)references Booking(Booking_id);
--drop table Tourist;

--NationalPlace_Tourist
create table NationalPlace_Tourist (
    Nationalplace_name varchar(100) NOT NULL,
    Nationalplac_Loc varchar(100) NOT NULL,
    Tourist_id int,
    constraint NationalPlace_Tourist_pk primary key(Nationalplace_name,Nationalplac_Loc,Tourist_id) ,
    constraint NationalPlace_tourist_fk foreign key (Nationalplace_name, Nationalplac_Loc)references National_place(Name,Loc),
    constraint Tourist_fk foreign key (Tourist_id) references Tourist(Tourist_id)
);
--drop table NationalPlace_Tourist;

--companion
create table Companion(
	F_Name varchar(15) not null ,
	L_Name varchar(15) not null ,
	Companion_id int ,
	Nationality varchar(15) ,
	Relation varchar(15) not null ,
	Tourist_id int  not null references Tourist(Tourist_id) on delete cascade on update cascade,
	constraint Companion_pk primary key(Companion_id,Tourist_id)
);
--drop table companion;


--------------------------------------------------------------------------
--INSERT--

--insert Hotel
INSERT INTO Hotel (Hotel_Name, tel) 
            VALUES  ('Luxury Inn', '555-123-4567'),
					('Royal Plaza', '777-555-8888'),
					('Sunset Resort', '222-444-6666'),
					('Golden Sands Hotel', '999-888-7777'),
					('Harbor View Suites', '333-222-1111'),
					('City Lights Hotel', '777-999-3333'),
					('Mountain Retreat Lodge', '444-555-6666'),
					('Seaside Haven', '111-222-3333'),
					('Majestic Gardens Resort', '666-777-8888'),
					('Tranquil Oasis Inn', '888-444-5555'),
					('Palm Breeze Resort', '222-111-9999'),
					('Elegant Towers Hotel', '444-888-6666'),
					('Whispering Pines Lodge', '777-333-5555'),
					('Emerald Springs Hotel', '555-111-2222'),
					('Silver Moon Inn', '999-666-3333'),
					('Oceanfront Paradise', '111-555-8888'),
					('Serenity Suites', '777-222-3333'),
					('Regal Heights Hotel', '333-666-9999'),
					('Enchanted Castle Resort', '555-777-2222'),
					('Cypress Valley Lodge', '888-111-9999'),
					('Crown Plaza Hotel', '333-444-5555'),
					('Grand Orchid Resort', '666-222-8888'),
					('Sunrise Heights Inn', '222-777-4444'),
					('Blue Horizon Hotel', '999-444-1111'),
					('Golden Gate Inn', '111-555-9999'),
					('Harmony Haven Resort', '333-777-2222'),
					('Evergreen Gardens Hotel', '555-888-6666'),
					('Pearl Harbor Suites', '777-333-1111'),
					('Moonlight Bay Resort', '888-222-4444');

--insert Hotel_Price
INSERT INTO Hotel_Price(Hotel_Name, price) VALUES
					('Luxury Inn', 200),
					('Royal Plaza', 150),
					('Sunset Resort', 180),
					('Royal Plaza', 200),
					('Sunset Resort', 170),
					('Golden Sands Hotel', 250),
					('Harbor View Suites', 120),
					('City Lights Hotel', 160),
					('Mountain Retreat Lodge', 200),
					('Seaside Haven', 130),
					('Majestic Gardens Resort', 220),
					('Tranquil Oasis Inn', 210),
					('Palm Breeze Resort', 170),
					('Elegant Towers Hotel', 190),
					('Luxury Inn', 240),
					('Royal Plaza', 250),
					('Sunset Resort', 150),
					('Royal Plaza', 230),
					('Sunset Resort', 100),
					('Golden Sands Hotel', 200),
					('Harbor View Suites', 180),
					('City Lights Hotel', 190),
					('Mountain Retreat Lodge', 100),
					('Seaside Haven', 190),
					('Majestic Gardens Resort', 200),
					('Tranquil Oasis Inn', 100),
					('Palm Breeze Resort', 120),
					('Elegant Towers Hotel', 220),
					('Whispering Pines Lodge', 150),
					('Emerald Springs Hotel', 180),
					('Silver Moon Inn', 160),
					('Oceanfront Paradise', 140),
					('Serenity Suites', 230),
					('Regal Heights Hotel', 170),
					('Enchanted Castle Resort', 220),
					('Silver Moon Inn', 200),
					('Oceanfront Paradise', 180),
					('Serenity Suites', 200),
					('Regal Heights Hotel', 140),
					('Enchanted Castle Resort', 200),
					('Cypress Valley Lodge', 120),
					('Crown Plaza Hotel', 170),
					('Grand Orchid Resort', 200),
					('Sunrise Heights Inn', 190),
					('Blue Horizon Hotel', 140),
					('Golden Gate Inn', 220),
					('Harmony Haven Resort', 130),
					('Evergreen Gardens Hotel', 240),
					('Grand Orchid Resort', 250),
					('Sunrise Heights Inn', 150),
					('Blue Horizon Hotel', 200),
					('Golden Gate Inn', 200),
					('Sunrise Heights Inn', 230),
					('Blue Horizon Hotel', 180),
					('Golden Gate Inn', 200),
					('Harmony Haven Resort', 230),
					('Evergreen Gardens Hotel', 200),
					('Grand Orchid Resort', 200),
					('Sunrise Heights Inn', 220),
					('Blue Horizon Hotel', 100),
					('Golden Gate Inn', 120),
					('Grand Orchid Resort', 150),
					('Sunrise Heights Inn', 120),
					('Blue Horizon Hotel', 230),
					('Golden Gate Inn', 200),
					('Harmony Haven Resort', 180),
					('Evergreen Gardens Hotel', 220),
					('Pearl Harbor Suites', 110),
					('Moonlight Bay Resort', 170);

--insert Events_Festivals
INSERT INTO Events_Festivals (Events_time, Events_date, Area, Street, Events_Type, Hotel_Name)
VALUES
('18:00', '2023-12-15', 'Downtown', 'Main Street', 'Concert', 'Luxury Inn'),
('20:30', '2023-12-20', 'Waterfront', 'Harbor Avenue', 'Festival', 'Royal Plaza'),
('19:45', '2023-12-25', 'City Center', 'Broadway Street', 'Exhibition', 'Sunset Resort'),
('17:15', '2023-12-28', 'Beachfront', 'Seaside Boulevard', 'Carnival', 'Golden Sands Hotel'),
('21:00', '2024-01-05', 'Mountain View', 'Summit Road', 'Fireworks', 'Harbor View Suites'),
('19:30', '2024-01-10', 'Urban District', 'Skyline Drive', 'Art Show', 'City Lights Hotel'),
('18:45', '2024-01-15', 'Nature Reserve', 'Tranquil Path', 'Nature Walk', 'Mountain Retreat Lodge'),
('22:00', '2024-01-20', 'Seaside', 'Oceanfront Drive', 'Beach Party', 'Seaside Haven'),
('20:15', '2024-01-25', 'Garden District', 'Blossom Lane', 'Flower Festival', 'Majestic Gardens Resort'),
('19:00', '2024-02-01', 'Oasis Zone', 'Serenity Street', 'Wellness Retreat', 'Tranquil Oasis Inn'),
('17:30', '2024-02-05', 'City Lights', 'Skyscraper Avenue', 'Light Show', 'Palm Breeze Resort'),
('21:45', '2024-02-10', 'Countryside', 'Meadow Lane', 'Country Fair', 'Elegant Towers Hotel'),
('18:15', '2024-02-15', 'Enchanted Forest', 'Fairy Tale Road', 'Fantasy Parade', 'Whispering Pines Lodge'),
('20:00', '2024-02-20', 'Spring Valley', 'Blossom Street', 'Spring Festival', 'Emerald Springs Hotel'),
('19:30', '2024-02-25', 'Silver Lake', 'Moonlit Path', 'Moonlight Ball', 'Silver Moon Inn'),
('18:45', '2024-03-01', 'Oceanfront', 'Waves Avenue', 'Surfing Competition', 'Oceanfront Paradise'),
('22:30', '2024-03-05', 'Serenity Bay', 'Tranquil Pier', 'Sailing Regatta', 'Serenity Suites'),
('20:15', '2024-03-10', 'Regal District', 'Kingdom Street', 'Medieval Fair', 'Regal Heights Hotel'),
('19:00', '2024-03-15', 'Castle Grounds', 'Castle Road', 'Royal Gala', 'Enchanted Castle Resort'),
('17:45', '2024-03-20', 'Valley View', 'Vista Lane', 'Scenic Tour', 'Cypress Valley Lodge'),
('21:30', '2024-03-25', 'Downtown Plaza', 'Metro Avenue', 'Fashion Show', 'Crown Plaza Hotel'),
('19:15', '2024-04-01', 'Botanical Gardens', 'Blossom Walk', 'Botanical Exhibition', 'Grand Orchid Resort'),
('18:30', '2024-04-05', 'Sunrise Heights', 'Morning Avenue', 'Sunrise Yoga', 'Sunrise Heights Inn'),
('20:45', '2024-04-10', 'Blue Horizon', 'Horizon Drive', 'Stargazing Night', 'Blue Horizon Hotel'),
('19:30', '2024-04-15', 'Golden Gate', 'Gate Street', 'Gate Opening Ceremony', 'Golden Gate Inn'),
('17:45', '2024-04-20', 'Harmony Haven', 'Harmony Street', 'Music Festival', 'Harmony Haven Resort'),
('22:15', '2024-04-25', 'Evergreen Park', 'Evergreen Lane', 'Nature Exploration', 'Evergreen Gardens Hotel'),
('20:00', '2024-05-01', 'Pearl Harbor', 'Pearl Avenue', 'Historical Exhibition', 'Pearl Harbor Suites'),
('18:30', '2024-05-05', 'Moonlight Bay', 'Moonlit Drive', 'Moonlit Dance', 'Moonlight Bay Resort');

--insert Administrator
INSERT INTO Administrators (administrator_number, administrator_name, position, telephone) VALUES
					(6001, 'John Doe', 'Manager', '555-133-4567'),
					(6002, 'Alice Smith', 'Supervisor', '777-555-8888'),
					(6003, 'Mohammed Ali', 'Coordinator', '222-444-6666'),
					(6004, 'Maria Garcia', 'Director', '999-888-7777'),
					(6005, 'Chen Li', 'Team Lead', '333-222-1111'),
					(6006, 'Aya Sato', 'Assistant Manager', '777-999-3333'),
					(6007, 'Luca Rossi', 'Senior Analyst', '444-555-6666'),
					(6008, 'Isabella Moreno', 'Project Manager', '111-222-3333'),
					(6009, 'Raj Patel', 'Supervisor', '666-777-8888'),
					(6010, 'Elena Kovac', 'Coordinator', '888-444-5555'),
					(6011, 'Mikhail Ivanov', 'Manager', '222-111-9999'),
					(6012, 'Sophie Lefevre', 'Team Lead', '444-888-6666'),
					(6013, 'Carlos Gomez', 'Director', '777-333-5555'),
					(6014, 'Yuki Tanaka', 'Assistant Manager', '555-111-2222'),
					(6015, 'Mateo Fernandez', 'Senior Analyst', '999-666-3333'),
					(6016, 'Olga Kuznetsova', 'Project Manager', '111-555-8888'),
					(6017, 'Liam OConnor', 'Supervisor', '777-222-3333'),
					(6018, 'Sofia Andrade', 'Coordinator', '333-666-9999'),
					(6019, 'Hassan Al-Farsi', 'Manager', '555-777-2222'),
					(6020, 'Lucia Gutierrez', 'Team Lead', '888-111-9999'),
					(6021, 'Emily Wang', 'Senior Analyst', '333-444-5555'),
					(6022, 'Alessio Marini', 'Project Manager', '666-222-8888'),
					(6023, 'Yui Suzuki', 'Supervisor', '222-777-4444'),
					(6024, 'Rashid Al-Maktoum', 'Coordinator', '999-444-1111'),
					(6025, 'Sophia Petrova', 'Manager', '111-555-9999'),
					(6026, 'Rafael Gonzalez', 'Team Lead', '333-777-2222'),
					(6027, 'Anya Ivanova', 'Director', '555-888-6666'),
					(6028, 'Marco Moretti', 'Assistant Manager', '777-333-1111'),
					(6029, 'Fatemeh Rahmani', 'Senior Analyst', '888-222-4444'),
					(6030, 'James Johnson', 'Project Manager', '555-123-4567');
--insert TravelAgent
INSERT INTO TravelAgent (TravelAgent_id, TravelAgent_name, Tel, TravelAgent_Address) VALUES

			(2079, 'Voyage Explorers', '555-123-4567', '123 Adventure Avenue, Cityville'),
			(2078, 'Skyward Travels', '777-555-8888', '456 Skyline Street, Horizon City'),
			(2077, 'Global Getaways', '222-444-6666', '789 Wanderlust Lane, Tourist Town'),
			(2076, 'Sunset Tours', '999-888-7777', '101 Sunset Boulevard, Seaview'),
			(2075, 'City Escape Travel', '333-222-1111', '234 Downtown Drive, Metropolis'),
			(2074, 'Eco Expeditions', '777-999-3333', '567 Nature Trail, Green Valley'),
			(2073, 'Urban Retreats', '444-555-6666', '890 Urban Avenue, Metro City'),
			(2072, 'Adventure Awaits', '111-222-3333', '123 Thrill Street, Excitement Town'),
			(2071, 'Dream Destinations', '666-777-8888', '456 Fantasy Lane, Dreamland'),
			(2070, 'Discover Delights', '888-444-5555', '789 Discovery Road, Wonder City'),
			(2069, 'Hidden Gems Travel', '222-111-9999', '101 Gemstone Lane, Treasure Town'),
			(2068, 'Cultural Connections', '444-888-6666', '234 Heritage Street, Traditionville'),
			(2067, 'Timeless Journeys', '777-333-5555', '567 Historic Road, Nostalgia City'),
			(2066, 'Skyline Adventures', '555-111-2222', '890 Horizon Highway, Panorama'),
			(2065, 'Serenity Tours', '999-666-3333', '123 Peaceful Path, Harmony Haven'),
			(2064, 'Enchanted Expeditions', '111-555-8888', '456 Enchantment Lane, Mystique City'),
			(2063, 'Golden Gate Travels', '777-222-3333', '789 Gate Avenue, Goldengate'),
			(2062, 'Nature Navigators', '333-666-9999', '101 Nature Lane, Greenscape'),
			(2061, 'Cruise Connections', '555-777-2222', '234 Cruise Boulevard, Seaview'),
			(2060, 'Lush Landscapes Travel', '888-111-9999', '567 Garden Street, Greenery Town'),
			(2059, 'Astral Adventures', '333-444-5555', '890 Celestial Lane, Starville'),
			(2058, 'Riverfront Tours', '666-222-8888', '123 Riverside Road, Waterview'),
			(2057, 'Heritage Highlights', '222-777-4444', '456 History Lane, Pastville'),
			(2056, 'Archipelago Voyages', '999-444-1111', '789 Island Avenue, Archipelago'),
			(2055, 'Sunrise Travels', '111-555-9999', '101 Sunrise Street, Daybreak'),
			(2054, 'Moonlight Journeys', '333-777-2222', '234 Moonlit Path, Nightfall'),
			(2053, 'Sunset Sails Travel', '555-888-6666', '567 Sunset Boulevard, Seashore'),
			(2052, 'Majestic Mountains Tours', '777-333-1111', '890 Summit Road, Altitude'),
			(2051, 'Fiesta Flights', '888-222-4444', '123 Celebration Avenue, Festival City'),
			(2050, 'Tranquil Trails Travel', '555-123-4567', '456 Serenity Street, Calmville');

--insert Services
INSERT INTO Services_ (service_number, shops, restaurants, cinema, administrator_number, TravelAgent_id) VALUES

			(1, 'FashionTrends', 'GourmetDelights', 'StarCinemas', 6001, 2079),
			(2, 'TechHub', 'SavorFlavors', 'CineplexCity', 6002, 2078),
			(3, 'BookHaven', 'CulinaryCrafts', 'MetroFlicks', 6003, 2077),
			(4, 'SportsArena', 'DineElegance', 'GrandTheaters', 6004, 2076),
			(5, 'ElectroGadgets', 'SunnyBites', 'CityPremiere', 6005, 2075),
			(6, 'UrbanStyles', 'GreenBistro', 'HarmonyCinemas', 6006, 2074),
			(7, 'MusicHarbor', 'TasteFusion', 'VistaScreens', 6007, 2073),
			(8, 'HomeDecorHub', 'CuisineCrafters', 'MajesticMovies', 6008, 2072),
			(9, 'FitZone', 'SpiceDelight', 'PinnaclePictures', 6009, 2071),
			(10, 'PetParadise', 'FreshBites', 'CinemaVogue', 6010, 2070),
			(11, 'GadgetGallery', 'AromaDeluxe', 'PremierCineworld', 6011, 2069),
			(12, 'ArtistryAlley', 'ZestfulZest', 'DreamTheater', 6012, 2068),
			(13, 'OutdoorOasis', 'FlavorFiesta', 'EnchantCinemas', 6013, 2067),
			(14, 'GameGalaxy', 'TemptingTastes', 'StarlightScreens', 6014, 2066),
			(15, 'LuxuryLifestyles', 'EpicureanElegance', 'SilverScreenDeluxe', 6015, 2065),
			(16, 'TechTrends', 'CulinaryCharm', 'MetroMajesty', 6016, 2064),
			(17, 'BookNook', 'GastronomicGlee', 'GrandGalaCinemas', 6017, 2063),
			(18, 'SportsSphere', 'EpicureExpress', 'CitySpectra', 6018, 2062),
			(19, 'GizmoGrove', 'DiningDelight', 'HarmonyHeights', 6019, 2061),
			(20, 'NatureNest', 'TastyTreats', 'CinemaCrescent', 6020, 2060),
			(21, 'ArtisanAlley', 'ZestfulZest', 'PanoramaPictures', 6021, 2059),
			(22, 'OutdoorOdyssey', 'FlavorfulFiesta', 'SeafrontScreens', 6022, 2058),
			(23, 'GameGlade', 'TemptingTaste', 'SunsetTheater', 6023, 2057),
			(24, 'TechTide', 'EpicureanEmporium', 'RiverfrontReel', 6024, 2056),
			(25, 'LuxeLiving', 'GourmetGlow', 'IslandScreens', 6025, 2055),
			(26, 'CelestialCinema', 'EpicureanEuphoria', 'SunriseScreenings', 6026, 2054),
			(27, 'GoldenGrove', 'DiningDelicacy', 'SeashoreShowcase', 6027, 2053),
			(28, 'NaturesNectar', 'TastyTwists', 'SpectraScreens', 6028, 2052),
			(29, 'ArtistryArbor', 'ZestyZest', 'AltitudeTheater', 6029, 2051),
			(30, 'TechTraverse', 'EpicureanEssence', 'FestivalFlicks', 6030, 2050);

--insert Tours
SET IDENTITY_INSERT Tours on;
INSERT INTO Tours (Code_tour, Path, Arrive, Pick_up)
VALUES
		  (1001, 'Cairo  Luxor  Aswan', '2-4-2024', '5-5-2024'),
		  (1002, 'Cairo  Aswan  Alex', '2-4-2024', '5-5-2024'),
		  (1003, 'Luxor  Hurghada  Cairo', '3-3-2024', '5-6-2024'),
		  (1004, 'Farafra  Siwa  Luxor', '1-1-2024', '2-2-2024'),
		  (1005, 'Giza  Alexandria  Luxor', '1-1-2024', '2-2-2024'),
		  (1006, 'Luxor  Cairo  Hurghada', '3-3-2024', '5-6-2024'),
		  (1007, 'Hurghada  Farafra  Siwa', '2-4-2024', '5-5-2024'),
		  (1008, 'Alexandria  Luxor  Cairo', '2-4-2024', '5-5-2024'),
		  (1009, 'Sinai Peninsula   Cairo  Luxor', '3-3-2024', '5-6-2024'),
		  (1010, 'Siwa  Farafra  Giza', '1-1-2024', '2-2-2024'),
		  (1011, 'Luxor  Aswan  Cairo', '3-3-2024', '5-6-2024'),
		  (1012, 'Aswan  Luxor  Cairo', '2-4-2024', '5-5-2024'),
		  (1013, 'Cairo  Alexandria  Luxor', '2-4-2024', '5-5-2024'),
		  (1014, 'Saqqara  Cairo  Alexandria', '1-1-2024', '2-2-2024'),
		  (1015, 'Aswan  Luxor  Cairo', '2-4-2024', '5-5-2024'),
		  (1016, 'Luxor  Cairo  Alexandria', '3-3-2024', '5-6-2024'),
		  (1017, 'Alexandria  Luxor  Cairo', '2-4-2024', '5-5-2024'),
		  (1018, 'Alexandria  Luxor  Cairo', '2-4-2024', '5-5-2024'),
		  (1019, 'Wadi El Natrun  Sinai Peninsula  Giza', '3-3-2024', '5-6-2024'),
		  (1020, 'Aswan  Luxor  Cairo', '2-4-2024', '5-5-2024'),
		  (1021, 'Cairo  Giza  Alexandria', '2-4-2024', '5-5-2024'),
		  (1022, 'Taba  Sinai Peninsula  Giza', '1-1-2024', '2-2-2024'),
		  (1023, 'Cairo  Luxor  Aswan', '2-4-2024', '5-5-2024'),
		  (1024, 'Cairo  Alexandria  Giza', '1-1-2024', '2-2-2024'),
		  (1025, 'Alexandria  Luxor  Giza', '3-3-2024', '5-6-2024'),
		  (1026, 'Red Sea  Sinai Peninsula  Giza', '2-4-2024', '5-5-2024'),
		  (1027, 'Aswan  Luxor  Cairo', '2-4-2024', '5-5-2024'),
		  (1028, 'Cairo  Luxor  Alexandria', '3-3-2024', '5-6-2024'),
		  (1029, 'Cairo  Giza  Alexandria', '2-4-2024', '5-5-2024'),
		  (1030, 'Fayoum  Cairo  Alexandria', '1-1-2024', '2-2-2024');
		  SET IDENTITY_INSERT Tours off;
--insert Tour_Services
INSERT INTO Tour_Services (Code_tour, service_number)
VALUES
		(1001, 28),
		(1002, 2),
		(1003, 16),
		(1004, 30),
		(1005, 23),
		(1006, 27),
		(1007, 12),
		(1008, 10),
		(1009, 11),
		(1010, 8),
		(1011, 9),
		(1012, 7),
		(1013, 29),
		(1014, 15),
		(1015, 14),
		(1016, 3),
		(1017, 22),
		(1018, 19),
		(1019, 20),
		(1020, 18),
		(1021, 25),
		(1022, 17),
		(1023, 5),
		(1024, 3),
		(1025, 5),
		(1026, 24),
		(1027, 6),
		(1028, 1),
		(1029, 13),
		(1030, 4),
		(1001, 1),
		(1002, 4),
		(1023, 14),
		(1024, 30),
		(1025, 15),
		(1026, 2),
		(1027, 13),
		(1028, 9),
		(1029, 23),
		(1030, 5),
		(1001, 9),
		(1002, 10),
		(1003, 3),
		(1004, 4),
		(1005, 5),
		(1006, 6),
		(1007, 7),
		(1008, 8),
		(1009, 9),
		(1010, 10),
		(1011, 11),
		(1012, 12),
		(1013, 13),
		(1014, 14),
		(1015, 15),
		(1016, 16),
		(1017, 17),
		(1018, 18),
		(1019, 19),
		(1020, 20),
		(1021, 21),
		(1022, 22),
		(1023, 23),
		(1024, 24),
		(1025, 25),
		(1026, 26),
		(1027, 27),
		(1028, 28),
		(1029, 29),
		(1030, 30);

--insert National_Place
alter table National_Place alter column History varchar(200);
INSERT INTO National_Place(Name, Loc, Type, History)
VALUES ('Egyptian Museum', 'Cairo', 'Museum', 'an extensive collection of artifacts'),
		('Cairo Tower', 'Cairo', 'Modern Landmark', ' symbol of modern Egypt'),
		('Karnak Temple', 'Luxor, Egypt', 'Religious Site', 'a vast ancient temple complex '),
		('White Desert', 'Farafra', 'Natural Landmark', 'creating a surreal and otherworldly landscape.'),
		('Pyramids', 'Giza', 'Historical', 'built as for pharaohs'),
		('Valley of the King', 'Luxor, Egypt', 'Archaeological Site', 'for many pharaohs of the New Kingdom.'),
		('Hurghada Beach', 'Hurghada', 'Natural Attraction', 'Popular beach resort town along the Red Sea coast, known for its crystal clear waters and vibrant marine life.'),
		('Montaza Palace', 'Alexandria', 'Historical Palace', 'Montaza Palace is a palace and extensive gardens in the Montaza district of Alexandria.'),
		('St. Catherines Monastery', 'Sinai Peninsula', 'Religious Site', 'St. Catherines Monastery is a UNESCO World Heritage site located on the Sinai Peninsula.'),
		('Siwa Oasis', 'Siwa', 'Desert Oasis', 'An oasis in the Western Desert, known for its date palms and the ancient Oracle of Amun.'),
		('Luxor Temple', 'Luxor, Egypt', 'Ancient Temple', 'Luxor Temple is a large Ancient Egyptian temple complex located on the east bank of the Nile.'),
		('Abu Simbel Temples', 'Aswan', 'Historical Site', 'The Abu Simbel Temples are two massive rock temples built by Ramses II.'),
		('White Mosque', 'Cairo', 'Religious Site', 'The White Mosque, also known as the Alabaster Mosque, is one of the largest mosques in Cairo.'),
		('Saqqara Pyramid', 'Saqqara', 'Archaeological Site', 'Saqqara is a vast, ancient burial ground in Egypt, featuring the famous Step Pyramid of Djoser.'),
		('Aswan High Dam', 'Aswan', 'Engineering Marvel', 'The Aswan High Dam is an embankment dam built across the Nile River.'),
		('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 'Ancient Temple', 'This temple is dedicated to the sun god Amon Ra and is located beneath the cliffs at Deir el Bahari.'),
		('Catacombs of Kom El Shoqafa', 'Alexandria', 'Ancient Cemetery', 'These catacombs are one of the Seven Wonders of the Middle Ages, blending elements of Pharaonic, Greek, and Roman cultures.'),
		('Qaitbay Citadel', 'Alexandria', 'Historical Fortress', 'Built on the site of the ancient Lighthouse of Alexandria, the Qaitbay Citadel is a 15th century fortress.'),
		('Wadi El Natrun', 'Wadi El Natrun', 'Natural Area', 'Wadi El Natrun is a valley located in the Western Desert that has been the site of Christian monastic settlements.'),
		('Philae Temple', 'Aswan', 'Ancient Temple', 'The Philae Temple was dismantled and relocated to Agilkia Island due to the construction of the Aswan High Dam.'),
		('Citadel of Saladin', 'Cairo', 'Historical Fortress', 'The Citadel of Saladin is a medieval Islamic fortification in Cairo, built by Saladin to protect against the Crusaders.'),
		('Fjord Bay', 'Taba', 'Scenic Area', 'Fjord Bay is a picturesque bay in Taba offering stunning views of the surrounding mountains and the Gulf of Aqaba.'),
		('Tahrir Square', 'Cairo', 'Urban Square', 'Tahrir Square is a major public square in downtown Cairo, known for its historical and political significance.'),
		('St. Marks Coptic Orthodox Cathedral', 'Cairo', 'Religious Site', 'St. Marks Coptic Orthodox Cathedral is the largest church in Africa and serves as the seat of the Coptic Pope.'),
		('Citadel of Qaitbay', 'Alexandria', 'Historical Fortress', 'The Citadel of Qaitbay is a 15th century defensive fortress located on the Mediterranean Sea coast in Alexandria.'),
		('Gabal Elba National Park', 'Red Sea', 'National Park', 'Gabal Elba National Park is a protected area in southeastern Egypt, known for its diverse flora and fauna.'),
		('Kitcheners Island', 'Aswan', 'Botanical Garden', 'Kitcheners Island, also known as Aswan Botanical Garden, is a botanical garden on an island in the Nile.'),
		('Nile Corniche', 'Cairo', 'River Promenade', 'The Nile Corniche is a scenic promenade along the Nile River, offering beautiful views of the water and city.'),
		('Saint Samaan the Tanner Monastery', 'Cairo', 'Religious Site', 'A cave church complex carved into the Mokattam hills, named after the Coptic saint Samaan the Tanner.'),
		('Wadi Al-Hitan', 'Fayoum', 'Fossil Site', 'Wadi Al-Hitan, or the Valley of the Whales, is a UNESCO World Heritage Site known for its fossils of ancient whales.');

--insert NationalPlace_Tour
INSERT INTO NationalPlace_Tour (NationalPlace_Name, NationalPlace_Loc, Tour_Code) VALUES

		('Egyptian Museum', 'Cairo', 1001),
		('Cairo Tower', 'Cairo', 1002),
		('White Mosque', 'Cairo', 1001),
		('White Mosque', 'Cairo', 1002),
		('Egyptian Museum', 'Cairo', 1002),
		('Cairo Tower', 'Cairo', 1001),
		('Nile Corniche', 'Cairo', 1001),
		('Nile Corniche', 'Cairo', 1002),
		('Pyramids', 'Giza', 1001),
		('Pyramids', 'Giza', 1002),
		('Nile Corniche', 'Cairo', 1005),
		('Karnak Temple', 'Luxor, Egypt', 1003),
		('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 1003),
		('White Desert', 'Farafra', 1004),
		('Pyramids', 'Giza', 1005),
		('Valley of the King', 'Luxor, Egypt', 1006),
		('Karnak Temple', 'Luxor, Egypt', 1006),
		('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 1006),
		('Hurghada Beach', 'Hurghada', 1007),
		('Montaza Palace', 'Alexandria', 1008),
		('St. Catherines Monastery', 'Sinai Peninsula', 1009),
		('Siwa Oasis', 'Siwa', 1010),
		('Luxor Temple', 'Luxor, Egypt', 1011),
		('Karnak Temple', 'Luxor, Egypt', 1011),
		('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 1011),
		('Abu Simbel Temples', 'Aswan', 1012),
		('Kitcheners Island', 'Aswan', 1012),
		('White Mosque', 'Cairo', 1013),
		('Egyptian Museum', 'Cairo', 1013),
		('Cairo Tower', 'Cairo', 1013),
		('Nile Corniche', 'Cairo', 1013),
		('Pyramids', 'Giza', 1013),
		('Saqqara Pyramid', 'Saqqara', 1014),
		('Aswan High Dam', 'Aswan', 1015),
		('Abu Simbel Temples', 'Aswan', 1015),
		('Kitcheners Island', 'Aswan', 1015),
		('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 1016),
		('Karnak Temple', 'Luxor, Egypt', 1016),
		('Catacombs of Kom El Shoqafa', 'Alexandria', 1017),
		('Qaitbay Citadel', 'Alexandria', 1018),
		('Wadi El Natrun', 'Wadi El Natrun', 1019),
		('Philae Temple', 'Aswan', 1020),
		('Abu Simbel Temples', 'Aswan', 1020),
		('Kitcheners Island', 'Aswan', 1020),
		('Citadel of Saladin', 'Cairo', 1021),
		('Pyramids', 'Giza', 1021),
		('Fjord Bay', 'Taba', 1022),
		('Tahrir Square', 'Cairo', 1023),
		('White Mosque', 'Cairo', 1023),
		('Pyramids', 'Giza', 1023),
		('Egyptian Museum', 'Cairo', 1023),
		('Cairo Tower', 'Cairo', 1023),
		('Nile Corniche', 'Cairo', 1023),
		('St. Marks Coptic Orthodox Cathedral', 'Cairo', 1024),
		('Citadel of Qaitbay', 'Alexandria', 1025),
		('Gabal Elba National Park', 'Red Sea', 1026),
		('Kitcheners Island', 'Aswan', 1027),
		('Abu Simbel Temples', 'Aswan', 1027),
		('Nile Corniche', 'Cairo', 1028),
		('White Mosque', 'Cairo', 1028),
		('Egyptian Museum', 'Cairo', 1028),
		('Cairo Tower', 'Cairo', 1028),
		('Saint Samaan the Tanner Monastery', 'Cairo', 1029),
		('Wadi Al-Hitan', 'Fayoum', 1030);

		--insertBooking
INSERT INTO booking (booking_id, Arrival_airport_name, Arrival_date, Book_type, Price) VALUES
		
		(4001, 'Luxor International Airport', '2023-12-20', 'Hotel', 150),
		(4002, 'Hurghada International Airport', '2023-12-25', 'Tour', 200),
		(4003, 'Sharm El Sheikh International Airport', '2023-12-30', 'Car Rental', 100),
		(4004, 'Aswan International Airport', '2024-01-05', 'Flight', 450),
		(4005, 'Alexandria International Airport', '2024-01-10', 'Hotel', 200),
		(4006, 'Marsa Alam International Airport', '2024-01-15', 'Tour', 220),
		(4007, 'Taba International Airport', '2024-01-20', 'Car Rental', 120),
		(4008, 'Dahab International Airport', '2024-01-25', 'Flight', 480),
		(4009, 'Suez Canal Airport', '2024-01-30', 'Hotel', 180),
		(4010, 'Port Said International Airport', '2024-02-05', 'Tour', 210),
		(4011, 'Siwa Oasis Airport', '2024-02-10', 'Car Rental', 130),
		(4012, 'El Alamein International Airport', '2024-02-15', 'Flight', 470),
		(4013, 'Nile Cruise Ports', '2024-02-20', 'Hotel', 190),
		(4014, 'Red Sea Ports', '2024-02-25', 'Tour', 230),
		(4015, 'Giza Pyramids Helipad', '2024-03-01', 'Car Rental', 140),
		(4016, 'Sphinx International Airport', '2024-03-06', 'Flight', 460),
		(4017, 'Fayoum Airport', '2024-03-11', 'Hotel', 210),
		(4018, 'El Minya Airport', '2024-03-16', 'Tour', 240),
		(4019, 'Bahariya Oasis Airport', '2024-03-21', 'Car Rental', 150),
		(4020, 'Asyut Airport', '2024-03-26', 'Flight', 490),
		(4021, 'Qena Airport', '2024-04-01', 'Hotel', 220),
		(4022, 'Luxor West Bank Helipad', '2024-04-06', 'Tour', 250),
		(4023, 'Kom Ombo Airport', '2024-04-11', 'Car Rental', 160),
		(4024, 'Edfu Airport', '2024-04-16', 'Flight', 480),
		(4025, 'Ain Sokhna Ports', '2024-04-21', 'Hotel', 230),
		(4026, 'Ras Gharib Airport', '2024-04-26', 'Tour', 260),
		(4027, 'Marsa Matruh Airport', '2024-05-01', 'Car Rental', 170),
		(4028, 'El Kharga Airport', '2024-05-06', 'Flight', 490),
		(4029, 'Sallum Airport', '2024-05-11', 'Hotel', 240),
		(4030, 'Mersa Wadi Qandil Airport', '2024-05-16', 'Tour', 270);

		
--insert Tourist
INSERT INTO Tourist (Tourist_id, F_Name, L_Name, Tell, Nationality, Hotel_Name, TravelAgent_id, Booking_id) VALUES
		(1, 'John', 'Doe', '123-456-7890', 'USA', 'Luxury Inn', 2079, 4001),
		(2, 'Alice', 'Smith', '987-654-3210', 'UK', 'Royal Plaza', 2078, 4002),
		(3, 'Mohammed', 'Ali', '555-111-2222', 'Egypt', 'Sunset Resort', 2077, 4003),
		(4, 'Maria', 'Garcia', '444-555-6666', 'Spain', 'Golden Sands Hotel', 2076, 4004),
		(5, 'Chen', 'Li', '888-777-6666', 'China', 'Harbor View Suites', 2075, 4005),
		(6, 'Aya', 'Sato', '777-999-8888', 'Japan', 'City Lights Hotel', 2074, 4006),
		(7, 'Luca', 'Rossi', '222-444-8888', 'Italy', 'Mountain Retreat Lodge', 2073, 4007),
		(8, 'Isabella', 'Moreno', '111-333-5555', 'Mexico', 'Seaside Haven', 2072, 4008),
		(9, 'Raj', 'Patel', '666-888-9999', 'India', 'Majestic Gardens Resort', 2071, 4009),
		(10, 'Elena', 'Kovac', '555-777-3333', 'Croatia', 'Tranquil Oasis Inn', 2070, 4010),
		(11, 'Mikhail', 'Ivanov', '888-555-4444', 'Russia', 'Palm Breeze Resort', 2069, 4011),
		(12, 'Sophie', 'Lefevre', '444-666-7777', 'France', 'Elegant Towers Hotel', 2068, 4012),
		(13, 'Carlos', 'Gomez', '333-454-1111', 'Spain', 'Whispering Pines Lodge', 2067, 4013),
		(14, 'Yuki', 'Tanaka', '777-333-2222', 'Japan', 'Emerald Springs Hotel', 2066, 4014),
		(15, 'Mateo', 'Fernandez', '555-999-6666', 'Spain', 'Silver Moon Inn', 2065, 4015),
		(16, 'Olga', 'Kuznetsova', '999-333-2222', 'Russia', 'Oceanfront Paradise', 2064, 4016),
		(17, 'Liam', 'OConnor', '777-444-6666', 'Ireland', 'Serenity Suites', 2063, 4017),
		(18, 'Sofia', 'Andrade', '888-111-4444', 'Portugal', 'Regal Heights Hotel', 2062, 4018),
		(19, 'Hassan', 'Al-Farsi', '555-777-9999', 'Oman', 'Enchanted Castle Resort', 2061, 4019),
		(20, 'Lucia', 'Gutierrez', '333-444-1111', 'Spain', 'Cypress Valley Lodge', 2060, 4020),
		(21, 'Emily', 'Wang', '666-222-5555', 'China', 'Crown Plaza Hotel', 2059, 4021),
		(22, 'Alessio', 'Marini', '222-777-3333', 'Italy', 'Grand Orchid Resort', 2058, 4022),
		(23, 'Yui', 'Suzuki', '999-444-6666', 'Japan', 'Sunrise Heights Inn', 2057, 4023),
		(24, 'Rashid', 'Al-Maktoum', '111-555-7777', 'UAE', 'Blue Horizon Hotel', 2056, 4024),
		(25, 'Sophia', 'Petrova', '333-777-2222', 'Russia', 'Golden Gate Inn', 2055, 4025),
		(26, 'Rafael', 'Gonzalez', '555-888-3333', 'Spain', 'Harmony Haven Resort', 2054, 4026),
		(27, 'Anya', 'Ivanova', '777-333-4444', 'Russia', 'Evergreen Gardens Hotel', 2053, 4027),
		(28, 'Marco', 'Moretti', '888-222-5555', 'Italy', 'Pearl Harbor Suites', 2052, 4028),
		(29, 'Fatemeh', 'Hosseini', '666-111-3333', 'Iran', 'Moonlight Bay Resort', 2051, 4029),
		(30, 'Javier', 'Cortez', '444-888-1111', 'Mexico', 'Luxury Inn', 2050, 4030);

			
--insert NationalPlace_Tourist
INSERT INTO NationalPlace_Tourist (Nationalplace_name, Nationalplac_Loc, Tourist_id)
VALUES
			('Egyptian Museum', 'Cairo', 1),
			('Cairo Tower', 'Cairo', 2),
			('Egyptian Museum', 'Cairo', 2),
			('Cairo Tower', 'Cairo', 1),
			('Karnak Temple', 'Luxor, Egypt', 3),
			('White Desert', 'Farafra', 4),
			('Pyramids', 'Giza', 5),
			('Pyramids', 'Giza', 1),
			('Pyramids', 'Giza', 2),
			('Pyramids', 'Giza', 7),
			('Pyramids', 'Giza', 23),
			('Pyramids', 'Giza', 18),
			('Valley of the King', 'Luxor, Egypt', 6),
			('Egyptian Museum', 'Cairo', 6),
			('Cairo Tower', 'Cairo', 6),
			('Hurghada Beach', 'Hurghada', 7),
			('Montaza Palace', 'Alexandria', 8),
			('St. Catherines Monastery', 'Sinai Peninsula', 9),
			('Siwa Oasis', 'Siwa', 10),
			('Luxor Temple', 'Luxor, Egypt', 11),
			('Valley of the King', 'Luxor, Egypt', 11),
			('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 11),
			('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 12),
			('Abu Simbel Temples', 'Aswan', 12),
			('Kitcheners Island', 'Aswan', 12),
			('White Mosque', 'Cairo', 13),
			('Saqqara Pyramid', 'Saqqara', 14),
			('Aswan High Dam', 'Aswan', 15),
			('Kitcheners Island', 'Aswan', 15),
			('Mortuary Temple of Hatshepsut', 'Luxor, Egypt', 16),
			('Valley of the King', 'Luxor, Egypt', 16),
			('Catacombs of Kom El Shoqafa', 'Alexandria', 17),
			('Qaitbay Citadel', 'Alexandria', 18),
			('Kitcheners Island', 'Aswan', 18),
			('Wadi El Natrun', 'Wadi El Natrun', 19),
			('Philae Temple', 'Aswan', 20),
			('Kitcheners Island', 'Aswan', 20),
			('Citadel of Saladin', 'Cairo', 21),
			('Fjord Bay', 'Taba', 22),
			('Tahrir Square', 'Cairo', 23),
			('St. Marks Coptic Orthodox Cathedral', 'Cairo', 24),
			('Citadel of Qaitbay', 'Alexandria', 25),
			('Citadel of Qaitbay', 'Alexandria', 15),
			('Citadel of Qaitbay', 'Alexandria', 5),
			('Citadel of Qaitbay', 'Alexandria', 20),
			('Gabal Elba National Park', 'Red Sea', 26),
			('Kitcheners Island', 'Aswan', 27),
			('Nile Corniche', 'Cairo', 28),
			('Saint Samaan the Tanner Monastery', 'Cairo', 29),
			('Wadi Al-Hitan', 'Fayoum', 30);


--insert Companion 
INSERT INTO Companion (companion_id, F_Name, L_Name, Nationality, Relation, Tourist_id)
VALUES 
    (300, 'Alex', 'Smith', 'Canada', 'Friend', 1),
    (301, 'Grace', 'Johnson', 'UK', 'Family', 2),
    (302, 'Ryan', 'Taylor', 'USA', 'Colleague', 3),
    (303, 'Sophie', 'Brown', 'Germany', 'Friend', 1),
    (304, 'Michael', 'Williams', 'Italy', 'Family', 2),
    (305, 'Emma', 'Jones', 'France', 'Colleague', 3),
    (306, 'Jake', 'Turner', 'Australia', 'Friend', 4),
    (307, 'Olivia', 'Harris', 'Spain', 'Family', 5),
    (308, 'Daniel', 'Clark', 'Brazil', 'Colleague', 6),
    (309, 'Ava', 'Thompson', 'Japan', 'Friend', 7),
    (310, 'Ethan', 'Moore', 'South Africa', 'Family', 8),
    (311, 'Isabella', 'Davis', 'Russia', 'Colleague', 9),
    (312, 'Liam', 'Anderson', 'Netherlands', 'Friend', 10),
    (313, 'Sophia', 'Martin', 'Belgium', 'Family', 11),
    (314, 'Logan', 'Wilson', 'Portugal', 'Colleague', 12),
    (315, 'Mia', 'Garcia', 'Greece', 'Friend', 13),
    (316, 'Noah', 'Perez', 'Ireland', 'Family', 13),
    (317, 'Avery', 'Wright', 'Denmark', 'Colleague', 15),
    (318, 'Emma', 'Hernandez', 'Sweden', 'Friend', 16),
    (319, 'Jack', 'Smith', 'Norway', 'Family', 17),
    (320, 'Ella', 'Turner', 'Switzerland', 'Colleague', 18),
    (321, 'Mason', 'Lee', 'Argentina', 'Friend', 19),
    (322, 'Lily', 'Johnson', 'Mexico', 'Family', 20),
    (323, 'Carter', 'Brown', 'India', 'Colleague', 20),
    (324, 'Grace', 'Thompson', 'China', 'Friend', 20),
    (325, 'James', 'Martin', 'South Africa', 'Family', 23),
    (326, 'Aria', 'Harris', 'Canada', 'Colleague', 24),
    (327, 'Ethan', 'Anderson', 'Italy', 'Friend', 25),
    (328, 'Ava', 'Davis', 'Brazil', 'Family', 6),
    (329, 'Leo', 'Clark', 'Germany', 'Colleague', 27),
    (330, 'Zoe', 'Moore', 'UK', 'Friend', 28),
    (331, 'Lucas', 'Perez', 'USA', 'Family', 3),
    (332, 'Mia', 'Garcia', 'Spain', 'Colleague', 3);

------------------------------------------------------------------------------------
--SELECT--

--Find Tourists and Companion from a Specific Nationality
SELECT * FROM Tourist
WHERE Nationality = 'USA'
order by F_Name asc;
SELECT * FROM Companion
WHERE Nationality = 'Germany'
order by F_Name asc;

--Find Companions who are Friends
SELECT * FROM Companion
WHERE Relation = 'Friend';

--Count the Number of Tourists and Companions
SELECT 'Tourists' AS 'Category', COUNT(*) AS 'Count' FROM Tourist
UNION
SELECT 'Companions' AS 'Category', COUNT(*) AS 'Count' FROM Companion;

--List Tourists and Their Companions
select Tourist.F_Name+' '+Tourist.L_Name as 'Tourist Name',Companion.F_Name+' '+Companion.L_Name as 'Companion Name',Relation
from Tourist inner join Companion
on Tourist.Tourist_id=Companion.Tourist_id;

--Find Tourists and Companions with the Same Nationality
SELECT Tourist.F_Name + ' ' + Tourist.L_Name AS 'Tourist Name', Companion.F_Name + ' ' + Companion.L_Name AS 'Companion Name', Relation
FROM Tourist
INNER JOIN Companion ON Tourist.Tourist_id = Companion.Tourist_id
WHERE Tourist.Nationality = Companion.Nationality;

--Count the Number of Companions for Each Tourist
SELECT Tourist.Tourist_id, Tourist.F_Name + ' ' + Tourist.L_Name AS 'Tourist Name', COUNT(Companion.Companion_id) AS 'Number of Companions'
FROM Tourist
LEFT JOIN Companion ON Tourist.Tourist_id = Companion.Tourist_id
GROUP BY Tourist.Tourist_id, Tourist.F_Name, Tourist.L_Name;

--List Tourists with More Than One Companion
SELECT Tourist.F_Name + ' ' + Tourist.L_Name AS 'Tourist Name', COUNT(Companion.Companion_id) AS 'Number of Companions'
FROM Tourist
LEFT JOIN Companion ON Tourist.Tourist_id = Companion.Tourist_id
GROUP BY Tourist.Tourist_id, Tourist.F_Name, Tourist.L_Name
HAVING COUNT(Companion.Companion_id) > 1;


--Select administrators with the position 'Manager'
SELECT * FROM Administrators 
WHERE position = 'Manager';

--Select administrators whose names start with 'A'
SELECT * FROM Administrators 
WHERE administrator_name LIKE 'A%';

--Select services managed by administrators with the position 'Supervisor'
SELECT * FROM Services_ 
WHERE administrator_number IN (SELECT administrator_number FROM Administrators WHERE position = 'Supervisor');

--Count the number of services associated with the restaurant 'GourmetDelights'
SELECT COUNT(*) AS restaurant_count
FROM Services_
WHERE restaurants = 'GourmetDelights';

--List administrators and their associated services 
SELECT Administrators.administrator_name, Administrators.telephone,
Services_.service_number, Services_.shops, Services_.restaurants, Services_.cinema
FROM Administrators
LEFT JOIN Services_ ON Administrators.administrator_number = Services_.administrator_number;

-- Select all hotels
SELECT * FROM Hotel;

-- Select all hotel prices
SELECT * FROM Hotel_Price;

-- Select hotels and their prices
SELECT H.Hotel_Name, H.tel, HP.price
FROM Hotel H
INNER JOIN Hotel_Price HP ON H.Hotel_Name = HP.Hotel_Name;

-- Select hotels with prices between $150 and $200
SELECT H.Hotel_Name, H.tel, HP.price
FROM Hotel H
INNER JOIN Hotel_Price HP ON H.Hotel_Name = HP.Hotel_Name
WHERE HP.price BETWEEN 150 AND 200;

-- Select hotels with prices less than $150 or greater than $200
SELECT H.Hotel_Name, H.tel, HP.price
FROM Hotel H
INNER JOIN Hotel_Price HP ON H.Hotel_Name = HP.Hotel_Name
WHERE HP.price < 150 OR HP.price > 200;

-- Select hotels with names containing "Inn"
SELECT * FROM Hotel
WHERE Hotel_Name LIKE '%Inn%';

-- Select hotels with prices greater than the average price
SELECT H.Hotel_Name, H.tel, HP.price
FROM Hotel H
INNER JOIN Hotel_Price HP ON H.Hotel_Name = HP.Hotel_Name
WHERE HP.price > (SELECT AVG(price) FROM Hotel_Price);

-- Select hotels and their prices in descending order of price
SELECT H.Hotel_Name, H.tel, HP.price
FROM Hotel H
INNER JOIN Hotel_Price HP ON H.Hotel_Name = HP.Hotel_Name
ORDER BY HP.price DESC;

-- Select all events and festivals
SELECT * FROM Events_Festivals;

-- Select events and festivals in a specific area
SELECT * FROM Events_Festivals
WHERE Area = 'Downtown Plaza';

-- Select events and festivals in a specific hotel
SELECT * FROM Events_Festivals
WHERE Hotel_Name = 'Luxury Inn';

-- Select events and festivals with a specific event type
SELECT * FROM Events_Festivals
WHERE Events_Type = 'Carnival';

-- Select events and festivals with dates after '2024-03-01'
SELECT * FROM Events_Festivals
WHERE Events_date > '2024-03-01';

-- Select events and festivals in descending order of event time
SELECT * FROM Events_Festivals
ORDER BY Events_time DESC;

-- Select all travel agents
SELECT * FROM TravelAgent;

-- Select specific details of travel agents
SELECT TravelAgent_id, TravelAgent_name, Tel, TravelAgent_Address
FROM TravelAgent;

-- Select services offered by travel agents
SELECT * FROM Services_;

-- Select services with specific service numbers
SELECT * FROM Services_
WHERE service_number IN (1, 5, 10);

-- Select services offered by a specific travel agent
SELECT * FROM Services_
WHERE TravelAgent_id = 2002;

-- Select services with shops related to technology
SELECT * FROM Services_
WHERE shops LIKE '%Tech%';

-- Select services with restaurants offering gourmet delights
SELECT * FROM Services_
WHERE restaurants = 'GourmetDelights';

-- Select services with cinema having screens
SELECT * FROM Services_
WHERE cinema LIKE '%Screens%';

-- Select services with administrators having numbers greater than 6000
SELECT * FROM Services_
WHERE administrator_number > 6000;

-- Select travel agents offering services related to fashion
SELECT T.TravelAgent_id, T.TravelAgent_name, S.shops
FROM TravelAgent T
INNER JOIN Services_ S ON T.TravelAgent_id = S.TravelAgent_id
WHERE S.shops LIKE '%Fashion%';

-- Select travel agents and their offered services
SELECT T.TravelAgent_id, T.TravelAgent_name, S.shops, S.restaurants, S.cinema, S.administrator_number
FROM TravelAgent T
INNER JOIN Services_ S ON T.TravelAgent_id = S.TravelAgent_id;

-- Select travel agents offering services related to nature
SELECT T.TravelAgent_id, T.TravelAgent_name, S.shops, S.restaurants, S.cinema, S.administrator_number
FROM TravelAgent T
INNER JOIN Services_ S ON T.TravelAgent_id = S.TravelAgent_id
WHERE S.shops LIKE '%Nature%' OR S.restaurants LIKE '%Nature%' OR S.cinema LIKE '%Nature%';

-- Select services with administrators and their corresponding travel agent names
SELECT S.service_number, S.administrator_number, T.TravelAgent_name
FROM Services_ S
INNER JOIN TravelAgent T ON S.TravelAgent_id = T.TravelAgent_id;

-- Select all columns from the National_Place table
SELECT * FROM National_Place;

-- Select the names and locations of National Places in Cairo
SELECT Name, Loc FROM National_Place WHERE Loc = 'Cairo';

-- Select unique types of National Places
SELECT DISTINCT Type FROM National_Place;

-- Select National Places with 'Archaeological Site' type
SELECT * FROM National_Place WHERE Type = 'Archaeological Site';

-- Select National Places with a history containing the word 'ancient'
SELECT * FROM National_Place WHERE History LIKE '%ancient%';

-- Select National Places ordered by name in descending order
SELECT * FROM National_Place ORDER BY Name DESC;

-- Select National Places with names starting with 'C' and located in 'Cairo'
SELECT * FROM National_Place WHERE Name LIKE 'C%' AND Loc = 'Cairo';

-- Select the count of National Places in each location
SELECT Loc, COUNT(*) AS PlaceCount FROM National_Place GROUP BY Loc;

-- Select National Places with a history longer than 150 characters
SELECT * FROM National_Place WHERE LEN(History) > 150;

-- Select National Places in Luxor, Egypt, ordered by name
SELECT * FROM National_Place WHERE Loc = 'Luxor, Egypt' ORDER BY Name;

-- Select the average length of history for National Places
SELECT AVG(LEN(History)) AS AvgHistoryLength FROM National_Place;

-- Select National Places with names containing 'Temple' and located in 'Luxor, Egypt'
SELECT * FROM National_Place WHERE Name LIKE '%Temple%' AND Loc = 'Luxor, Egypt';

-- Select National Places with types 'Ancient Temple' or 'Historical Site'
SELECT * FROM National_Place WHERE Type IN ('Ancient Temple', 'Historical Site');

-- Select National Places located in 'Aswan' with history starting with 'The'
SELECT * FROM National_Place WHERE Loc = 'Aswan' AND History LIKE 'The%';

-- Select National Places with types 'Natural Landmark' or 'Scenic Area'
SELECT * FROM National_Place WHERE Type IN ('Natural Landmark', 'Scenic Area');

-- Select National Places with names containing 'Museum' and located in 'Cairo'
SELECT * FROM National_Place WHERE Name LIKE '%Museum%' AND Loc = 'Cairo';

-- Select National Places with names starting with 'S' and located in 'Sinai Peninsula'
SELECT * FROM National_Place WHERE Name LIKE 'S%' AND Loc = 'Sinai Peninsula';

-- Select National Places with types 'Religious Site' and 'Historical Fortress'
SELECT * FROM National_Place WHERE Type IN ('Religious Site', 'Historical Fortress');

-- Select National Places located in 'Alexandria' with a history shorter than 100 characters
SELECT * FROM National_Place WHERE Loc = 'Alexandria' AND LEN(History) < 100;

-- Select all columns from the Booking table
SELECT * FROM Booking;

-- Select booking information for flights
SELECT * FROM Booking WHERE Book_type = 'Flight';

-- Select bookings with a price greater than 200
SELECT * FROM Booking WHERE Price > 200;

-- Select bookings for tours with a price less than or equal to 220
SELECT * FROM Booking WHERE Book_type = 'Tour' AND Price <= 220;

-- Select bookings for hotels with an arrival date after '2024-02-01'
SELECT * FROM Booking WHERE Book_type = 'Hotel' AND Arrival_date > '2024-02-01';

-- Select bookings for car rentals with a price between 130 and 160
SELECT * FROM Booking WHERE Book_type = 'Car Rental' AND Price BETWEEN 130 AND 160;

-- Select the total number of bookings for each book type
SELECT Book_type, COUNT(*) AS BookingCount FROM Booking GROUP BY Book_type;

-- Select bookings with an arrival airport name containing 'International'
SELECT * FROM Booking WHERE Arrival_airport_name LIKE '%International%';

-- Select bookings with an arrival date in January 2024
SELECT * FROM Booking WHERE MONTH(Arrival_date) = 1 AND YEAR(Arrival_date) = 2024;

-- Select bookings with prices in descending order
SELECT * FROM Booking ORDER BY Price DESC;

-- Select the average price of all bookings
SELECT AVG(Price) AS AvgPrice FROM Booking;

-- Select bookings with an arrival airport name starting with 'C'
SELECT * FROM Booking WHERE Arrival_airport_name LIKE 'C%';

-- Select bookings with a price greater than the average price
SELECT * FROM Booking WHERE Price > (SELECT AVG(Price) FROM Booking);

-- Select bookings with an arrival airport name not containing 'Cairo'
SELECT * FROM Booking WHERE Arrival_airport_name NOT LIKE '%Cairo%';

-- Select bookings with an arrival date on or after '2024-03-15'
SELECT * FROM Booking WHERE Arrival_date >= '2024-03-15';
-------------------------------------------------------------------------------
--select on tours table

SELECT *from Tours;
--nested select query 
select *from Tours where Code_tour>(select  max(1008) from Tours);
SELECT DISTINCT Path FROM Tours;
select *from Tours where Path like'C%';
select *from Tours where Path like'%A';
SELECT Path,Code_tour from Tours order by Code_tour DESC;
SELECT Path from Tours order by Path DESC;
---------------------------------------------------------------------
--select from National_place table
select *from National_place;
--select from National_place distinct loc
SELECT DISTINCT Loc FROM National_place;
--select from National_place distinct name places
SELECT DISTINCT Name FROM National_place;
SELECT * FROM National_place WHERE Type = 'Historical Site';
select Loc ,max(History) as History ,max(Name) as Name_tourism_place from
National_place group by Loc;
-------------------------------------------------------------------

-------------------------------------------------------------------------------

--View to Display Tourists and Their Booking Information
CREATE VIEW Tourist_Booking_View AS
SELECT
    T.Tourist_id,
    T.F_Name AS Tourist_First_Name,
    T.L_Name AS Tourist_Last_Name,
    T.Tell AS Tourist_Phone,
    T.Nationality AS Tourist_Nationality,
    B.Arrival_Airport_name AS Arrival_Airport,
    B.Arrival_Date AS Arrival_Date,
    B.Book_type AS Booking_Type,
    B.Price AS Booking_Price
FROM Tourist T
LEFT JOIN Booking B ON T.Booking_id = B.Booking_id;


--View to Display Tours with Associated National Places
CREATE VIEW Tour_NationalPlace_View AS
SELECT
    T.Code_tour AS Tour_Code,
    T.Path AS Tour_Path,
    T.Pick_up AS Tour_Pick_up,
    T.Arrive AS Tour_Arrive,
    NT.NationalPlace_Name AS NationalPlace_Name,
    NT.Nationalplace_Loc AS NationalPlace_Location
FROM Tours T
LEFT JOIN NationalPlace_Tour NT ON T.Code_tour = NT.Tour_Code;


--view that provides information about travel agents, including details about the associated services
CREATE VIEW TravelAgent_View AS
SELECT
    TA.TravelAgent_id,
    TA.TravelAgent_name AS TravelAgent_Name,
    TA.Tel AS TravelAgent_Phone,
    TA.TravelAgent_Address AS TravelAgent_Address,
    S.service_number AS Service_Number,
    S.shops AS Shops,
    S.restaurants AS Restaurants,
    S.cinema AS Cinema
FROM TravelAgent TA
LEFT JOIN Services_ S ON TA.TravelAgent_id = S.TravelAgent_id;

--view show tourist(id,fname,lname) & National_place(Loc_place,name_place) & Tours(Path)
create VIEW Tourist_tour_info
as
SELECT NPT.Nationalplace_name, NPT.Nationalplac_Loc, NPT.Tourist_id, T.F_Name,T.L_Name,Path
FROM NationalPlace_Tourist NPT
,Tourist T ,NationalPlace_Tour np,Tours TS where NPT.Tourist_id = T.Tourist_id and np.Tour_Code=TS.Code_tour; 

--view show National_place(name,loc,type,history) & Tours(path)  
CREATE VIEW National_tour
as
select Name,Type,Loc,History,Path,Pick_Up,Arrive from
National_place , Tours,NationalPlace_Tour where
Code_tour=Tour_Code and (NationalPlace_Name=Name and NationalPlace_Loc=Loc);

----------------------------------------------------------------------
SELECT * FROM Tourist_Booking_View;
SELECT * FROM Tour_NationalPlace_View;
SELECT * FROM TravelAgent_View;
select *from National_tour;
select* from Tourist_tour_info;


-------------------------------------------------------------------------
-------------------------------------------------------------------


