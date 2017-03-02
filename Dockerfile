FROM ubuntu:16.04
MAINTAINER Altair Six

RUN apt-get update && apt-get install -y nginx unzip

#
# configure nginx
#

EXPOSE 80
ADD swagger /etc/nginx/sites-available/
ADD nginx.sh /bin/nginx.sh
RUN rm -rf /etc/nginx/sites-enabled/default && \
	ln -s /etc/nginx/sites-available/swagger /etc/nginx/sites-enabled/swagger && \
	echo 'daemon off;' >> /etc/nginx/nginx.conf

#
# download swagger content
#

WORKDIR /public
ADD https://github.com/wordnik/swagger-ui/archive/master.zip /public/
RUN unzip master.zip && \
	mv swagger-ui-master/dist swagger && \
	rm -rf swagger-ui-master master.zip

CMD [ "/bin/nginx.sh" ]

