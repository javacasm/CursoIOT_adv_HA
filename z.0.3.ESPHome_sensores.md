

### Sensor DHT11

```yaml
# https://esphome.io/components/sensor/index.html
# Sensor DHT11
sensor:
  - platform: dht
    pin: GPIO26
    model: DHT11
    temperature:
      name: "Temperatura despacho"
      id: temperature
      filters:   
      - filter_out: 85.0
      - filter_out: -50
      unit_of_measurement: "°C"
      device_class: "temperature"
      state_class: "measurement"
      accuracy_decimals: 0
    humidity:
      name: "Humedad despacho"
      icon: "mdi:water-percent"
      device_class: "humidity"
      state_class: "measurement"
    update_interval: 60s
```
### I2C

```yaml
i2c:
  sda: 21
  scl: 22
  scan: true
  id: bus_a

```
El scan se hace al principio y nos permite saber si se han detectado bien los dispositivos

![](./images/ESPHome_scan-I2C.png)

[Detalles I2C](https://esphome.io/components/i2c#i2c)

Ejemplo de sensor i2c

```yaml
- platform: bme680
  i2c_id: bus_b
  address: 0x76
```



### Sensores BME/BMP

Requieren que I2C esté configurado

#### BMP280 Temperatura y presión

```yaml
sensor:
  - platform: bmp280
    temperature:
      name: "Outside Temperature"
      oversampling: 16x
    pressure:
      name: "Outside Pressure"
    address: 0x77
    update_interval: 60s
```

[Detalles](https://esphome.io/components/i2c#i2c)


### BME280 Temperatura, Humedad y presión

```yaml
# Example configuration entry
sensor:
  - platform: bme280
    temperature:
      name: "BME280 Temperature"
      oversampling: 16x
    pressure:
      name: "BME280 Pressure"
    humidity:
      name: "BME280 Humidity"
    address: 0x77
    update_interval: 60s
```
### Sensores Dallas - OneWire - DS18x20

```yaml


# Individual sensors
sensor:
  - platform: dallas
    address: 0x1c0000031edd2a28
    name: "Livingroom Temperature"

```

Para obtener las direcciones creamos la configuración sólo con la parte del HUB y ahí veremos los sensores detectados

Si no hay sensores o no están bien conectados dará un aviso

```log
[18:34:00][C][dallas.sensor:075]: DallasComponent:
[18:34:00][C][dallas.sensor:076]:   Pin: GPIO0
[18:34:00][C][dallas.sensor:077]:   Update Interval: 60.0s
[18:34:00][W][dallas.sensor:080]:   Found no sensors!
```

O si lo encuentra

```log
[18:50:58][C][dallas.sensor:075]: DallasComponent:
[18:50:58][C][dallas.sensor:076]:   Pin: GPIO2
[18:50:58][C][dallas.sensor:077]:   Update Interval: 60.0s
[18:50:58][D][dallas.sensor:082]:   Found sensors:
[18:50:58][D][dallas.sensor:084]:     0x0503184119feff28
```

Si necesitamos varios hubs porque tenemos distintos "buses" onewire conectados

```yaml
Multiple dallas hubs
Use this if you have multiple dallas hubs:

# Example configuration entry
dallas:
  - pin: GPIO23
    id: hub_1
  - pin: GPIO24
    id: hub_2

sensor:
  - platform: dallas
    dallas_id: hub_1
    # ...
  - platform: dallas
    dallas_id: hub_2
    # ...
```

[Detalles](https://esphome.io/components/sensor/dallas.html)

