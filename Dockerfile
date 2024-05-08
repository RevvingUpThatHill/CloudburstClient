FROM lscr.io/linuxserver/code-server:latest
COPY target/client-jar-with-dependencies.jar .
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-17-jdk-headless