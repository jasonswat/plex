alot of this was taken from https://github.com/timhaak/docker-plex
and customized for my environment

To install the container:
    docker pull jasonswat/plex

To run the container:
    docker run -d -h plex -v /config:/config -v /video:/video -v /photo:/photo -v /music:/music -p 32400:32400 jasonswat/plex

To login to the container to make sure it's setup correctly:
    docker exec -it <container> bash

To allow your network access to configure plex edit this file:
    sudo vi /config/Library/Application\ Support/Plex\ Media\ Server/Preferences.xml
add "allowedNetworks=" for example:
    allowedNetworks="192.168.10.0/255.255.255.0"
