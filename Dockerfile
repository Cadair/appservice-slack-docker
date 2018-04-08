FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

RUN git clone https://github.com/matrix-org/matrix-appservice-slack ./

RUN mkdir /usr/src/app/userconfig

# Install
RUN npm install --only=production

EXPOSE 9898
EXPOSE 5858

RUN ln -s userconfig/slack-registration.yaml ./slack-registration.yaml
CMD [ "node", "app.js", "-c", "/usr/src/app/userconfig/config.yaml", "-p", "5858" ]