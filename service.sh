#!/bin/bash

echo "Content-type: application/pdf"
echo

exec /usr/local/bin/wkhtmltopdf - -

