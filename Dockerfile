FROM tomcat:9.0-jdk11-corretto

ADD http://tb.plazi.org/GgServer/TbBasic.zip TbBasic.zip

RUN jar xf TbBasic.zip && cd webapps && mkdir GgServer && cd GgServer && jar xf ../../GgServerWeb.zip \
    && cp ../../GgServerWeb.docs.zip ./ && java -jar Extender.jar GgServerWeb.docs.zip

RUN mkdir /usr/local/GgServer && cd /usr/local/GgServer && jar xf ../tomcat/GgServer.zip && jar tf ../tomcat/GgServer.docs.zip

# fixing typo in default config file
RUN cd /usr/local/GgServer && mv config.cnfg config.cnfg-orig && cat config.cnfg-orig | sed 's/\.derby\.jar/derby\.jar/' > config.cnfg

COPY setup.gg /usr/local/GgServer

RUN cd /usr/local/GgServer && cat setup.gg | java -jar GgServer.jar

COPY start-gg-back-and-web.sh /usr/local/bin

RUN chmod +x /usr/local/bin/start-gg-back-and-web.sh

CMD ["/usr/local/bin/start-gg-back-and-web.sh"]