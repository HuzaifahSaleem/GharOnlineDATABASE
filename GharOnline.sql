create schema gharonline;
use gharonline;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Agency (
    AgencyNo INT(10),
    Fname VARCHAR(15),
    Location VARCHAR(25),
    NoofAgents INT(5),
    primary key (AgencyNo)
);

CREATE TABLE Agents (
    AgentID INT(10),
    AgencyNo INT(10),
    Fname VARCHAR(25),
    Email VARCHAR(35),
    DOB DATE,
    Gender VARCHAR(10),
    HireDate DATE,
    PRIMARY KEY (AgentID),
    FOREIGN KEY (AgencyNo)
	REFERENCES Agency (AgencyNo)
);

CREATE TABLE Accounts (
    agentID INT(10),
    BasicPay DECIMAL,
    Bonus DECIMAL,
    DurationOfContract VARCHAR(20),
    ExtraBenefits VARCHAR(10),
    TotalSalary DECIMAL,
    FOREIGN KEY (agentID)
        REFERENCES Agents (AgentID)
);

CREATE TABLE Dependants (
    Fname VARCHAR(25),
    AgentID INT(10),
    Age INT(5),
    FOREIGN KEY (AgentID)
        REFERENCES Agents (AgentID)
);

CREATE TABLE POwner (
    OwnerID INT(10) auto_increment,
    Fname VARCHAR(25),
    Email VARCHAR(35),
    ContactNo INT(21),
    PRIMARY KEY (OwnerID)
);


CREATE TABLE Property (
    propertyID INT(10) NOT NULL auto_increment,
    AgencyNo INT(10),
    Location VARCHAR(35),
    OwnerID INT(10),
    PRIMARY KEY (propertyID),
    FOREIGN KEY (ownerID)
        REFERENCES POwner (ownerID),
	FOREIGN KEY (AgencyNo)
        REFERENCES Agency (AgencyNo)
);

CREATE TABLE OnBuying (
    PropertyID INT(10),
    AgencyNo INT(10),
    OwnerID INT(10),
    Location VARCHAR(35),
    Price DECIMAL,
    DateofPurchase DATE,
    AmountLeft DECIMAL,
    AmountPaid DECIMAL,
    CONSTRAINT c1 CHECK (price <> 0),
    FOREIGN KEY (PropertyID)
        REFERENCES Property (propertyID),
    FOREIGN KEY (OwnerID)
        REFERENCES POwner (ownerID),
	FOREIGN KEY (AgencyNo)
        REFERENCES Agency (AgencyNo)
);

CREATE TABLE OnRent (
    PropertyID INT(10),
    AgencyNo INT(10),
    OwnerID INT(10),
    Location VARCHAR(35),
    RentalStatus VARCHAR(10),
    RentalCost DECIMAL,
    DAteOfRent DATE,
    EndingDate DATE,
    AmountPaid DECIMAL,
    AmountLeft DECIMAL,
    CONSTRAINT c2 CHECK (RentalCost <> 0),
    FOREIGN KEY (PropertyID)
        REFERENCES Property (propertyID),
    FOREIGN KEY (OwnerID)
        REFERENCES POwner (ownerID),
	FOREIGN KEY (AgencyNo)
        REFERENCES Agency (AgencyNo)
);


CREATE TABLE customer (
    customerID INT(10) NOT NULL,
    Fname VARCHAR(25) NOT NULL,
    Email VARCHAR(35),
    ContactNo INT(15),
    PRIMARY KEY (customerID)
);

CREATE TABLE Orders (
    orderID INT(10) NOT NULL,
    customerID INT(10),
    PropertyID INT(10),
    TimeOfORder DATE,
    PRIMARY KEY (orderID),
    FOREIGN KEY (customerID)
        REFERENCES customer (customerID),
    FOREIGN KEY (propertyID)
        REFERENCES property (propertyID)
);

Insert into Agency values (10001, "ShahEnterprises", "Block-5, Sector A, DHA-II", 2);
Insert into Agency values (10002, "MalikDealers", "Block-1, Sector J, DHA-II", 2);
Insert into Agency values (10003, "MeeluEstate", "Block-3, Sector E, DHA-II", 2);

Insert into Agents values (001, 10001, "Usman Shah", "usman001@gmail.com", '1984-11-01', "Male", '2009-01-05');
Insert into Agents values (002, 10001, "Umar Shah", "umar002@gmail.com", '1980-05-17', "Male", '2009-01-01');
Insert into Agents values (011, 10002, "Haider Khan", "haider011@gmail.com", '1971-04-01', "Male", '2011-03-11');
Insert into Agents values (012, 10002, "Faraz Ahmed", "faraz012@gmail.com", '1954-07-01', "Male", '2001-06-02');
Insert into Agents values (021, 10003, "Mirza Ishtiaq", "mirza021@gmail.com", '1981-01-01', "Male", '2014-05-30');
Insert into Agents values (022, 10003, "Mansoor Ahmed", "usman022@gmail.com", '1984-11-01', "Male", '2016-02-17');

update Agents
set Email = "Mansoor022@gmail.com"
where Email = "usman022@gmail.com";

Insert into Accounts values (001,100000, 0, "NIL", "NIL", 100000);
Insert into Accounts values (002,50000, 0, "NIL", "NIL", 50000);
Insert into Accounts values (011,70000, 0, "NIL", "NIL", 70000);
Insert into Accounts values (012,65000, 0, "NIL", "NIL", 65000);
Insert into Accounts values (021,45000, 0, "NIL", "NIL", 45000);
Insert into Accounts values (022,70000, 0, "NIL", "NIL", 70000);

