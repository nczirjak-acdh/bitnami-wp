FROM docker.io/bitnami/minideb:buster
LABEL maintainer "Bitnami <containers@bitnami.com>"

ENV HOME="/" \
    OS_ARCH="amd64" \
    OS_FLAVOUR="debian-10" \
    OS_NAME="linux"

COPY prebuildfs /
# Install required system packages and dependencies
RUN install_packages unzip git acl ca-certificates curl gzip less libaudit1 libbsd0 libbz2-1.0 libc6 libcap-ng0 libcom-err2 libcurl4 libexpat1 libffi6 libfftw3-double3 libfontconfig1 libfreetype6 libgcc1 libgcrypt20 libglib2.0-0 libgmp10 libgnutls30 libgomp1 libgpg-error0 libgssapi-krb5-2 libhogweed4 libicu63 libidn2-0 libjemalloc2 libjpeg62-turbo libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 liblcms2-2 libldap-2.4-2 liblqr-1-0 libltdl7 liblzma5 libmagickcore-6.q16-6 libmagickwand-6.q16-6 libmcrypt4 libmemcached11 libmemcachedutil2 libncurses6 libnettle6 libnghttp2-14 libonig5 libp11-kit0 libpam0g libpcre3 libpng16-16 libpq5 libpsl5 libreadline7 librtmp1 libsasl2-2 libsodium23 libsqlite3-0 libssh2-1 libssl1.1 libstdc++6 libsybdb5 libtasn1-6 libtidy5deb1 libtinfo6 libunistring2 libuuid1 libwebp6 libx11-6 libxau6 libxcb1 libxdmcp6 libxext6 libxml2 libxslt1.1 libzip4 procps tar zlib1g
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "php" "7.4.27-0" --checksum e57e5a9bf4e909e4f7a18341b69a7c0780e13b122b22a78c30ee48653b8d821b
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "apache" "2.4.51-7" --checksum 1b827e70d1633dc9c3035458ccf893dbb0d503b5dbfa01109eecb356e1e1a0db
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "wp-cli" "2.5.0-0" --checksum b2be17e2065fc8d9d1a175e1dbc689e8f6a5543bb3b6a6f5470bc987b7c396ce
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "mysql-client" "10.3.32-0" --checksum 4a211faa9436c9747dfc4374cb9e8a7f9b0065dfc58dd4784cef0f5029c2e65e
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "libphp" "7.4.27-0" --checksum 80dafaf02c34ffd1a419eff8dbd335cb19e4aa30f547256258ec27ac9e60dc49
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "wordpress" "5.8.2-7" --checksum eb41af1445bf778cc83c820b8e1d2311b114287c1c3ab5629be23e80e5bf2935
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "render-template" "1.0.1-4" --checksum 9b09b8c13e726569fd846abef20228b2e29de456805994e512f3b47f74cf742d
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "gosu" "1.14.0-0" --checksum 3e6fc37ca073b10a73a804d39c2f0c028947a1a596382a4f8ebe43dfbaa3a25e
RUN chmod g+rwX /opt/bitnami

COPY rootfs /
RUN bash download-extra.sh
RUN /opt/bitnami/scripts/mysql-client/postunpack.sh
RUN /opt/bitnami/scripts/apache/postunpack.sh
RUN /opt/bitnami/scripts/php/postunpack.sh
RUN /opt/bitnami/scripts/apache-modphp/postunpack.sh
RUN /opt/bitnami/scripts/wordpress/postunpack.sh
ENV ALLOW_EMPTY_PASSWORD="no" \
    APACHE_ENABLE_CUSTOM_PORTS="no" \
    APACHE_HTTPS_PORT_NUMBER="" \
    APACHE_HTTP_PORT_NUMBER="" \
    BITNAMI_APP_NAME="wordpress" \
    BITNAMI_IMAGE_VERSION="5.8.2-debian-10-r38" \
    MARIADB_HOST="mariadb" \
    MARIADB_PORT_NUMBER="3306" \
    MARIADB_ROOT_PASSWORD="" \
    MARIADB_ROOT_USER="root" \
    MYSQL_CLIENT_CREATE_DATABASE_NAME="" \
    MYSQL_CLIENT_CREATE_DATABASE_PASSWORD="" \
    MYSQL_CLIENT_CREATE_DATABASE_PRIVILEGES="ALL" \
    MYSQL_CLIENT_CREATE_DATABASE_USER="" \
    MYSQL_CLIENT_ENABLE_SSL="no" \
    MYSQL_CLIENT_SSL_CA_FILE="" \
    PATH="/opt/bitnami/php/bin:/opt/bitnami/php/sbin:/opt/bitnami/apache/bin:/opt/bitnami/wp-cli/bin:/opt/bitnami/mysql/bin:/opt/bitnami/common/bin:$PATH"

EXPOSE 8080 8443

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/wordpress/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/apache/run.sh"]
