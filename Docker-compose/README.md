Deploy MongoDB and MongoExpress on Docker containers, we can use Docker Compose to define and run multi-container Docker applications.
  
 MongoDB is a NoSQL database ,MongoDB stores data in a document-oriented format, using JSON-like objects 
 MongoExpress is a web-based administrative interface for MongoDB. It provides a user-friendly graphical interface to interact with MongoDB databases, allowing developers and administrators to perform administrative tasks without needing to use the MongoDB shell or write complex queries.
 
 Steps: 
 
 1.  Create a docker-compose.yml file
 2. Start the containers with Docker Compose
 docker-compose up -d
 
 This will download the required images (if they are not already available), create the containers, and start them in detached mode.
 
 3. . Access MongoExpress
 http://localhost:8081
 mongoexpress : admin,pass
 
 4. Stop the Containers
 docker-compose down
 
 
 mongoexpress : admin,pass
