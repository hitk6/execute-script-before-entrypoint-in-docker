FROM httpd

#COPY /usr/local/apache2/htdocs/ 

RUN mkdir /entrypoint-scripts

COPY init /usr/local/bin/httpd-foreground


ENTRYPOINT ["/usr/local/bin/httpd-foreground"]

