#!/bin/bash
##download required plugins for fundament theme

curl -o /tmp/svg-support.2.3.19.zip https://downloads.wordpress.org/plugin/svg-support.2.3.19.zip
curl -o /tmp/shortcoder.5.6.zip https://downloads.wordpress.org/plugin/shortcoder.5.6.zip
curl -o /tmp/insert-headers-and-footers.1.6.0.zip https://downloads.wordpress.org/plugin/insert-headers-and-footers.1.6.0.zip
curl -o /tmp/wp-mail-smtp.3.2.1.zip https://downloads.wordpress.org/plugin/wp-mail-smtp.3.2.1.zip
curl -o /tmp/polylang.3.1.3.zip https://downloads.wordpress.org/plugin/polylang.3.1.3.zip
unzip /tmp/svg-support.2.3.19.zip -d /opt/bitnami/wordpress/wp-content/plugins
unzip /tmp/shortcoder.5.6.zip -d /opt/bitnami/wordpress/wp-content/plugins
unzip /tmp/insert-headers-and-footers.1.6.0.zip -d /opt/bitnami/wordpress/wp-content/plugins
unzip /tmp/wp-mail-smtp.3.2.1.zip -d /opt/bitnami/wordpress/wp-content/plugins
unzip /tmp/polylang.3.1.3.zip -d /opt/bitnami/wordpress/wp-content/plugins
sleep 5
##download fundament theme
mkdir /opt/bitnami/wordpress/wp-content/themes/fundament
git clone https://github.com/acdh-oeaw/fundament_wp /opt/bitnami/wordpress/wp-content/themes/fundament
ls -la /tmp
unzip /tmp/polylang.3.1.2223.zip -d /opt/bitnami/wordpress/wp-content/plugins
ls -la /opt/bitnami/wordpress/wp-content/plugins
sleep 10