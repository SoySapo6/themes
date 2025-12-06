apt install sudo -y
cd /var/www/
tar -cvf Pterodactyl_Nightcore_Themebackup.tar.gz pterodactyl
cd /var/www/pterodactyl
rm -r Pterodactyl_Nightcore_Theme
git clone https://github.com/NoPro200/Pterodactyl_Nightcore_Theme.git
cd Pterodactyl_Nightcore_Theme
rm /var/www/pterodactyl/resources/scripts/Pterodactyl_Nightcore_Theme.css
rm /var/www/pterodactyl/resources/scripts/index.tsx
mv index.tsx /var/www/pterodactyl/resources/scripts/index.tsx
mv Pterodactyl_Nightcore_Theme.css /var/www/pterodactyl/resources/scripts/Pterodactyl_Nightcore_Theme.css
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
apt update -y
apt install nodejs -y
NODE_VERSION=$(node -v)
REQUIRED_VERSION="v16.20.2"
if [ "$NODE_VERSION" != "$REQUIRED_VERSION" ]; then sudo npm install -g n; sudo n 16; fi
apt install npm -y
npm i -g yarn
yarn
cd /var/www/pterodactyl
yarn build:production
php artisan optimize:clear
