Most of the Dockerfile and start.sh is from https://github.com/timhaak/docker-plex
It was changed a little for my environment
It's running on a coreos system. Notes for how I built that are here:
https://github.com/jasonswat/coreos_pxe/ 

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


============================
To update for a new release of the plex server:
============================

Download a new Dockerfile, I do this so I know which version of Dockerfile I am running

    git clone https://github.com/jasonswat/plex.git

Stop the running containter

    docker stop jasonswat/plex (or container id)

Then run a new container just to hold the volumes

    docker run --volumes-from jasonswat/plex (or container id) --name my_plex_data busybox true

Now you can remove old container

    docker rm jasonswat/plex (or container id)

Build the new image from the clone

    cd plex

    docker build -t jasonswat/plex --no-cache=false .

Run the new container, using the volumes from the my_plex_data container you created

    docker run -d -h plex --volumes-from my_plex_data -p 32400:32400 jasonswat/plex

You can remove the temp container, or keep it around for your next update

    docker rm my_plex_data
