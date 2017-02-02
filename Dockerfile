FROM ubuntu:16.04
MAINTAINER Jeganathan Swaminathan <jegan@tektutor.org>

RUN useradd -ms /bin/bash jenkins 
RUN echo "jenkins:jenkins" | chpasswd
RUN adduser jenkins sudo

RUN apt-get -y update && apt-get -y install default-jdk
RUN apt-get -y update && apt-get -y install maven 
RUN apt-get -y update && apt-get -y install git 

RUN mkdir -p /home/jenkins/workspace/JanDevOpsWithDockerDemo
RUN chown jenkins:jenkins /home/jenkins/workspace/JanDevOpsWithDockerDemo
RUN mkdir -p /home/jenkins/crm
RUN chown jenkins:jenkins /home/jenkins/crm

COPY . /home/jenkins/crm

RUN apt-get -y update && apt-get -y install openssh-server
RUN mkdir -p /var/run/sshd

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
