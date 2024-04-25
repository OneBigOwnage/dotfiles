FROM php:8.3.3-alpine3.19

RUN apk add --no-cache curl

RUN apk add --no-cache --virtual .build-deps curl && \
    curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar && \
    chmod +x phpactor.phar && \
    mv phpactor.phar /usr/local/bin/phpactor && \
    apk del .build-deps && \
    rm -rf /tmp/* /var/cache/apk/*

CMD [ "phpactor", "language-server" ]
