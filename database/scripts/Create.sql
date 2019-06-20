create table Users (
	userId int not null auto_increment,
	userLogin varchar(64) not null,
	userPassword varchar(64) not null,
	userFirstName varchar(50),
	userLastName varchar(50),
	userEmail varchar(64),
	
	primary key (userId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table Regions (
	regionId int not null auto_increment,
	regionName varchar(100) not null,
	
	primary key (regionId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table Cities (
	cityId int not null auto_increment,
	regionId int not null,
	cityName varchar(100) not null,
	
	primary key (cityId),
	foreign key (regionId) references Regions(regionId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table PlaceTypes (
	placeTypeId int not null auto_increment,
	placeTypeName varchar(100) not null,
	
	primary key (placeTypeId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table Places (
	placeId int not null auto_increment,
	cityId int not null,
	placeTypeId int not null,
	placeName varchar(100) not null,
	address varchar(100),
	mapX decimal(9,6),
	mapY decimal(9,6),
	normalPrice decimal(5,2) not null,
	openingTime time,
	closingTime time,
	avgTimeSpent decimal(4,2),
	
	primary key (placeId),
	foreign key (cityId) references Cities (cityId),
	foreign key (placeTypeId) references PlaceTypes (placeTypeId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table Events (
	eventId int not null auto_increment,
	eventName varchar(100) not null,
	
	primary key (eventId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table Orders (
	orderId int not null auto_increment,
	userId int not null,
	orderPrice decimal(6,2) not null,
	
	primary key (orderId),
	foreign key (userId) references Users (userId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table Tickets (
	ticketId int not null,
	orderId int not null,
	userId int not null,
	ticketPrice decimal(5,2) not null,
	
	primary key (ticketId, orderId),
	foreign key (userId) references Users (userId),
	foreign key (orderId) references Orders (orderId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create table Comments (
	commentId int not null auto_increment,
	userId int not null,
	placeId int not null,
	content varchar(500) not null,
	
	primary key (commentId),
	foreign key (userId) references Users (userId),
	foreign key (placeId) references Places (placeId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';


create table Surveys (
	userId int not null,
	placeId int not null,
	contentPath varchar(100) not null,
	
	primary key (userId, placeId),
	foreign key (userId) references Users (userId),
	foreign key (placeId) references Places (placeId)
)
CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_polish_ci';

create unique index Users_Index on Users(userLogin, userPassword);
create unique index Places_Index on Places(mapX, mapY);
create unique index Regions_Index on Regions(regionId);
create unique index Cities_Index on Cities(cityId);
create unique index PlaceTypes_Index on PlaceTypes(placeTypeId);
create unique index Events_Index on Events(eventId);
create unique index Orders_Index on Orders(orderId);
create unique index Tickets_Index on Tickets(orderId);
create unique index Comments_Index on Comments(placeId);
create unique index Surveys_Index on Surveys(placeId);
