FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

RUN git clone https://github.com/Cadair/matrix-appservice-slack ./

RUN mkdir /usr/src/app/userconfig

# Install
RUN npm install --only=production

EXPOSE 9898
EXPOSE 5858

RUN ln -s userconfig/slack-registration.yaml ./slack-registration.yaml
RUN ln -s userconfig/room-store.db ./room-store.db
RUN ln -s userconfig/user-store.db ./user-store.db
CMD [ "node", "app.js", "-c", "/usr/src/app/userconfig/config.yaml", "-p", "5858" ]
