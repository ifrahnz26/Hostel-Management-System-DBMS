

# Serene Stays: A Modern Approach to Hostel Administration

## Project Overview

**Serene Stays** is a dynamic web-based hostel management system designed to simplify hostel operations such as room assignments, student bookings, food services, payments, and administrative tasks. This project leverages **Eclipse IDE** for development, runs on an **Apache Tomcat server**, and uses **MySQL** for the backend database.

---

## Features

### General Features:
- **Room and Booking Management**: Real-time availability, streamlined booking, and check-in/out processes.
- **Food Service Management**: Seamless meal bookings during stays.
- **Role-based Access**: Separate dashboards for hostel administrators and residents.

### User Interface:
- **Resident Login**: Dashboard with personal details, room assignments, and payment history.
- **Admin Login**: Tools for managing rooms, users, and bookings.

---

## Screenshots
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 29 39 AM" src="https://github.com/user-attachments/assets/4f893481-d929-4e36-87bc-48c333152bd5" />
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 30 12 AM" src="https://github.com/user-attachments/assets/37925a4a-3d38-4242-b208-ae63a6f53228" />
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 34 05 AM" src="https://github.com/user-attachments/assets/f6f274c3-b27e-466a-b75f-524aa59a0121" />
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 34 18 AM" src="https://github.com/user-attachments/assets/56e5386a-0d34-4ed2-92fd-3e0299d93438" />
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 34 55 AM" src="https://github.com/user-attachments/assets/64d9702b-59c4-40c6-85b1-53cdb5990c2a" />
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 38 35 AM" src="https://github.com/user-attachments/assets/f81bdc3d-65ce-436d-9260-7faba03e5683" />
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 36 39 AM" src="https://github.com/user-attachments/assets/575b885c-f47b-4c1e-83ad-17e2f5ddbf47" />
<img width="500" height = "300" alt="Screenshot 2024-12-11 at 11 36 25 AM" src="https://github.com/user-attachments/assets/14b63002-1744-4ebb-a08a-76a76e9bbbef" />




---

## Project Setup

### Step 1: Clone the Repository
1. Clone the repository:
   ```bash
   git clone https://github.com/ifrahnz26/Hostel-Management-System-DBMS.git
   ```
2. Import the project into Eclipse:
   - Open Eclipse and navigate to `File > Import > Existing Projects into Workspace`.
   - Select the cloned repository folder.

---

### Step 2: Set Up the Database
1. Log in to MySQL:
   ```bash
   mysql -u root -p
   ```
2. Create the database:
   ```sql
   CREATE DATABASE hostelproj;
   USE hostelproj;
   ```
3. Import the schema:
   ```bash
   source /path/to/schema.sql;
   ```

---

### Step 3: Configure the Project
1. Open the `src/main/webapp/WEB-INF/web.xml` file in Eclipse and update database connection parameters if necessary.
2. Ensure the MySQL JDBC driver is added to your project’s build path:
   - Download the driver (`mysql-connector-java-x.x.xx.jar`) and add it to the project `Libraries`.

---

### Step 4: Deploy to Apache Tomcat
1. Add Apache Tomcat to Eclipse:
   - Go to `Window > Preferences > Server > Runtime Environments`.
   - Click `Add`, choose `Apache Tomcat`, and provide the installation directory.
2. Deploy the project:
   - Right-click on the project in the Project Explorer.
   - Select `Run As > Run on Server`.
   - Choose `Apache Tomcat Server` and click `Finish`.

---

### Step 5: Access the Application
1. Start the Tomcat server if it’s not already running.
2. Open a browser and navigate to:  
   `http://localhost:8080/serene-stays`

---

## Database Design

### Tables
1. **User Table**: Stores resident details like name, email, and contact info.
2. **Admin Table**: Maintains administrator records.
3. **Booking Table**: Tracks booking details.
4. **Room Table**: Lists available rooms.
5. **Food Table**: Manages meal services.
6. **Payment Table**: Logs payments, including modes and statuses.

---

## Technologies Used

- **Frontend**: JSP, HTML, CSS
- **Backend**: Java (Servlets, JSP)
- **Database**: MySQL
- **Server**: Apache Tomcat
- **IDE**: Eclipse

---

## Contributors
- Ifrah Naaz – 1MS22CS064
- Lekhya Biridepalli – 1MS22CS079


