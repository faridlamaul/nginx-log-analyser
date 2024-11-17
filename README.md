## NGINX Log Analyser

This tool is used to analyse NGINX logs and generate a report based on the analysis. The tool will read the NGINX logs from a given directory and generate a report that includes the following information:

#### Installation
```bash
$ curl -s https://raw.githubusercontent.com/faridlamaul/nginx-log-analyser/main/install.sh | sudo bash
```

#### Usage
```bash
$ nginx-log-analyser -f <log_file> -t <top_n>
```

#### Example Output
```
  Top 5 IP addresses with the most requests:
  178.128.94.113 - 1087 requests
  142.93.136.176 - 1087 requests
  138.68.248.85 - 1087 requests
  159.89.185.30 - 1086 requests
  86.134.118.70 - 277 requests

  Top 5 most requested paths:
  /v1-health - 4560 requests
  / - 270 requests
  /v1-me - 232 requests
  /v1-list-workspaces - 127 requests
  /v1-list-timezone-teams - 75 requests

  Top 5 response status codes:
  200 - 5740 requests
  404 - 937 requests
  304 - 621 requests
  400 - 192 requests
  "-" - 31 requests

  Top 5 user agents:
  DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com) - 4347 requests
  Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 - 513 requests
  Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 - 332 requests
  Custom-AsyncHttpClient - 294 requests
  Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 - 282 requests
```

This project is part of [Roadmap.sh](https://roadmap.sh/projects/nginx-log-analyser) which is a community-driven project that aims to help developers to choose the right path in the software development field.