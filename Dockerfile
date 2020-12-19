FROM openjdk:11
MAINTAINER 'Bel Sahn'
EXPOSE 8080

RUN apt-get update && apt-get install -y unzip
WORKDIR /gradle
RUN curl -L https://services.gradle.org/distributions/gradle-5.6.4-bin.zip -o gradle-5.6.4-bin.zip
RUN unzip gradle-5.6.4-bin.zip
ENV GRADLE_HOME=/gradle/gradle-5.6.4
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version

ARG HOME=/app

ENV SERVER_PORT=8080
ENV logFilePath=${HOME}/logs
ENV LOGBACK_APPENDER=STDOUT
ENV ENV=default

WORKDIR ${HOME}
COPY . ${HOME}

RUN gradle clean build -x test --refresh-dependencies
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar","/app/build/libs/spring-sql-gradle-producer-1.0-SNAPSHOT.jar"]
