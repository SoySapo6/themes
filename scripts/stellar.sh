#!/bin/bash
if [ ! -d "/etc/apt/keyrings" ]; then sudo mkdir -p /etc/apt/keyrings; fi
if [ ! -f "/etc/apt/keyrings/nodesource.gpg" ]; then curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; fi
if ! dpkg -l | grep -q "nodejs"; then sudo apt install -y nodejs; fi
if ! grep -q "nodesource" /etc/apt/sources.list.d/nodesource.list 2>/dev/null; then echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list; fi
if ! npm list -g --depth=0 | grep -q "yarn"; then npm install -g yarn; fi
sudo apt update
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
cd /var/www && git clone https://github.com/LeXcZxMoDz9/kontol
cd /var/www && sudo mv kontol/stellarrimake.zip /var/www/
unzip -o /var/www/stellarrimake.zip -d /var/www/
rm /var/www/stellarrimake.zip
cd /var/www/pterodactyl
yarn
export NODE_OPTIONS=--openssl-legacy-provider
if ! yarn build:production; then export NODE_OPTIONS=--openssl-legacy-provider; yarn; yarn add react-feather; npx update-browserslist-db@latest; yarn build:production; fi
php artisan migrate
php artisan view:clear
cd /var/www && sudo mv kontol/autosuspens.zip /var/www/
unzip -o /var/www/autosuspens.zip -d /var/www/
cd /var/www/pterodactyl && bash installer.bash
rm /var/www/autosuspens.zip
rm -r /var/www/kontol
