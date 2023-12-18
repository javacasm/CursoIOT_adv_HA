### Pantalla LCD

(i2c tiene que estar configurado)

```yaml
display:
  - platform: lcd_pcf8574
    dimensions: 16x2
    address: 0x27   
    lambda: |-
      it.print(0,1,"Hello World!");

      // Let's write a sensor value (let's assume it's 42.1)
      it.printf("%.1f", id(my_sensor).state);
      // Result: "42.1" (the dot will appear on the segment showing "2")

      // Print a right-padded sensor value with 0 digits after the decimal
      it.printf("Sensor value: %8.0f", id(my_sensor).state);
      // Result: "Sensor value:       42"

      // Print the current time
      it.strftime("It is %H:%M on %d.%m.%Y", id(my_time).now());
      // Result for 10:06 on august 21st 2018 -> "It is 10:06 on 21.08.2018"

# (Optional) For displaying time:
time:
- platform: homeassistant
  id: my_time
```
### Pantalla LCD

(i2c tiene que estar configurado)

```yaml
display:
  - platform: lcd_pcf8574
    dimensions: 16x2
    address: 0x27   
    lambda: |-
      it.print(0,1,"Hello World!");

      // Let's write a sensor value (let's assume it's 42.1)
      it.printf("%.1f", id(my_sensor).state);
      // Result: "42.1" (the dot will appear on the segment showing "2")

      // Print a right-padded sensor value with 0 digits after the decimal
      it.printf("Sensor value: %8.0f", id(my_sensor).state);
      // Result: "Sensor value:       42"

      // Print the current time
      it.strftime("It is %H:%M on %d.%m.%Y", id(my_time).now());
      // Result for 10:06 on august 21st 2018 -> "It is 10:06 on 21.08.2018"

# (Optional) For displaying time:
time:
- platform: homeassistant
  id: my_time
```

[Detalles](https://esphome.io/components/display/lcd_display.html)


### Matrices LED


```yaml
light:
  - platform: fastled_clockless
    chipset: WS2812B
    pin: GPIO4
    num_leds: 64
    rgb_order: GRB
    name: "led_matrix"
    id: led_matrix_light
    default_transition_length: 0s
    color_correct: [50%, 50%, 50%]
    restore_mode: ALWAYS_ON

display:
  - platform: addressable_light
    id: led_matrix_display
    addressable_light_id: led_matrix_light
    width: 8
    height: 8
    rotation: 180°
    update_interval: 16ms
    lambda: |-
          // Draw a bulls-eye pattern
          Color red = Color(0xFF0000);
          Color green = Color(0x00FF00);
          Color blue = Color(0x0000FF);
          it.rectangle(0, 0, 8, 8, red);
          it.rectangle(1, 1, 6, 6, green);
          it.rectangle(2, 2, 4, 4, blue);
          it.rectangle(3, 3, 2, 2, red);
```

[Detalles matrices leds](https://esphome.io/components/display/addressable_light.html?highlight=led)

### Servo

[Detalles](https://esphome.io/components/servo.html?highlight=servo)

[Tutorial](https://siytek.com/esphome-servo-example/)

