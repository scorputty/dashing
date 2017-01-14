[![Build Status](https://travis-ci.org/scorputty/dashing.svg?branch=master)](https://travis-ci.org/scorputty/dashing) [![](https://images.microbadger.com/badges/image/cryptout/dashing.svg)](https://microbadger.com/images/cryptout/dashing "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/cryptout/dashing.svg)](https://microbadger.com/images/cryptout/dashing "Get your own version badge on microbadger.com")

# Docker dashing (Alpine)

This is a Dockerfile to set up "dashing" - (http://dashing.io/).

### Docker Hub
The built image is also hosted at Docker Hub - (https://hub.docker.com/r/cryptout/dashing/).
If you don't want to customize the container you can run it directly by typing the following commands.
```sh
export VOL_CONFIG="/Volumes/shares/docker/config/dashing"

docker run -d -h $(hostname) \
    -p 3030:3030 \
    -v ${VOL_CONFIG}:/config \
    -e TZ="Europe/Amsterdam" \
    -e appUser="media" \
    -e appGroup="media" \
    -e PUID="10000" \
    -e PGID="10000" \
    --name=dashing --restart=always cryptout/dashing
```

# Build from Dockerfile
Clone this repository and run the build.sh script.
```sh
git clone https://github.com/scorputty/dashing.git
cd dashing
./build.sh
```

### Variables
Change to match your situation.
```Dockerfile
ENV appUser="media"
ENV appGroup="1000"
```

### Volumes
Make sure to map the Volumes to match your situation.
```Dockerfile
VOLUME ["/data"]
VOLUME ["/config"]
VOLUME ["/cache"]
```

### To run the container
Edit rundocker.sh (this will be replaced by docker-compose soon...).
```sh
./rundocker.sh
```

### WebGUI
To reach the WebGUI go to - (http://localhost:9091).
Or replace localhost with your target IP. Login with admin/dashing.

## Info
* Shell access whilst the container is running: `docker exec -it dashing /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f dashing`


# Notes
I'm still learning Docker and use these private (pet)projects to develop my skills.
While I use these containers myself they are by no means perfect and are always prone to error or change.
That said, even if only one person copies a snippet of code or learns something from my projects I feel I've contributed a little bit to the Open-source cause...
