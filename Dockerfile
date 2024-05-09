FROM ubuntu:latest as build
COPY . ./
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk-headless && \
    apt-get install -y maven
RUN mvn package

FROM lscr.io/linuxserver/code-server:latest
COPY --from=build target/client-jar-with-dependencies.jar .
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-17-jdk-headless && \
    sudo apt-get install -y maven