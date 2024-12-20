

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

## Project Setup

### Step 1: Clone the Repository
1. Clone the repository:
   ```bash
   git clone https://github.com/ifrahnz26/hostel-management-system-dbms.git
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


