# docker-wkhtmltopdf

Dockerized wkhtmltopdf accepting html input on http port 80

Very simple, no error handling or any other complicated stuff

Installing the static wkhtmltopdf binary, as the standard ubuntu 
package can not run without a X11 environment 

## Usage

    docker run -d -p 8080:80 svinther/docker-wkhtmltopdf

cURL example:

    curl -H "Expect:" --data-binary @filename.html  http://localhost:8080/convert
    

## More


