FROM nginx:alpine
USER root

# App src files
ARG app_src_files=/simple-web/app/src
ENV APP_SRC_FILES=$app_src_files

COPY ${APP_SRC_FILES} /usr/share/nginx/html