#!/bin/bash
export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

npm install --location=global @angular/cli@17.0.8 
echo "N" | ng version 
ng new hahlabs-view --defaults=true --interactive=false --package-manager="npm" --routing=true --style="scss" --skip-git=true 
cd hahlabs-view 
echo "N" | ng build 
sudo ln -sf /home/hahlabs/hahlabs-view/dist/hahlabs-view/browser /var/www/hahlabs-view

cat <<EOF > ./startup.sh
#!/bin/bash
service nginx restart
ng version
tail -f /dev/null
EOF