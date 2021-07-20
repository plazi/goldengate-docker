FROM tomcat:9.0-jdk11-openjdk-buster

RUN mkdir ../install

WORKDIR /usr/local/install

# still used for GgServer.doc.plaziSrs.zip
ADD http://tb.plazi.org/GgServer/TbLocalPlazi.zip TbBasic.zip

RUN jar xf TbBasic.zip && cd ../tomcat/webapps 

RUN apt update && apt install -y ant

COPY ./idaho-core ./idaho-core
COPY ./goldengate-server ./goldengate-server
COPY ./goldengate-server-docs ./goldengate-server-docs

RUN cd idaho-core && ant

RUN cd goldengate-server && ant

RUN cd goldengate-server-docs && ant

COPY ./GgServerWebapp /usr/local/tomcat/webapps/GgServer/ 

RUN mkdir /usr/local/GgServer && cd /usr/local/GgServer && jar xf ../install/goldengate-server/dist/GgServer.zip && \
    jar xf ../install/goldengate-server-docs/dist/GgServer.docs.zip && jar xf ../install/GgServer.doc.plaziSrs.zip

# fixing typo in default config file
RUN cd /usr/local/GgServer && mv config.cnfg config.cnfg-orig && cat config.cnfg-orig | sed 's/\.derby\.jar/derby\.jar/' > config.cnfg

COPY setup.gg /usr/local/GgServer

RUN cd /usr/local/GgServer && cat setup.gg | java -jar GgServer.jar

RUN chmod +x /usr/local/GgServer/bin/ggsc

COPY start-gg-back-and-web.sh /usr/local/bin

RUN chmod +x /usr/local/bin/start-gg-back-and-web.sh

CMD ["/usr/local/bin/start-gg-back-and-web.sh"]
