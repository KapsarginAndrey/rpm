# Задание

создать свой RPM (можно взять свое приложение, либо собрать к примеру апач с определенными опциями)
создать свой репо и разместить там свой RPM реализовать это все либо в вагранте, либо развернуть у себя через nginx и дать ссылку на репо
реализовать дополнительно пакет через docker

# Выполнение

С помощью vagrantfile создается виртуалка с последующим запуском скрипта.
С помощью скрипта скачивает SRC nginx и OPEN SSL и собирается RPM образ с встроенным openssl 1.1.1k версии
И создается локальный репозиторий 


Вывод:

nginx version: nginx/1.20.0
built by gcc 4.8.5 20150623 (Red Hat 4.8.5-44) (GCC)
built with OpenSSL 1.1.1k  25 Mar 2021
TLS SNI support enabled


# Docker

Для проверки докера надо запустить команду 

docker run -d -p 8080:80 kapsarginae/nginxotus

Вывод: 
CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS                  NAMES
adcab105680b        kapsarginae/nginxotus   "nginx"             3 minutes ago       Up 3 minutes        0.0.0.0:8080->80/tcp   pensive_austin 
