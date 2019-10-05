FROM ubuntu:bionic

RUN apt-get update \
 && apt-get install -y sudo openjdk-8-jdk curl apt-transport-https ca-certificates software-properties-common unzip \
 && sudo add-apt-repository ppa:mmk2410/intellij-idea \
 && echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list \
 && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add \
 && apt-get update \
 && apt-get install -y intellij-idea-community

RUN addgroup --gid 1000 ubuntu \
 && useradd -u 1000 -m -d /home/ubuntu -s /bin/bash -g ubuntu ubuntu \
 && echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu \
 && chmod 0440 /etc/sudoers.d/ubuntu

USER ubuntu

WORKDIR /home/ubuntu

COPY . /home/ubuntu/

RUN sudo apt-get install -y sbt \
 && sudo chown -R ubuntu . \
 && curl -L "https://plugins.jetbrains.com/pluginManager?action=download&id=org.intellij.scala&build=$(cat /opt/intellij-idea-community/build.txt)" > scala-plugin.zip \
 && mkdir -p .IdeaIC2019.2/config/plugins \
 && unzip scala-plugin.zip -d .IdeaIC2019.2/config/plugins \
 && rm scala-plugin.zip

CMD ["/usr/bin/intellij-idea-community"]

