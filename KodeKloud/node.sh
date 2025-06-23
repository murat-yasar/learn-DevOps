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

# search for packages in the npm registry directly from the terminal
npm search file

# Install NodeJS file package with npm
sudo npm install file

# Install file module with npm globally
sudo npm install file -g

# Clone NodeJS
git clone https://github.com/contentful/the-example-app.nodejs


