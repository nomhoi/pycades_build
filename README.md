# pycades_build

### pycades

https://docs.cryptopro.ru/cades/pycades

Сборка модуля:

    docker build -t pycades .

Запуск контейнера:

    docker run -v `pwd`/code:/code -it --rm --name pycades pycades bash

Установка тестового сертификата:

    /opt/cprocsp/bin/amd64/cryptcp -createcert -dn "CN=test" -provtype 80 -cont '\\.\HDIMAGE\test' -ca https://cryptopro.ru/certsrv

### pycryptoprosdk

В ветке pycryptoprosdk пример с библиотекой https://github.com/Keyintegrity/pycryptoprosdk.

    docker build -t pycryptoprosdk .
    docker run -v `pwd`/code:/code -it --rm --name pycryptoprosdk pycryptoprosdk bash
    # /opt/cprocsp/bin/amd64/cryptcp -createcert -dn "CN=test" -provtype 80 -cont '\\.\HDIMAGE\test' -ca https://cryptopro.ru/certsrv
    # python sample_pycryptoprosdk.py