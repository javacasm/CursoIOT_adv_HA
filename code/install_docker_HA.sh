# ejecutamos la instancia homeassistant por primera vez y se instalará, indicando la zona horaria y la carpeta para instalarlo

docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=es:es \
  -v /srv/HA_docker:/config \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable

