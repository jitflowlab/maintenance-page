FROM node:11

EXPOSE 3000

ADD ./entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ADD . /app/
WORKDIR /app/

ENV VOLUME_PATH /app/
ARG NODE=production
ENV NODE_ENV ${NODE}

RUN npm install

ENTRYPOINT ["bash", "/usr/local/bin/docker-entrypoint.sh", "2>&1"]
