FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=orm
ENV MYSQL_USER=u
ENV MYSQL_PASSWORD=pw

COPY ./mysql/init/*.sql ./docker-entrypoint-initdb.d/
