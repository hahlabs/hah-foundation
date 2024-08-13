
apt -y update && apt install -y nginx apt-utils software-properties-common 
add-apt-repository -y ppa:ondrej/php && add-apt-repository -y ppa:ondrej/nginx
apt -y update && apt install -y zip unzip php8.2 php8.2-mysql php8.2-intl php8.2-curl php8.2-mbstring php8.2-xml php8.2-zip  php8.2-gd php8.2-bz2 php8.2-redis php8.2-memcached php8.2-fpm
usermod -aG www-data hahlabs
apt remove -y software-properties-common apt-utils
