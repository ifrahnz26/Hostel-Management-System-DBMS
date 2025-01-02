

# Serene Stays: A Modern Approach to Hostel Administration

## Project Overview

**Serene Stays** is a dynamic web-based hostel management system designed to simplify hostel operations such as room assignments, student bookings, food services, payments, and administrative tasks. This project leverages **Eclipse IDE** for development, runs on an **Apache Tomcat server**, and uses **MySQL** for the backend database.

---

## Contributors
- Ifrah Naaz – 1MS22CS064 [https://github.com/ifrahnz26]
- Lekhya Biridepalli – 1MS22CS079 [https://github.com/LekhyaBiridepalli]

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
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 29 39 AM" src="https://github.com/user-attachments/assets/3bd025a4-f5df-43d2-b166-64e4cf5def7a" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 30 12 AM" src="https://github.com/user-attachments/assets/345afa42-dc97-4f59-a7ed-d2cc96c7368e" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 33 37 AM" src="https://github.com/user-attachments/assets/db7e4ff7-07f6-4f3c-a36b-d9ac3917f473" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 34 05 AM" src="https://github.com/user-attachments/assets/0fe72ea7-0c1a-42c8-9315-ef3a391808d3" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 34 18 AM" src="https://github.com/user-attachments/assets/3f818222-bb7d-4e03-b7db-54a95657ba54" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 34 55 AM" src="https://github.com/user-attachments/assets/781a6b93-0b5c-4d30-a7f6-c3a96be40235" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 32 34 AM" src="https://github.com/user-attachments/assets/63d3851a-036d-4f4b-b54e-4816e59f19bc" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 38 35 AM" src="https://github.com/user-attachments/assets/7329fd96-a688-4aaa-ae60-f9156fa75d8d" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 36 39 AM" src="https://github.com/user-attachments/assets/3d994931-8ad2-4957-9fcd-0bca1ce649f8" />
<img width="400" height ="250" alt="Screenshot 2024-12-11 at 11 36 25 AM" src="https://github.com/user-attachments/assets/05e28bf8-4f3e-48a8-996c-7357f2242b12" />
<img width="400" height ="250" alt="Screenshot 2025-01-02 at 7 18 18 PM" src="https://github.com/user-attachments/assets/b4e65aa8-a33c-49f5-bb33-6dc6bb55a1d4" />
<img width="400" height ="250" alt="Screenshot 2025-01-02 at 9 18 11 AM" src="https://github.com/user-attachments/assets/567651e6-1855-4f56-9d3d-dab9fd04122d" />

---

## Prerequisites

- **Eclipse IDE** with Java EE support
- **Apache Tomcat Server** (version 9 or above)
- **MySQL** (version 8 or above)
- **Java Development Kit (JDK)** (version 11 or above)

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

## License

This project is licensed under the [MIT License](LICENSE).

---

Let me know if you'd like help customizing further!
