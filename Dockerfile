# Dockerfile 
# Imagen base de PHP con Apache 
FROM php:8.2-apache 
 
# Copiar el archivo PHP al directorio raíz de Apache 
COPY index.php /var/www/html/index.php 
 
# Habilitar módulo de reescritura si fuera necesario (opcional) 
RUN a2enmod rewrite 
 
# Exponer el puerto 80 (interno del contenedor) 
EXPOSE 80 