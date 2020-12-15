# pycades_build

Сборка модуля:

    docker build -t pycades .

Запуск контейнера:

    docker run -v `pwd`/code:/code -it --rm --name pycades pycades bash

Установка тестового сертификата:

    /opt/cprocsp/bin/amd64/cryptcp -createcert -dn "CN=test" -provtype 80 -cont '\\.\HDIMAGE\test' -ca https://cryptopro.ru/certsrv
