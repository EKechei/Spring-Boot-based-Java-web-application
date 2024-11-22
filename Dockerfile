# Use a base image with OpenJDK 11 (you can change the version if needed)
FROM openjdk:11-jre-slim

# Specify the path to the artifact (Spring Boot JAR file)
ARG artifact=target/webapp-0.0.1-SNAPSHOT.jar

# Set the working directory inside the container
WORKDIR /opt/app

# Copy the JAR file from the target directory into the container
COPY ${artifact} app.jar


# Command to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
