# Matrix Appservice Slack: Docker

This container exposes two volumes `/config` and `/data` it expects the config
file to be `/config/config.json`.

You will want your config file to contain the line:

```
dbdir: /data
```

1. Clone this repo.
1. Write a `config.yaml` file.
1. Build the container: `docker build -t asslack .`
1. Assuming you are running this from a directory with a `config.yaml` file in it you can do the following to generate a registration yaml file: `docker run -v /myconfigdir/:/config -t asslack -r -f /config/slack-registration.yaml -u "http://myhomeserver:5858"`
1. You can then run the appservice with `docker run -p 9898:9898 -p 5858:5858 -v /myconfigdir/:/config -v /mydatadir:/data -t asslack`

If you want to change the path of the registration file, you can override the
option from the command line, but you will also need to set the port to 5858:

```
docker run -p 9898:9898 -p 5858:5858 -v /myconfigdir/:/config -v /mydatadir:/data -t asslack -p 5858 -f /config/myregistration.yaml
```
    
    
This requires your appservice port to be 5858.
