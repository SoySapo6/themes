REPO_URL="https://github.com/LeXcZxMoDz9/LeXcZUbot"
TEMP_DIR="LeXcZUbot"
BLUEPRINT_PATH="/var/www/pterodactyl/blueprint.sh"
TEMP_DIR_PATH="/var/www/$TEMP_DIR"

if [ -d "$TEMP_DIR_PATH" ]; then rm -rf "$TEMP_DIR_PATH"; fi

if [ -f "$BLUEPRINT_PATH" ]; then
    cd /var/www
    git clone $REPO_URL
    cd "$TEMP_DIR"
    mv * /var/www
    cd /var/www
    unzip nebulaptero.zip
    cd /var/www/pterodactyl
    blueprint -install nebula
else
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update && sudo apt upgrade -y
    sudo npm i -g yarn
    cd /var/www/pterodactyl
    yarn
    sudo apt install -y zip unzip git curl wget
    wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip
    unzip release.zip
    FOLDER="/var/www/pterodactyl"
    sed -i -E -e "s|WEBUSER=\"www-data\" #;|WEBUSER=\"www-data\" #;|g" -e "s|USERSHELL=\"/bin/bash\" #;|USERSHELL=\"/bin/bash\" #;|g" -e "s|OWNERSHIP=\"www-data:www-data\" #;|OWNERSHIP=\"www-data:www-data\" #;|g" "$FOLDER/blueprint.sh"
    chmod +x blueprint.sh
    bash blueprint.sh
    cd /var/www
    git clone $REPO_URL
    cd "$TEMP_DIR"
    mv * /var/www
    cd /var/www
    unzip nebulaptero.zip
    cd /var/www/pterodactyl
    blueprint -install nebula
fi
