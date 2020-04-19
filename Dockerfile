FROM tomcat:8.0

ADD ./webapp/taarget/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]