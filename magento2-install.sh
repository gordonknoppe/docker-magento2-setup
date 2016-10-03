#!/bin/sh
echo "Sleeping 10 to allow MySQL to boot up..."
sleep 10
echo "Initializing setup..."

DOCUMENT_ROOT=/var/www/html;
MAGENTO="php -d memory_limit=1024M ${DOCUMENT_ROOT}/bin/magento";

if [ -f ${DOCUMENT_ROOT}/app/etc/env.php ]; 
then
    echo "Already installed? app/etc/env.php exists";
    echo "Remove app/etc/env.php to trigger setup:install...";
else
    echo "Running Magento 2 setup:install...";
    ${MAGENTO} setup:install \
      --db-host=$M2SETUP_DB_HOST \
      --db-name=$M2SETUP_DB_NAME \
      --db-user=$M2SETUP_DB_USER \
      --db-password=$M2SETUP_DB_PASSWORD \
      --base-url=$M2SETUP_BASE_URL \
      --backend-frontname=$M2SETUP_BACKEND_FRONTNAME \
      --admin-firstname=$M2SETUP_ADMIN_FIRSTNAME \
      --admin-lastname=$M2SETUP_ADMIN_LASTNAME \
      --admin-email=$M2SETUP_ADMIN_EMAIL \
      --admin-user=$M2SETUP_ADMIN_USER \
      --admin-password=$M2SETUP_ADMIN_PASSWORD \
      --session-save=db
fi 

echo "Flushing cache...";
${MAGENTO} cache:flush

echo "Magento install script has completed execution."
