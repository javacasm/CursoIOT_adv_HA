# ESPHome

https://esphome.io/index.html

ESPHome nos permite programar nuestro dispositivos DIY e integrarlos de forma sencilla en nuestro HA.

Inicialmente era sólo para dispositivos ESP, como el esp8266 o el esp32, pero a día de hoy también admite otras plataformas como RP2040 (Raspberry Pico), BK72xx y RTL87xx con la plataforma LibreTiny habitualmente usados en dispositivos de la marca Tuya

* Instalamos el firmware de ESPHome vía USB o wifi
* Lo detectamos y conectamos con HA
* Tendremos configuradas las secciones esenciales:
  - esp
  - "[wifi](https://esphome.io/components/switch/)"
* Podemos añadir la configuración de cada uno de los componentes en las correspondientes secciones: 
  - "[sensor](https://esphome.io/#sensor-components)" para sensores
  - "[light](https://esphome.io/#light-components)" para luces
  - "[output](https://esphome.io/#output-components)" para salidas (pines, PWM, servos, DAC,...)
  - "[switch](https://esphome.io/#output-components)" para interruptores y relés
* También añadimos las secciones de las diferentes conexiones:
  - "[MQTT](https://esphome.io/components/mqtt.html)"
  - "I2C"

Cuando vamos escribiendo la configuración el sistema detecta si es correcta la sintaxis y si necesitamos algún componente que no hemos incluído (por ejemplo i2c para un sensor que usa esa conexión)

Para los datos sensibles o que usamos en variantes, podemos usar la página de "Secrets" a la que podemos refenciar desde nuestro fichero yaml. Por ejemplo para usar varias configuraciones o guardar las claves. Antepondremos al nombre de la etiqueta "!secret"



