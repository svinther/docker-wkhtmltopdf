FROM ubuntu:18.04

LABEL maintainer="Steffen Vinther Sørensen <svinther@gmail.com>"

RUN apt -y update && apt -y install \
lighttpd \
libterm-readline-perl-perl \
wget \
&& lighty-enable-mod cgi \
&& lighty-enable-mod rewrite \
&& wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb \
&& apt -y install ./wkhtmltox_0.12.5-1.bionic_amd64.deb \
&& rm -f ./wkhtmltox_0.12.5-1.bionic_amd64.deb \
&& apt -y remove libterm-readline-perl-perl wget \
&& apt -y autoremove \
&& rm -rf /var/lib/apt/lists/*

RUN sed -i '/^server.errorlog.*/d'  /etc/lighttpd/lighttpd.conf  \
&& echo 'url.rewrite-once += ( "/convert" => "/cgi-bin/cgiscript.sh" )' >> /etc/lighttpd/lighttpd.conf

ADD cgiscript.sh /var/www/html/cgi-bin/
RUN chmod +x /var/www/html/cgi-bin/cgiscript.sh

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