Insert into Dependants values ("Tahir Usman", 001, 06);
Insert into Dependants values ("Abdullah Umar", 002, 20);
Insert into Dependants values ("Shees Haider", 011, 14);
Insert into Dependants values ("Mirza Ali", 021, 11);
Insert into Dependants values ("Shahrukh Mansoor", 022, 15);
Insert into Dependants values ("Ahmed Mansoor", 022, 21);
Insert into Dependants values ("Ahmed Faraz", 012, 23);

Insert into POwner values (20001, "Zlatan Ibrahimovic", "Z09@gmail.com", 05210349);
Insert into POwner values (20002, "John Cena", "Youcantseeme@gmail.com", 02791343);
Insert into POwner values (20003, "Dwayne Johnson", "Canyousmell@gmail.com", 06432192);
Insert into POwner values (20004, "Marshal Bruce", "rapgod@gmail.com", 09123543);
Insert into POwner values (20005, "Ali Zafar", "rockstar@gmail.com", 06699123);
Insert into POwner values (20006, "Atif Aslam", "adathogyihai@gmail.com", 05286264);
Insert into POwner values (20007, "Sonu Nigam", "kalhonaho@gmail.com", 00152763);
Insert into POwner values (20008, "Abdullah Qureshi", "sufi@gmail.com", 05922313);
Insert into POwner values (20009, "Shahmeer Aziz", "silencer@gmail.com", 02636455);
Insert into POwner values (20010, "Saleem Akhtar", "saleemawan58@gmail.com", 05436758);

Insert into Customer values (120370, "Ahmed Mujtaba" , "AhmedM@gmail.com", 09523648);
Insert into Customer values (120371, "Ali Tariq" , "AliT@gmail.com", 09125677);
Insert into Customer values (120372, "Muhammad Waleed" , "MuhammadW@gmail.com", 09431687);
Insert into Customer values (120373, "Anas Iqbal" , "AnasIM@gmail.com", 09123123);
Insert into Customer values (120374, "Anas Tehseen" , "AnasT@gmail.com", 09147147);
Insert into Customer values (120375, "Sohaib Anwar" , "SohaibA@gmail.com", 09159951);
Insert into Customer values (120376, "Muhammad Uzair" , "MUzair@gmail.com", 09156423);
Insert into Customer values (120377, "Ali Haider" , "AliH@gmail.com", 09784512);
Insert into Customer values (120378, "Qambar Rizvi" , "QRizvi@gmail.com", 09316497);

Insert into Property values (15,10001, "Akbar Boulevard, Sector-A, DHA-II", 20001);
Insert into Property values (25,10001, "Power Avenue, Sector-G, DHA-II", 20002);
Insert into Property values (35,10002, "Lane 10, Sector-E, DHA-II", 20003);
Insert into Property values (45,10002, "Jinnah Boulevard, Sector-F, DHA-II", 20004);
Insert into Property values (55,10002, "Street-14, Sector-G, DHA-II", 20005);
Insert into Property values (65,10002, "Street-5, Sector-D, DHA-II", 20006);
Insert into Property values (75,10001, "Lane 5, Sector-E, DHA-II", 20007);
Insert into Property values (85,10003, "Street-1, Sector-B, DHA-II", 20008);
Insert into Property values (95,10001, "Lane 6, Sector-C, DHA-II", 20009);
Insert into Property values (105,10003, "Lane 4, Sector-H, DHA-II", 20010);

Insert into OnRent values (15, 10001,20001, "Akbar Boulevard, Sector-A, DHA-II", "Available",55000,NULL,NULL,0,0);
Insert into OnRent values (35, 10002,20003, "Lane 10, Sector-E, DHA-II", "Available",50000,NULL,NULL,0,0);
Insert into OnRent values (55, 10002,20005,"Street-14, Sector-G, DHA-II", "Occupied",55000,'2015-11-01','2017-11-01',350000,0);
Insert into OnRent values (75, 10001,20007,"Lane 5, Sector-E, DHA-II", "Available",50000,NULL,NULL,0,0);

Insert into OnBuying values (25, 10001,20002, "Power Avenue, Sector-G, DHA-II", 45000000,NULL,0,0);
Insert into OnBuying values (45, 10002,20004, "Jinnah Boulevard, Sector-F, DHA-II", 41000000,NULL,0,0);
Insert into OnBuying values (65, 10002,20006, "Street-5, Sector-D, DHA-II", 40000000,NULL,0,0);
Insert into OnBuying values (85, 10003,20008, "Street-1, Sector-B, DHA-II", 42000000,NULL,0,0);
Insert into OnBuying values (105,10003,20010, "Lane 4, Sector-H, DHA-II" , 41500000,NULL,0,0);

Insert into Orders values (1000, 120371, 15, '2017-01-10');
Insert into Orders values (1001, 120372, 25, '2016-12-01');
Insert into Orders values (1002, 120377, 105, '2016-11-10');

create view PropertyAvailableForSale
as
select *
from OnBuying
where onbuying.DateofPurchase = NULL;

create view PropertyAvalaibleForRent
as
select *
from OnRent
where OnRent.RentalStatus = "Available";

create view NoofOrders
as 
select *
from Orders;

create view CustomersWhoHaveOrdered
as 
select Customer.customerID, Customer.Fname
from orders join customer using (customerID)
where Orders.customerID = customer.customerID;

create view PropertyWhichHasBeenOrdered
as 
select property.propertyID,property.Location
from property join orders using (propertyID)
where property.propertyID = orders.PropertyID;

Create Trigger T1
after delete on Agents
for each row
update Agency
set NoofAgents = NoofAgents - 1
where Agents.AgencyNo = Agency.AgencyNo;

Create Trigger T2
after insert on Agents
for each row
update Agency
set NoofAgents = NoofAgents + 1
where Agents.AgencyNo = Agency.AgencyNo;