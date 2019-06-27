# Matrix Appservice Slack: Docker

This is a *really* simple dockerfile.

It exposes two volumes `/config` and `/data` it expects the appservice
registration file to be `/config/slack-registration.yaml` and the config file
to be `/config/config.json`.

You will want your config file to contain the two lines:

```
dbdir: /data
hs_registration_file: /config/slack-registration.yaml
```

1. Clone this repo.
1. Write a `config.yaml` file.
1. Build the container: `docker build -t asslack .`
1. Assuming you are running this from a directory with a `config.yaml` file in it you can do the following to generate a registration yaml file: `docker run -v $PWD:/config -t asslack node app.js -r -c /config/config.yaml -f /config/slack-registration.yaml -u "http://myhomeserver:5858"`
1. You can then run the appservice with `docker run -p 9898:9898 -p 5858:5858 -v $PWD:/usr/src/app/userconfig -t asslack`
    
    
This requires your slack port to be 5858.
