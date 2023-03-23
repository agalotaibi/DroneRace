![fec6916c8ccf202889e69635c27c3378](https://user-images.githubusercontent.com/68162866/226647953-642d5fc2-bb6d-4c92-b8bf-e985ab1779fc.jpg)

# DroneRace
DroneRace is an API that contains drone pilots information and drone performance level.

## Tools Used
1. Vapor
2. Postico
3. PostgreSQL 
4. Postman

## Functions
1. POST data into the pilot and drone database.
2. UPDATE data in the pilot and drone database.
3. DELETE data from the pilot and drone database.
4. GET all data from the pilot and drone database
5. GET data of a certain pilot or drone from the database using ID.

## ER digram 
<img width="596" alt="Screenshot 2023-03-21 at 3 38 02 PM" src="https://user-images.githubusercontent.com/68162866/226635040-38c925e9-6499-46fe-bf0e-a722e6190403.png">

## Routs
### Drone

**Input:** http://127.0.0.1:8080/drone

**Output:**
The output depends on the CRUD opration. 
- GET + URL: returns everything 
- GET + URL + ID: returns data of a certin drone
- POST + URL: adds data to the database
- DELETE + URL: deletes data from the database
- DELETE + URL + ID: deletes data of a certin drone

-----------------------------

### Pilot
**Input:** http://127.0.0.1:8080/pilot

**Output:**
The output depends on the CRUD opration. 
- GET + URL: returns everything 
- GET + URL + ID: returns data of a certin pilot
- POST + URL: adds data to the database
- DELETE + URL: deletes data from the database
- DELETE + URL + ID: deletes data of a certin pilot

## GET Comand Demo
https://user-images.githubusercontent.com/68162866/226897142-39b69208-fd6c-46fb-ba10-0c0601ffdfc4.mp4

## POST Comand Demo
https://user-images.githubusercontent.com/68162866/226898657-196e34f6-8a49-4a01-ba28-4f3dad44fedd.mp4

