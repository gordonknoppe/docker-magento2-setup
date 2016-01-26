FROM ecg/magento2-php-fpm:7.0-fpm
MAINTAINER Gordon Knoppe <gknoppe@magento.com>

ADD ./magento2-install.sh /usr/local/bin/magento2-install.sh

CMD ["/usr/local/bin/magento2-install.sh"]
