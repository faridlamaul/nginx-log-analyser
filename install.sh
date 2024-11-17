#!/bin/sh

readonly NGINX_LOG_ANALYSER_URL="https://raw.githubusercontent.com/faridlamaul/nginx-log-analyser/main/nginx-log-analyser.sh"
readonly NGINX_LOG_ANALYSER_DIRECTORY="/usr/local/bin"

if [ ${EUID} -ne 0 ]; then
    echo "This script must be run as root. Cancelling" >&2
    exit 1
fi

if [ -f "${NGINX_LOG_ANALYSER_DIRECTORY}/nginx-log-analyser" ]; then
    echo "Nginx Log analyser tool is already installed."
    exit 0
fi

echo "Installing Nginx Log analyser tool..."

curl -sL "${NGINX_LOG_ANALYSER_URL}" -o "${NGINX_LOG_ANALYSER_DIRECTORY}/nginx-log-analyser"
chmod +x "${NGINX_LOG_ANALYSER_DIRECTORY}/nginx-log-analyser"

echo "Nginx Log analyser tool has been installed to ${NGINX_LOG_ANALYSER_DIRECTORY}/nginx-log-analyser" 