FROM tomcat:9.0-jdk11-corretto

RUN mkdir ../install

WORKDIR ../install

ADD http://tb.plazi.org/GgServer/TbLocalPlazi.zip TbBasic.zip

RUN jar xf TbBasic.zip && cd ../tomcat/webapps && mkdir GgServer && cd GgServer && jar xf ../../../install/GgServerWeb.zip \
    && cp ../../../install/GgServerWeb.docs.zip ./ && java -jar Extender.jar GgServerWeb.docs.zip

RUN mkdir /usr/local/GgServer && cd /usr/local/GgServer && jar xf ../install/GgServer.zip && \
    jar xf ../install/GgServer.docs.zip && jar xf ../install/GgServer.doc.plaziSrs.zip

# fixing typo in default config file
RUN cd /usr/local/GgServer && mv config.cnfg config.cnfg-orig && cat config.cnfg-orig | sed 's/\.derby\.jar/derby\.jar/' > config.cnfg

COPY setup.gg /usr/local/GgServer

RUN cd /usr/local/GgServer && cat setup.gg | java -jar GgServer.jar

COPY start-gg-back-and-web.sh /usr/local/bin

RUN chmod +x /usr/local/bin/start-gg-back-and-web.sh

CMD ["/usr/local/bin/start-gg-back-and-web.sh"]