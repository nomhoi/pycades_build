# pycades_build

Сборка модуля:

    docker build -t pycades .

Запуск контейнера:

    docker run -v `pwd`/code:/code -it --rm --name pycades pycades bash 