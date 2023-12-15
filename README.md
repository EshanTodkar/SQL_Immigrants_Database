# SQL_Immigrants_Database

This database will focus on entities such as immigrants, family members, country of origin, employment history, education history, visa types, citizenship status, contact information, legal documents, and port of entry records. The purpose of this database is to provide a centralized repository of information that can benefit immigrants, recruiters, researchers, government organizations, and various stakeholders to offer valuable insights into immigration trends and patterns.  

# Benefits:

•	Employers can use this data for recruitment job opportunities.
•	Policymakers can track how many immigrants have entered the country under which visa and analyze the impact of immigration policies on different immigrant groups. 
•	Researchers can mine the data to gain insights into immigration trends. 
•	Social service organizations can utilize the database to allocate resources and provide support to immigrant communities.
•	Authorities can use the database to monitor and manage immigration-related security concerns more effectively, and it can also provide data for assessing the economic contributions of immigrants, including tax revenue, entrepreneurship, and job creation. 
•	Immigrants can easily access their personal records, immigration status, and legal documents, reducing the complexity of navigating immigration bureaucracy, and access to educational and employment history can help them identify opportunities for career growth and educational advancement. 

# Entities:

•	Immigrants
•	Family members
•	Country of origin
•	Employment history
•	Education history
•	Visa types
•	Citizenship status
•	Contact information
•	Legal documents
•	Port of entrys

1.	Immigrants Table:
•	immigrant_id (Primary Key)
•	first_name
•	last_name
•	date_of_birth
•	country_of_origin
•	arrival_date
•	visa_type
•	status (e.g., resident, non-resident, citizen)
•	address
•	contact_info

2.	Visa Types Table:
•	visa_type_id (Primary Key)
•	visa_category
•	Description

3.	Countries of Origin Table:
•	country_id (Primary Key)
•	country_name
•	Continent

4.	Arrival Ports Table:
•	port_id (Primary Key)
•	port_name
•	state
•	country

5.	Family Members Table:
•	family_member_id (Primary Key)
•	immigrant_id (Foreign Key referencing Immigrants Table)
•	relationship
•	first_name
•	last_name
•	date_of_birth

6.	Employment History Table:
•	employment_id (Primary Key)
•	immigrant_id (Foreign Key referencing Immigrants Table)
•	employer_name
•	job_title
•	start_date
•	end_date

7.	Education History Table:
•	education_id (Primary Key)
•	immigrant_id (Foreign Key referencing Immigrants Table)
•	school_name
•	degree
•	major
•	graduation_date

8.	Citizenship Status Table:
•	citizenship_status_id (Primary Key)
•	immigrant_id (Foreign Key referencing Immigrants Table)
•	status
•	date_granted

9.	Legal Documents Table:
•	document_id (Primary Key)
•	immigrant_id (Foreign Key referencing Immigrants Table)
•	document_type (e.g., passport, visa, green card)
•	document_number
•	issue_date
•	expiration_date
