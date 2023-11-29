## Temas a recordar

* Haz copias de seguridad periódicas, sobre todo antes de hacer cambios importantes
* Añade una segunda unidad, usb o de red para guardar las copias de seguridad y los datos
* Crea más de 1 usuario y guarda las contraseñas

## Como resetar el passwd olvidado

Hemos olvidado el password de nuestro HA
* Recuerda que puedes tener varios usuarios
* Si tenemos acceso, damos permido de administrador a otro usuario (si no lo hay creamos uno temporal)
* Si no tenemos acceso entramos desde la consola local (necesitamos teclado y monitor) y escribimos

```sh
auth reset --username usuario_anterior --password nueva_contraseña
```

[Detalles locked](https://www.home-assistant.io/docs/locked_out/)

