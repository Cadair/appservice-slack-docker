FROM node:current-alpine

# Create app directory
WORKDIR /usr/src/app

RUN apk add git

RUN git clone -b cadair https://github.com/Cadair/matrix-appservice-slack ./
#RUN git clone -b develop https://github.com/matrix-org/matrix-appservice-slack ./

RUN mkdir /data/ && mkdir /config/

# Install
RUN npm install --only=production

EXPOSE 9898
EXPOSE 5858

CMD [ "node", "app.js", "-c", "/config/config.yaml", "-p", "5858", "-f", "/config/slack-registration.yaml" ]
