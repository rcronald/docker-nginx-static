FROM nginx
MAINTAINER Ronald Requena "rcronald@gmail.com"

# Copy configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf

# Add web resources
ADD web /usr/share/nginx/html/
ADD web /var/www/html/

# Append "daemon off;" to the beginning of the configuration
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 8000

#CMD exec nginx -g 'daemon off;'
#CMD /bin/bash -c "envsubst < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"
CMD /bin/bash -c "exec nginx -g 'daemon off;' || cat /etc/nginx/nginx.conf"