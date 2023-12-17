# ejecuta HA

sudo -u homeassistant -H -s
cd /srv/homeassistant
python3 -m venv .
source bin/activate

# ejecutamos HA con hass, que descargará e instalará todo lo necesario durante 5-10 minutos

/home/homeassistjaant/.local/bin/hass
