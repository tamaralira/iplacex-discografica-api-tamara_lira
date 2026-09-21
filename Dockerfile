FROM gradle:8.5-jdk17 AS build
WORKDIR /app
COPY discografia ./discografia   
WORKDIR /app/discografia         
RUN gradle build --no-daemon

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/discografia/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
