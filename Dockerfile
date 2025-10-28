# Use the Eclipse temurin alpine official image
# https://hub.docker.com/_/eclipse-temurin
FROM eclipse-temurin:21-jdk-alpine

# Create and change to the app directory.
WORKDIR /app

# Copy local code to the container image.
COPY . ./

# Build the app.
RUN chmod +x mvnw
RUN mvn -B -DskipTests clean dependency:list install -DoutputFile=target/mvn-dependency-list.log

# Run the quarkus app 
CMD ["sh", "-c", "java -jar target/quarkus-app/quarkus-run.jar"]