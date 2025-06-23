# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

#Install node using nvm
nvm install --lts



# Add node to system wide PATH
sudo install -m 755  $(which node) /usr/local/bin/

# Check node version
node -v
