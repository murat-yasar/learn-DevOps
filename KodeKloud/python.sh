# Check python version
python2 -V
python3 -V

# Update the local package index
sudo apt update

# Install python 3.8
sudo apt install -y python3.8

# Run main.py file with python2
python2 main.py

# Run main.py file with python3
python3 main.py

# Check pip (Python Package Manager) version
pip -V

# Install flask
pip install flask

# Check the information about flask package
pip show flask

# Install all the packages which are listen in requirements.txt
pip install -r requirements.txt

# Upgrade flask package
pip install flask --upgrade

# Uninstall flask
pip uninstall flask

# Install easy_install package
easy_install install app

# Install wheels package
pip install app.whl



