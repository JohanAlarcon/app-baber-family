
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/default-ssl.conf

# Usamos la imagen oficial de PHP 8.1 con Apache
FROM php:8.1-apache

# Instalar extensiones necesarias para Laravel
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    nano \
    && docker-php-ext-install intl pdo_mysql zip

# Instalar Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar NodeJS y npm para construir los assets (en caso de usar Vite/Webpack)
# (Esto instala Node.js 18.x, que es LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Habilitar mod_rewrite de Apache (necesario para Laravel)
RUN a2enmod rewrite

# Copiamos los archivos del proyecto al contenedor
# Nota: Se hará la copia más abajo con docker-compose usando volumes
#       Aquí podrías hacer una copia fija, pero se sugiere trabajar con volúmenes.
# COPY . /var/www/html

# Establecemos el directorio de trabajo
WORKDIR /var/www/html

# Ajustamos permisos (opcional, según cómo manejes tu sistema)
# RUN chown -R www-data:www-data /var/www/html

# Comando por defecto al crear el contenedor
CMD ["apache2-foreground"]
