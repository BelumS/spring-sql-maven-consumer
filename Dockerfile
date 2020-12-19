FROM openjdk:11
MAINTAINER 'Bel Sahn'
EXPOSE 8080

RUN apt-get update && apt-get install -y unzip
RUN apt-get install tree

WORKDIR /mvn
RUN curl -L https://apache.osuosl.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip -o apache-maven-3.6.3-bin.zip
RUN unzip apache-maven-3.6.3-bin.zip
ENV MAVEN_HOME=/mvn/apache-maven-3.6.3
ENV PATH=$PATH:$MAVEN_HOME/bin
RUN mvn --version

ARG HOME=/app

ENV SERVER_PORT=8080
ENV logFilePath=${HOME}/logs
ENV LOGBACK_APPENDER=STDOUT
ENV ENV=default

WORKDIR ${HOME}
COPY . ${HOME}

RUN mvn clean install -DskipTests -Dlicense.skip=true -DcheckStyle.skip=true
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar","/app/target/spring-sql-maven-consumer-0.0.1-SNAPSHOT.jar"]
