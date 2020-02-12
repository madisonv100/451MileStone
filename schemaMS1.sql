

CREATE TABLE User (	 
	userID			INTEGER PRIMARY KEY,
	dateJoined 		DATE,
	fName			VARCHAR (25),
	lName        	VARCHAR (25),
	averageStar		FLOAT,    
    numberOfFans	INTEGER			

)
--We cant enforce total participation of the users in the enters relation 

CREATE TABLE Vote(
	userID			INTEGER NOT NULL,
	countOfVote		INTEGER,
	type			VARCHAR(20),
	PRIMARY KEY(userID),
	FOREIGN KEY (userID) REFERENCES(User)
)
CREATE TABLE HasFriend
(
	userID			INTEGER,
	userID2			INTEGER,
	PRIMARY KEY (userID2,userID),
	FOREIGN KEY (userID) REFERENCES(User)
	FOREIGN KEY (userID2) REFERENCES(User)

)

CREATE TABLE Location(
	userID 			INTEGER,
	longitude 		INTEGER,
	lagitude 		INTEGER,
	FOREIGN KEY (userID) REFERENCES User(userID)
)

-- No relation for the identifying relationship "enters"

CREATE TABLE Tip(
	businessID      INTEGER NOT NULL,
	userID			INTEGER NOT NULL,
	totalTipLike	INTEGER,
	totalTipCount   INTEGER,
	datMade 		DATE,
	textContent		TEXT,
	PRIMARY KEY(userID,businessID),
	FOREIGN KEY (userID) REFERENCES User(userID),
	FOREIGN KEY (businessID) REFERENCES Business(businessID)
)
-- We cant enforece the total particpation of the USER makes relation
-- No relation for the indetifying relatioship set "like", "make", and "belong"


CREATE TABLE Business(
	businessID		INT(30) PRIMARY KEY,
	isOpen 			BOOLEAN,
	postalCode		INT(5),
	name 			VARCHAR(30),
	checkInNum		INTEGER,
	reviewCount		INTEGER,
	state			VARCHAR(15),
	city			VARCHAR(15),
	Address			TEXT,
	stars			FLOAT,
	longitude		DECIMAL,
	lagitude		DECIMAL,

)
-- We cant enforece total participation of the schedule in the have relation
--We cant enforce total participtaiton of the Attribute in the has relation

CREATE TABLE Category(
	businessID		INT(30),
	cName			VARCHAR(30),
	PRIMARY KEY (businessID, cName),
	FOREIGN KEY (businessID) REFERENCES Business(businessID)
)
)

CREATE TABLE MakeTip(
	userID			INT(30),
	businessID		INT(30),
	PRIMARY KEY (userID,businessID),
	FOREIGN KEY (userID) REFERENCES User(userID),
	FOREIGN KEY (businessID) REFERENCES Business(businessID)
)

CREATE TABLE Schedule(
	businessID		INT(30) NOT NULL,
	day				CHAR(10) UNIQUE,
	sTime			TIME,
	eTime			TIME,
	PRIMARY KEY(businessID),
	FOREIGN KEY (businessID) REFERENCES Business(businessID) 

)
--No relation for identifying relation set have 

CREATE TABLE Attribute(
	businessID		INT(30) NOT NULL,
	aName			CHAR(15),
	value			VARCHAR (50),
	PRIMARY KEY (businessID,aName),
	FOREIGN KEY (businessID) REFERENCES Business(businessID)
)
--No relation for identifying relation set has

