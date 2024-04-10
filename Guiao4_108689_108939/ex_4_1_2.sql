CREATE TABLE Flight(
    Airline int NOT NULL,
    Weekdays int NOT NULL,
    Number int NOT NULL,
    PRIMARY KEY(Number),
);

CREATE TABLE Airport(
    City varchar(255) NOT NULL,
    Country_State varchar(20) NOT NULL,
    Airport_Name varchar(60) NOT NULL,
    Airport_Code int NOT NULL,
	PRIMARY KEY (Airport_Code),
);

CREATE TABLE Fare(
    Code int NOT NULL,
    Restrictions int NOT NULL,
    Amount int NOT NULL,
    Flight_Number int NOT NULL,
	PRIMARY KEY (Flight_Number, Code, Restrictions),
	FOREIGN KEY (Flight_Number) REFERENCES Flight(Number),
);

CREATE TABLE AirplaneType(
    Max_seats INT NOT NULL,
    Company VARCHAR(255) NOT NULL,
    Type_nameAirpType VARCHAR(255) NOT NULL,
    PRIMARY KEY (Type_nameAirpType)
);

CREATE TABLE Airplane(
    Total_number_of_seats INT NOT NULL,
    Airplane_Type_TypeName VARCHAR(255) NOT NULL,
	Airplane_id INT NOT NULL,
    PRIMARY KEY (Airplane_id),
	FOREIGN KEY (Airplane_Type_TypeName) REFERENCES AirplaneType(Type_nameAirpType),
);

CREATE TABLE CanLand(
    Airport_AirportCode int NOT NULL,
    Airplane_Type VARCHAR(255) NOT NULL,
	PRIMARY KEY (Airplane_Type, Airport_AirportCode),
	FOREIGN KEY (Airplane_Type) REFERENCES AirplaneType(Type_nameAirpType),
	FOREIGN KEY (Airport_AirportCode) REFERENCES Airport(Airport_Code)
);

CREATE TABLE Flight_Leg(
    ArrivalAirport INT NOT NULL,
    DepartureAirport INT NOT NULL,
    ScheduledDepartureTime TIME NOT NULL,
    ScheduledArrivalTime TIME NOT NULL,
    Flight_Number INT NOT NULL CHECK (Flight_Number > 0),
	LegNumber INT NOT NULL,
	PRIMARY KEY (LegNumber, Flight_Number),
	FOREIGN KEY (Flight_Number) REFERENCES Flight(Number),  
	FOREIGN KEY (ArrivalAirport) REFERENCES Airport(Airport_Code),
	FOREIGN KEY (DepartureAirport) REFERENCES Airport(Airport_Code),
);

CREATE TABLE Leg_Instance(
    ArrivalTime INT NOT NULL,
    DepartureTime INT NOT NULL,
    NumAvailableSeats INT NOT NULL,
    Date DATE NOT NULL,
    Airplane_Airplane_id INT NOT NULL,
    DepartureAirport INT NOT NULL,
    ArrivalAirport INT NOT NULL,
    Flight_LegNumber INT NOT NULL,
    Flight_FlightNumber INT NOT NULL,
	PRIMARY KEY (Date, Airplane_Airplane_id, DepartureAirport, ArrivalAirport, Flight_LegNumber, Flight_FlightNumber),
	FOREIGN KEY (Airplane_Airplane_id) REFERENCES Airplane(Airplane_id),
	FOREIGN KEY (Flight_LegNumber, Flight_FlightNumber) REFERENCES Flight_Leg(LegNumber, Flight_Number),
);

CREATE TABLE Seat(
    SeatNumber INT NOT NULL,
    CustomerName VARCHAR(60) NOT NULL,
    CustomerPhone VARCHAR(9) NOT NULL,
    LegInstanceDate DATE NOT NULL,
    LegInstanceAirplane_Airplane_id INT NOT NULL,
    DepartureAirport INT NOT NULL,
    ArrivalAirport INT NOT NULL,
    LegInstanceFlight_LegNumber INT NOT NULL,
    LegInstanceFlightLeg_FlightNumber INT NOT NULL,
	PRIMARY KEY (SeatNumber, LegInstanceFlightLeg_FlightNumber),
	FOREIGN KEY (LegInstanceDate,LegInstanceAirplane_Airplane_id, DepartureAirport, ArrivalAirport, LegInstanceFlight_LegNumber, LegInstanceFlightLeg_FlightNumber ) 
		REFERENCES Leg_Instance(Date, Airplane_Airplane_id, DepartureAirport, ArrivalAirport, Flight_LegNumber, Flight_FlightNumber),
);