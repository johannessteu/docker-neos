FROM johannessteu/docker-nginx-php7:latest
MAINTAINER Johannes Steu <js@johannessteu.de>

# Install packages
RUN apk update
RUN cat /etc/apk/repositories
RUN apk --update add  \
    curl bash less mysql-client nginx ca-certificates openssh-client openssl \
    libssh2 libpng libcurl freetype libjpeg-turbo libgcc libxml2 libstdc++ \
    icu-libs libltdl libmcrypt musl libressl2.4-libssl graphicsmagick \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN apk --update add \
    php7-pdo_mysql php7-mysqlnd php7-mysqli php7-sqlite3 php7-pdo_sqlite \
    php7-common  php7-session php7-json php7-zlib php7-xml php7-pdo \
    php7-gd php7-curl php7-opcache php7-ctype php7-mbstring php7-soap \
    php7-intl php7-bcmath php7-dom php7-xmlreader php7-phar php7-openssl \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm && \
    ln -s /usr/lib/php7 /usr/lib/php

ADD /container-files/etc /etc
