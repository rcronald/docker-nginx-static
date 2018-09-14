FROM nginx:alpine
MAINTAINER Ronald Requena "rcronald@gmail.com"

RUN apk update
RUN apk --no-cache add gettext

# Remove the default Nginx configuration file
#RUN rm -v /etc/nginx/nginx.conf
RUN rm -v /etc/nginx/conf.d/default.conf

# Copy configuration file from the current directory
#ADD nginx_env.conf /etc/nginx/
#ADD nginx_env.conf /etc/nginx/conf.d/
ADD nginx_env.conf /etc/nginx/conf.d/nginx_env.conf

# Add web resources
ADD web /usr/share/nginx/html/
ADD web /var/www/html/

# Append "daemon off;" to the beginning of the configuration
#RUN echo "daemon off;" >> /etc/nginx/nginx_env.conf
#RUN echo "daemon off;" >> /etc/nginx/conf.d/default.conf

# Expose ports
EXPOSE $NGINX_PORT_X
#EXPOSE 8000

#This doesn't works
#CMD /bin/bash -c "envsubst < /etc/nginx/nginx_env.conf > /etc/nginx/nginx.conf && exec nginx"
#CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/nginx_env.conf > /etc/nginx/conf.d/default.conf && exec nginx"
CMD /bin/sh -c "envsubst < /etc/nginx/conf.d/nginx_env.conf > /etc/nginx/conf.d/default.conf && rm -v /etc/nginx/conf.d/nginx_env.conf && cat /etc/nginx/conf.d/default.conf  && exec nginx -g 'daemon off;'"
#CMD ["nginx", "-g", "daemon off;"]

#This works fine
#CMD /bin/bash -c "exec nginx -g 'daemon off;' || cat /etc/nginx/nginx.conf"
