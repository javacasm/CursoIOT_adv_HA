# Instalación de Home Assistant Core
# from https://www.home-assistant.io/installation/raspberrypi#install-home-assistant-core

# Actualizamos el sistema

sudo apt-get update
sudo apt-get upgrade -y

# instalamos la dependencias


sudo apt-get install -y python3 python3-dev python3-venv python3-pip bluez libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 libtiff5 libturbojpeg0-dev tzdata ffmpeg liblapack3 liblapack-dev libatlas-base-dev
ls

# creamos la cuenta de usuario de HomeAssistant

sudo useradd -rm homeassistant -G dialout,gpio,i2c

# creamos el directorio desde el que se ejecutará HA

sudo mkdir /srv/homeassistant
sudo chown homeassistant:homeassistant /srv/homeassistant

# creamos el entorno virtual de python donde se ejecutará homeassistant

sudo -u homeassistant -H -s
cd /srv/homeassistant
python3 -m venv .
source bin/activate

# Instalamos wheel una dependencia del paquete pyton homeassistant

python3 -m pip install wheel

# instalamos el paquete homeassistant

pip3 install homeassistant

# ejecutamos HA con hass, que descargará e instalará todo lo necesario durante 5-10 minutos

/home/homeassistant/.local/bin/hass

# Cuando termine la instalación accedemos al interface y primera configuración con

http://127.0.0.1:8123

