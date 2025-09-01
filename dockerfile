# Start from an official JDK image
FROM openjdk:17-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy the jar file built by Maven
COPY target/simple-hello-1.0.0.jar app.jar

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
