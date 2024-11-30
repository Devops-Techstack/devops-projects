Docker Compose is a tool used for defining and running multi-container Docker applications. With Docker Compose, you can define a multi-container environment in a single YAML file (typically docker-compose.yml) and then spin up all the services and dependencies with a single command. It simplifies the process of managing complex applications that require multiple containers, such as databases, caches, message brokers, and web servers, by automating the setup and configuration.

Key Concepts:
Services: Each container or group of containers in a Compose setup is defined as a "service". A service could be a web server, a database, a cache, etc. Docker Compose allows you to define all of them in one file.

Networks: Docker Compose automatically creates a network for the services to communicate with each other. If necessary, you can define your own custom networks.

Volumes: Docker Compose lets you define volumes for persistent data storage. This ensures that data is retained across container restarts.

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
