/*Creating new schema for project*/

CREATE SCHEMA immigrants;

/*Creating tables from defined ER diagram*/

CREATE TABLE Immigrants (
	immigrant_id INT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_origin VARCHAR(255),
	arrival_date DATE,
	visa_type INT,
	status VARCHAR(255) NOT NULL,
	contact_info INT,
    port_id INT
);

CREATE TABLE VisaTypes ( 
	visa_type_id INT PRIMARY KEY,
	visa_category VARCHAR(255) NOT NULL,
	visa_description VARCHAR(255)
);

CREATE TABLE CountriesOfOrigin ( 
	country_id INT PRIMARY KEY,
	country_name VARCHAR(255) NOT NULL,
	continent VARCHAR(255)
);

CREATE TABLE ArrivalPorts ( 
	port_id INT PRIMARY KEY,
	port_name VARCHAR(255) NOT NULL,
	state VARCHAR(255),
    country VARCHAR(255),
    arrival_date DATE
);

CREATE TABLE FamilyMembers (
	family_member_id INT PRIMARY KEY,
	immigrant_id INT,
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE EmploymentHistory (
	employment_id INT PRIMARY KEY,
	immigrant_id INT,
	employer_name VARCHAR(255) NOT NULL,
	job_title VARCHAR(255) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL
);

 CREATE TABLE EducationHistory (
	education_id INT PRIMARY KEY,
	immigrant_id INT,
	school_name VARCHAR(255) NOT NULL,
	degree VARCHAR(255) NOT NULL,
	major VARCHAR(255) NOT NULL, 
	graduation_date VARCHAR(255) NOT NULL
);

CREATE TABLE CitizenshipStatus (
	citizenship_status_id INT PRIMARY KEY,
	immigrant_id INT,
	status VARCHAR(255) NOT NULL,
	date_granted DATE NOT NULL
);

CREATE TABLE LegalDocuments (
  document_id INT PRIMARY KEY,
  immigrant_id INT,
  document_type VARCHAR(255) NOT NULL,
  document_number VARCHAR(255) NOT NULL,
  issue_date DATE NOT NULL,
  expiration_date DATE NOT NULL
);

CREATE TABLE ContactInformation (
	contact_id INT PRIMARY KEY,
	address VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone_number VARCHAR(255) NOT NULL
);

/*Adding foreign key constraints */

ALTER TABLE familymembers
ADD FOREIGN KEY (immigrant_id) REFERENCES immigrants(immigrant_id);

ALTER TABLE employmenthistory
ADD FOREIGN KEY (immigrant_id) REFERENCES immigrants(immigrant_id);

ALTER TABLE educationhistory
ADD FOREIGN KEY (immigrant_id) REFERENCES immigrants(immigrant_id);

ALTER TABLE citizenshipstatus
ADD FOREIGN KEY (immigrant_id) REFERENCES immigrants(immigrant_id);

ALTER TABLE legaldocuments
ADD FOREIGN KEY (immigrant_id) REFERENCES immigrants(immigrant_id);

/*Inserting values into tables*/

INSERT INTO CountriesOfOrigin (country_id,country_name,continent)
VALUES
(1,'USA', 'North America'),
(2,'Canada', 'North America'),
(3,'France', 'Europe'),
(4,'Germany', 'Europe'),
(5,'Japan', 'Asia'),
(6,'Brazil', 'South America'),
(7,'Australia', 'Oceania'),
(8,'South Africa', 'Africa'),
(9,'India', 'Asia'),
(10,'Mexico', 'North America'),
(11,'South Korea', 'Asia'),
(12,'Italy', 'Europe'),
(13,'Russia', 'Europe');

INSERT INTO VisaTypes (visa_type_id,visa_category, visa_description)
VALUES
(1,'B-1', 'Business Visitor - Business-related activities, such as conferences and negotiations'),
(2,'B-2', 'Tourist/Visitor for Pleasure - Tourism, vacation, or visits with friends and relatives'),
(3,'F-1', 'Student - Academic studies at a U.S. educational institution'),
(4,'H-1B', 'Specialty Occupation Worker - Employment in a specialty occupation requiring a higher education degree'),
(5,'J-1', 'Exchange Visitor - Educational and cultural exchange programs, including students and researchers'),
(6,'L-1', 'Intracompany Transferee - Intra-company transfer of employees within multinational companies'),
(7,'O-1', 'Extraordinary Ability or Achievement - Individuals with extraordinary ability or achievement in their field'),
(8,'K-1', 'Fiancé(e) of U.S. Citizen - Fiancé(e) coming to the U.S. to get married'),
(9,'U', 'Crime Victim - Victims of certain crimes willing to assist law enforcement'),
(10,'Green Card', 'Lawful Permanent Resident - Permanent residency in the U.S.');

INSERT INTO ArrivalPorts (port_id, port_name, state, country, arrival_date)
VALUES
(1, 'Port of Los Angeles', 'California', 'USA', '2023-01-01'),
(2, 'Port of Long Beach', 'California', 'USA', '2023-01-02'),
(3, 'Port of New York and New Jersey', 'New York', 'USA', '2023-01-03'),
(4, 'Port of Savannah', 'Georgia', 'USA', '2023-01-04'),
(5, 'Port of Houston', 'Texas', 'USA', '2023-01-05'),
(6, 'Port of Seattle', 'Washington', 'USA', '2023-01-06'),
(7, 'Port of Charleston', 'South Carolina', 'USA', '2023-01-07'),
(8, 'Port of Miami', 'Florida', 'USA', '2023-01-08'),
(9, 'Port of San Francisco', 'California', 'USA', '2023-01-09'),
(10, 'Port of Boston', 'Massachusetts', 'USA', '2023-01-10');

INSERT INTO Immigrants (immigrant_id,first_name, last_name, date_of_birth, country_of_origin, arrival_date, visa_type, status, contact_info,port_id)
VALUES
(123123,'John', 'Doe', '1990-05-15', 'Canada', '2022-01-01', 1, 'Active', 1,1),
(123124,'Jane', 'Smith', '1985-08-20', 'India', '2021-12-15', 2, 'Inactive', 2, 2),
(123125,'Carlos', 'Garcia', '1992-03-10', 'Mexico', '2022-02-28', 3, 'Active', 3, 3),
(123126,'Aisha', 'Khan', '1988-12-05', 'Pakistan', '2022-03-15', 4, 'Active', 4, 4),
(123127,'Alex', 'Wong', '1995-06-30', 'China', '2021-11-10', 5, 'Inactive', 5, 5),
(123128,'Elena', 'Martinez', '1993-09-25', 'Spain', '2022-04-20', 6, 'Active', 6, 6),
(123129,'Ahmed', 'Ali', '1987-04-12', 'Egypt', '2021-10-05', 7, 'Inactive', 7, 7),
(123130,'Yuki', 'Tanaka', '1994-02-18', 'Japan', '2022-05-12', 8, 'Active', 8, 8),
(123133,'Anna', 'Novak', '1991-07-08', 'Russia', '2021-09-01', 9, 'Active', 9, 9),
(123134,'Miguel', 'Lopez', '1986-11-03', 'Mexico', '2022-06-08', 10, 'Inactive', 10, 10);

INSERT INTO ContactInformation (contact_id, address, email, phone_number)
VALUES
  (1,'123 Elm St, Springfield, IL 62704', 'john.doe@email.com', '+1234567890'),
  (2,'456 Oak Ave, Lexington, KY 40502', 'jane.smith@email.com', '+0987654321'),
  (3,'789 Pine Dr, Boulder, CO 80301', 'sam.jackson@email.com', '+1122334455'),
  (4,'321 Maple Ln, Raleigh, NC 27601', 'emily.white@email.com', '+9876543210'),
  (5,'654 Birch Blvd, Portland, OR 97201', 'michael.green@email.com', '+5678901234'),
  (6,'876 Cedar Ct, Austin, TX 78701', 'olivia.brown@email.com', '+1234509876'),
  (7,'109 Pine St, Tampa, FL 33602', 'daniel.jones@email.com', '+6789012345'),
  (8,'543 Oak Rd, Atlanta, GA 30301', 'sophia.smith@email.com', '+3456789012'),
  (9,'987 Maple Ave, Denver, CO 80202', 'logan.miller@email.com', '+2109876543'),
  (10,'210 Elm Blvd, Seattle, WA 98101', 'amelia.davis@email.com', '+8765432109');
  
INSERT INTO EducationHistory (education_id, immigrant_id, school_name, degree, major, graduation_date)
VALUES
  (1, 123123, 'Harvard University', 'Bachelor of Science', 'Computer Science', '2020-05-15'),
  (2, 123124, 'University of Oxford', 'Bachelor of Arts', 'English Literature', '2019-12-20'),
  (3, 123125, 'INSEAD', 'Master of Business Administration', 'Business Administration', '2021-06-30'),
  (4, 123126, 'Massachusetts Institute of Technology (MIT)', 'Bachelor of Engineering', 'Mechanical Engineering', '2018-08-10'),
  (5, 123127, 'University of Tokyo', 'Bachelor of Science', 'Biomedical Sciences', '2022-04-25'),
  (6, 123128, 'Stanford University', 'Master of Science', 'Data Science', '2020-10-05'),
  (7, 123129, 'University of Cambridge', 'Master of Arts', 'Psychology', '2019-06-15'),
  (8, 123130, 'London School of Economics and Political Science (LSE)', 'Bachelor of Business Administration', 'Marketing', '2021-02-28'),
  (9, 123133, 'ETH Zurich', 'Master of Engineering', 'Civil Engineering', '2017-07-12'),
  (10, 123134, 'Sorbonne University', 'Bachelor of Arts', 'History', '2022-01-08');
  
INSERT INTO EmploymentHistory (employment_id, immigrant_id, employer_name, job_title, start_date, end_date)
VALUES
  (1, 123123, 'Tech Corp', 'Software Engineer', '2018-05-15', '2021-08-20'),
  (2, 123124, 'Global Finance Ltd', 'Financial Analyst', '2017-12-10', '2020-06-30'),
  (3, 123125, 'Marketing Solutions Inc', 'Marketing Manager', '2019-03-01', '2022-01-15'),
  (4, 123126, 'Manufacturing Innovations', 'Mechanical Engineer', '2016-08-25', '2019-11-30'),
  (5, 123127, 'BioHealth Research Labs', 'Biomedical Scientist', '2020-02-15', '2023-05-10'),
  (6, 123128, 'Data Analytics Co', 'Data Scientist', '2019-07-01', '2022-09-30'),
  (7, 123129, 'MindWorks Psychology Clinic', 'Clinical Psychologist', '2018-06-15', '2021-12-31'),
  (8, 123130, 'Digital Marketing Pro', 'Marketing Specialist', '2020-03-01', '2022-11-30'),
  (9, 123133, 'City Engineering Services', 'Civil Engineer', '2015-09-12', '2018-12-20'),
  (10, 123134, 'Historical Archives Foundation', 'Archivist', '2021-02-01', '2023-04-15');
  
/* Adding relationship attribute since it did not exist*/

ALTER TABLE familymembers
ADD relationship varchar(255);

INSERT INTO FamilyMembers (family_member_id, immigrant_id, relationship, first_name, last_name, date_of_birth)
VALUES
  (1, 123123, 'Spouse', 'Mary', 'Doe', '1985-03-12'),
  (2, 123123, 'Child', 'Emma', 'Doe', '2010-08-25'),
  (3, 123124, 'Parent', 'Robert', 'Smith', '1950-11-18'),
  (4, 123125, 'Sibling', 'Lisa', 'Garcia', '1990-06-03'),
  (5, 123126, 'Spouse', 'David', 'Khan', '1982-09-20'),
  (6, 123127, 'Child', 'Sophie', 'Wong', '2015-04-15'),
  (7, 123128, 'Parent', 'Emily', 'Martinez', '1968-07-28'),
  (8, 123129, 'Sibling', 'Alex', 'Ali', '1988-12-10'),
  (9, 123130, 'Spouse', 'Oliver', 'Tanaka', '1980-05-03'),
  (10, 123133, 'Child', 'Ava', 'Novak', '2000-02-14');
  
INSERT INTO LegalDocuments (document_id, immigrant_id, document_type, document_number, issue_date, expiration_date)
VALUES
  (1, 123123, 'Passport', 'AB123456', '2019-05-15', '2024-05-14'),
  (2, 123123, 'Visa', 'X987654', '2020-01-10', '2022-01-09'),
  (3, 123123, 'Green Card', 'GC456789', '2018-06-30', '2028-06-29'),
  (4, 123124, 'Driver License', 'DL789012', '2017-08-10', '2023-08-09'),
  (5, 123125, 'Work Permit', 'WP345678', '2021-04-25', '2023-04-24'),
  (6, 123126, 'ID Card', 'ID123456', '2019-10-05', '2024-10-04'),
  (7, 123127, 'Residence Permit', 'RP987654', '2018-06-15', '2023-06-14'),
  (8, 123128, 'Social Security Card', 'SSC456789', '2020-02-28', '2030-02-27'),
  (9, 123130, 'Visa', 'V123456', '2017-07-12', '2022-07-11'),
  (10, 123133, 'ID Card', 'ID789012', '2022-01-08', '2027-01-07'),
  (11, 123125, 'ID Card', 'ID199456', '2021-10-05', '2024-10-04'),
  (12, 123127, 'ID Card', 'ID156456', '2020-10-05', '2024-10-04');
  
INSERT INTO citizenshipstatus (citizenship_status_id, immigrant_id, status, date_granted)
VALUES 
	('1',123123,'Granted','2023-01-15'),
    ('2',123124,'Pending','2021-02-20'),
    ('3',123125,'Granted','2020-03-05'),
    ('4',123126,'Denied','2014-04-10'),
    ('5',123127,'Granted','2017-05-18'),
    ('6',123128,'Pending','2023-06-25'),
    ('7',123129,'Granted','2020-07-30'),
    ('8',123130,'Denied','2019-08-12'),
    ('9',123133,'Granted','2017-09-03'),
    ('10',123134,'Pending','2005-10-22');
