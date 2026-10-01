# Car Rental Database

This is a MySQL database project for a car rental system.

The database contains rental locations across Ireland and generated test data for customers, cars, reservations, services, feedback and messages.

## Features

- Customer and administrator accounts
- Car and car type management
- Rental locations across Ireland
- Car reservations
- Car service records
- Customer feedback and messages
- Primary and foreign key relationships
- Generated sample data for testing
- Passwords stored as hashes
- Stored procedures for main database operations

## Stored Procedures

The project includes stored procedures for:

- Registering a new customer
- Adding a new car
- Creating a car reservation
- Scheduling a car for service
- Checking car availability for selected dates

The reservation and service procedures check for date conflicts to prevent a car from being booked or serviced when it is not available.

## Database Tables

- Administrator
- Customer
- Car
- CarType
- Reservation
- Location
- County
- Service
- Feedback
- Message

## Technologies

- MySQL
- SQL
- MySQL Workbench
- MariaDB

## Test Data

Customer details, reservations, services, feedback and messages in this project are generated sample data used for testing and demonstration purposes.
