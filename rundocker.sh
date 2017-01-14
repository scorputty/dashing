#!/usr/bin/env bash

# edit for your situation
VOL_CONFIG="/Volumes/shares/docker/config/dashing"

test -d ${VOL_CONFIG} || VOL_CONFIG="${PWD}${VOL_CONFIG}" && mkdir -p ${VOL_CONFIG}

docker run -d -h $(hostname) \
    -p 3030:3030 \
    -v ${VOL_CONFIG}:/config \
    -e TZ="Europe/Amsterdam" \
    -e appUser="media" \
    -e appGroup="media" \
    -e PUID="10000" \
    -e PGID="10000" \
    --name=dashing --restart=always cryptout/dashing

  # for troubleshooting run
  # docker exec -it dashing /bin/bash
  # to check logs run
  # docker logs -f dashing
