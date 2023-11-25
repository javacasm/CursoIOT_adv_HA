# Instalación

Nos permite actualizar la programación desde local con USB o por wifi vía

Desde [https://web.esphome.io/](https://web.esphome.io/) hacemos una primera instalación 

![](./images/ESPHome_web.io.png)
Debemos tener conectado el dispositivo por USB

![](./images/ESPHome_web-USB.png)

Seleccionamos el firmware que habremos generado desde la página ESPHome de HA

![](./images/ESPHome_web-upload1.png)

y lo subimos a la placa

![](./images/ESPHome_web-upload2.png)

Si no lo hemos hecho ya, configuramos el wifi y ya tenemos acceso desde HA que lo detectará

![](./images/ESPHome_detect.png)

Podemos ver el registro de lo que va haciendo nuestro ESP desde la web de esphome.io

![](./images/ESPHome_problemas_wifi.png)

Si hay problemas wifi lo veremos si la placa sigue conectada al USB y podemos ver las redes que se detectan

![](./images/ESPHome_wifi-error.png)

Si tenemos conexión wifi con el dispositivo también podemos acceder directamente a la IP del dispositivo

![](./images/ESPHome_log_ip.png)

Y ya tenemos disponible el acceso innalámbrio via OTA


Modificamos la configuración (fichero yaml) 

![](./images/ESPHome_config_sensor_ligth.png)

Tras compilarlo podemos subir la actualización

![](./images/ESPHome_compiling.png)

Tambien podemos subir una primera versión desde HA, pero tenemos que tener conecta en local el dispositivo a nuestro HA

![](./images/ESPHome_upload.png)

Y subirlo

![](./images/ESPHome_uploading_fromHA.png)

Cuando ya está conectado desde HA tendremos accesos a las entidades que estemos publicando

![](./images/ESPHome_entidades.png)

Pudiendo controlar los dispositivos

![](./images/ESPHome_LED_rgb.png)

### Actualización

Una vez instalada una configuración, desde el complemento ESPHome podemos añadir componentes y probarlos de manera sencilla y rápida vía OTA
