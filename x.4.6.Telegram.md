## Telegram

* Creamos un bot con [@botfather](https://t.me/BotFather) y anotamos el nombre del bot y el HTTP API token

/newbot

* Obtenemos en chatID con [getIDBot](https://t.me/getidsbot)
* Creamos un Bot de telegram en HA, tenemos que hacerlo directamente en el fichero de configuracion.yaml de HA. Es más sencillo hacerlo con la extensión "Studio Code Server". Añadimos

```yaml
# Telegram Bot
telegram_bot:
  - platform: polling
    api_key: "Telegram_API_KEY"
    allowed_chat_ids:
      - 123123 

      # Notifier
notify:
  - platform: telegram
    name: "HA_User"
    chat_id: 123123
```

## Notificaciones

Probamos el servicio de notificaciones con la ejecución del [Developer tools > Services > YAML mode](https://my.home-assistant.io/redirect/developer_call_service/?service=homeassistant.turn_on) 

Para mandar un texto

```yaml
service: notify.javacasm
data:
    message: "Hola javacasm"
```


También podemos enviar imágenes

```yaml
service: notify.javacasm
data:
  message: "Hola javacasm"
  data:
    photo:
      - url: https://www.nyan.cat/cats/gb.gif
```

Que puede necesitar username: password
También puede ser un fichero local con 

```yaml
service: notify.javacasm
data:
  message: "Hola javacasm"
  data:
    photo:
      - file: /tmp/imagen.gif
```

También podemos hacer que el mensaje lleve información de qué dispositivo y triggerr desencadenó el mensaje 

```yaml
service: telegram_bot.send_message
data:
  title: '{{this.attributes.friendly_name}}'
  message: 'Origen: {{trigger.id}}'
  target: -12345678
```
También se puede crear grupos de usuarios para notificarlos

## Comandos

Podemos hacer que un comando de telegrama /comando1 desencadene una automatización en HA. 

Para ello sólo creamos una automatización con el siguiente yaml
```yaml
alias: Telegram Rele On
description: Enciende el relé del Esp32
trigger:
  - platform: event
    event_type: telegram_command
    event_data:
      command: /releOn
    context: {}
condition: []
action:
  - type: turn_on
    device_id: 4a1c8339ca2afee11aa8b527761222db
    entity_id: 2259bc32283f3c7cbae9fbd317b0bd82
    domain: switch
  - service: notify.javacasm
    data:
      message: Relé ON

mode: single

```

También podemos crearla usando un trigger un "telegram_command"

## Menú

Podemos creaer menús mostrando "teclados personalizados" 

```yaml
      data:
        inline_keyboard:
          - Relé on:/releOn, Relé Off:/releOff
```

Para incluir un teclado de comandos

```yaml
service: notify.javacasm
data:
    message: "Hola javacasm"
    data:
        inline_keyboard:
        - 'Tarea 1:/comando1, Tarea 2:/comando2'
        - 'Tarea 3:/comando3, Tarea 4:/comando4'
```
La respuesta será una automatización con un trigger del tipo telegram_callback

```yaml
alias: Prueba TG comando 2
description: Prueba TG comando
trigger:
  - platform: event
    event_type: telegram_callback
    event_data:
      command: /afirmativo
action:
  - service: notify.USUARIO
```
[detalles](https://aguacatec.es/conectar-telegram-con-home-assistant/)

[Detalles](https://www.home-assistant.io/integrations/telegram/)

[Detalles](https://www.home-assistant.io/integrations/telegram_bot/)

