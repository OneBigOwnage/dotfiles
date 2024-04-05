FROM php:8.3.3-alpine3.19

RUN apk add --no-cache curl

RUN curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
RUN chmod +x phpactor.phar
RUN mv phpactor.phar /usr/local/bin/phpactor

CMD [ "phpactor", "language-server" ]
