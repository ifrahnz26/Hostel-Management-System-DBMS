-- Create User Table
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Create Admin Table
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL
);

-- Create Room Table
CREATE TABLE Room (
    RoomNumber VARCHAR(10) PRIMARY KEY,
    RoomType VARCHAR(20) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Availability VARCHAR(20) NOT NULL,
    AC ENUM('Yes', 'No') NOT NULL,
    Balcony ENUM('Yes', 'No') NOT NULL,
    BuildingName VARCHAR(50) NOT NULL
);
-- Create Booking Table
CREATE TABLE Booking (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    RoomNumber VARCHAR(10) NOT NULL,
    BookingDate DATE NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
);

-- Create Food Table
CREATE TABLE Food (
    FoodID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL,
    MealsPerDay INT NOT NULL,
    CostPerDay DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
);

-- Create Payment Table
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMode ENUM('Card', 'UPI', 'Cash') NOT NULL,
    PaymentStatus ENUM('Paid', 'Pending') NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);


-- Insert Sample Data into User Table
INSERT INTO User (Name, Email, Password, PhoneNumber, Address) VALUES
('Rahul Kumar', 'rahul@ex.com', 'pass123', '+91-9876543210', '123, ABC Nagar, Delhi'),
('Priya Sharma', 'priya@ex.com', 'pass456', '+91-9988776655', '456, XYZ Colony, Mumbai'),
('Amit Verma', 'amit@ex.com', 'pass789', '+91-9123456789', '789, Oak Street, Bangalore'),
('Esha Gupta', 'esha@ex.com', 'pass111', '+91-9871234560', '101, Pearl Avenue, Jaipur'),
('Ravi Patel', 'ravi@ex.com', 'pass222', '+91-9654321987', '202, Mango Lane, Ahmedabad'),
('Anjali Mehta', 'anjali@ex.com', 'pass333', '+91-9786541230', '303, Lotus Road, Pune');

-- Insert Sample Data into Admin Table
INSERT INTO Admin (Name, Email, Password, PhoneNumber) VALUES
('Kiran Desai', 'kiran@ex.com', 'admin123', '+91-9845012345'),
('Meera Iyer', 'meera@ex.com', 'admin456', '+91-9945123456'),
('Raj Malhotra', 'raj@ex.com', 'admin789', '+91-9789012345');

-- Insert Sample Data into Room Table
INSERT INTO Room (RoomNumber, RoomType, Price, Availability, AC, Balcony, BuildingName) VALUES
('A101', 'Single', 2200.00, 'Occupied', 'Yes', 'Yes', 'A Block'),
('A102', 'Single', 1800.00, 'Occupied', 'Yes', 'No', 'A Block'),
('A103', 'Single', 1600.00, 'Available', 'No', 'Yes', 'A Block'),
('A104', 'Single', 1200.00, 'Available', 'No', 'No', 'A Block'),
('A105', 'Single', 1800.00, 'Occupied', 'Yes', 'No', 'A Block'),
('A106', 'Single', 1600.00, 'Available', 'No', 'Yes', 'A Block'),
('B101', 'Double', 1800.00, 'Occupied', 'Yes', 'Yes', 'B Block'),
('B102', 'Double', 1400.00, 'Available', 'Yes', 'No', 'B Block'),
('B103', 'Double', 1200.00, 'Available', 'No', 'Yes', 'B Block'),
('B104', 'Double', 800.00, 'Available', 'No', 'No', 'B Block'),
('B105', 'Double', 1400.00, 'Occupied', 'Yes', 'No', 'B Block'),
('B106', 'Double', 1200.00, 'Available', 'No', 'Yes', 'B Block'),
('C101', 'Dormitory', 1500.00, 'Available', 'Yes', 'Yes', 'C Block'),
('C102', 'Dormitory', 1100.00, 'Available', 'Yes', 'No', 'C Block'),
('C103', 'Dormitory', 900.00, 'Available', 'No', 'Yes', 'C Block'),
('C104', 'Dormitory', 500.00, 'Available', 'No', 'No', 'C Block'),
('C105', 'Dormitory', 1100.00, 'Available', 'Yes', 'No', 'C Block'),
('C106', 'Dormitory', 900.00, 'Available', 'No', 'Yes', 'C Block');
