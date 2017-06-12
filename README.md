# Update

* use alpine 3.3, not sillelien/base-alpine
* support glibc
* replace user nginx with www-data

# alpine-nginx-php
Alpine Linux Docker image (~54.04 MB) running Nginx and PHP 5.6.14  Image suitable for running in Tutum/Kubernetes style hosted distributed environments. 

Image is based on [sillelien/base-alpine](https://hub.docker.com/r/sillelien/base-alpine/) base image which incorporates S6 for process management.

