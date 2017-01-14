FROM ruby:2.3.1
MAINTAINER scorputty
LABEL Description="Dashing" Vendor="Stef Corputty" Version="0.0.1"

# variables
ENV TZ="Europe/Amsterdam"
ENV appUser="media"
ENV appGroup="media"
ENV PUID="10000"
ENV PGID="10000"

# mounted volumes should be mapped to media files and config with the run command
VOLUME ["/dashboards", "/jobs", "/lib-dashing", "/config", "/public", "/widgets", "/assets"]

# ports should be mapped with the run command to match your situation
EXPOSE 3030

# install runtime packages
RUN apt-get update && \
    apt-get -y install nodejs && \
    apt-get -y clean
RUN gem install bundler dashing
RUN mkdir /dashing && \
    dashing new dashing && \
    cd /dashing && \
    bundle && \
    ln -s /dashing/dashboards /dashboards && \
    ln -s /dashing/jobs /jobs && \
    ln -s /dashing/assets /assets && \
    ln -s /dashing/lib /lib-dashing && \
    ln -s /dashing/public /public && \
    ln -s /dashing/widgets /widgets && \
    mkdir /dashing/config && \
    mv /dashing/config.ru /dashing/config/config.ru && \
    ln -s /dashing/config/config.ru /dashing/config.ru && \
    ln -s /dashing/config /config

# copy the start script and config to the container
COPY start.sh /start.sh

# user with access to media files and config
RUN addgroup -g ${PGID} ${appGroup} && \
 adduser -G ${appGroup} -D -u ${PUID} ${appUser}

# set owner
RUN chown -R ${appUser}:${appGroup} /start.sh /dashing

# switch to App user
USER ${appUser}

# start application
CMD ["/start.sh"]
