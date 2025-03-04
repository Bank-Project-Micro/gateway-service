
FROM maven:3.9.2-eclipse-temurin-21-alpine AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests


FROM eclipse-temurin:21-jdk-jammy
WORKDIR /app
COPY --from=build /app/target/gateway-service.jar app.jar
EXPOSE 8989
ENTRYPOINT ["java", "-jar", "app.jar"]
