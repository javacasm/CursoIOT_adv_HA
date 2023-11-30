# Instalación con Containter - Docker

Ventajas: 

* Compartimentación
* Ampliabilidad

Inconvenientes:

* Es una virtualización: más memoria, mas espacio en disco, más CPU, más recursos
* ¿vas a usar alguna vez su modularidad?
* La tarjeta SD no está hecha para tanto uso...

¿De verdad lo necesitas?

Discusión sobre recursos


## Instalación

instalamos docker

[Instalación para 64 bits](https://docs.docker.com/engine/install/debian/)

[Instalación para 32 bits](https://docs.docker.com/engine/install/raspberry-pi-os/)




docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=MY_TIME_ZONE \
  -v /PATH_TO_YOUR_CONFIG:/config \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable

  ## Documentación

  https://raspberrytips.com/docker-on-raspberry-pi/?utm_source=newsletter&utm_medium=email&utm_campaign=docker_made_easy_for_your_pi&utm_term=2023-09-30