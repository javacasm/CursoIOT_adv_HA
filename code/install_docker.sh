# from https://docs.docker.com/engine/install/debian/

# Eliminamos las versiones antiguas de docker, si las hubiera
echo 'Eliminamos las versiones antiguas de docker, si las hubiera'

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# instalamos las claves y fuentes del repositorio oficial de docker

echo 'Instalamos las claves y fuentes del repositorio oficial de docker'

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# instalamos docker
echo 'Instalando docker'
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Para que docker funcione en kernels antiguos añadimos "systemd.unified_cgroup_hierarchy=0" al final de la línea de
# setenv bootargs  de /boot/boot/boot.ini 

echo 'ejecuta: sudo docker run hello-world'

# fin 
