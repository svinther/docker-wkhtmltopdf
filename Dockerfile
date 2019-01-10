FROM svinther/docker-cgi-microservice

LABEL maintainer="Steffen Vinther Sørensen <svinther@gmail.com>"

RUN apt -y update && apt -y install \
curl \
&& curl -s -L -o pack.deb https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb \
&& apt -y install ./pack.deb \
&& rm -f ./pack.deb \
&& apt -y remove curl \
&& apt -y autoremove \
&& rm -rf /var/lib/apt/lists/*

COPY service.sh /var/www/html/cgi-bin/
RUN chmod +x /var/www/html/cgi-bin/service.sh
