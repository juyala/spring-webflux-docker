# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="JuyalA"

ENV APP_HOME=/usr/app/

ENV JAR_FILE=build/libs/gs-reactive-rest-service-0.1.0.jar

WORKDIR $APP_HOME

#COPY build.gradle settings.gradle gradlew $APP_HOME
#COPY gradle $APP_HOME/gradle
#RUN ./gradlew build

COPY . $APP_HOME

RUN chmod +x gradlew

RUN ./gradlew build

RUN mv build/libs/gs-reactive-rest-service-0.1.0.jar spring-webflux.jar

# Add a volume pointing to /tmp
#VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","spring-webflux.jar"]