# Use the official OpenJDK 21 JDK image from Docker Hub
FROM openjdk:21-jdk

# Copy the compiled JAR file from the target directory of your build context
COPY target/dockerboot.jar .

# Expose port 3000 to the outside world
EXPOSE 3000

# Specify the command to run your application when the container starts
ENTRYPOINT ["java", "-jar", "dockerboot.jar"]