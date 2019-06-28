FROM node:current-alpine

# Create app directory
RUN apk add git
RUN mkdir /data/ /config/

WORKDIR /usr/src/app

RUN git clone -b cadair https://github.com/Cadair/matrix-appservice-slack ./
#RUN git clone -b develop https://github.com/matrix-org/matrix-appservice-slack ./

# Install
RUN npm install --only=production

EXPOSE 9898
EXPOSE 5858

ENTRYPOINT [ "node", "app.js", "-c", "/config/config.yaml"]
CMD [ "-p", "5858", "-f", "/config/slack-registration.yaml" ]
