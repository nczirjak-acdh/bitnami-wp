#!/bin/bash

echo "-----------------WP ACDH PLUGINS file"
/opt/bitnami/wp-cli/bin/wp plugin activate polylang
/opt/bitnami/wp-cli/bin/wp plugin activate svg-support
/opt/bitnami/wp-cli/bin/wp plugin activate shortcoder
/opt/bitnami/wp-cli/bin/wp plugin activate insert-headers-and-footers
/opt/bitnami/wp-cli/bin/wp plugin activate wp-mail-smtp
/opt/bitnami/wp-cli/bin/wp theme activate fundament

sleep 10
