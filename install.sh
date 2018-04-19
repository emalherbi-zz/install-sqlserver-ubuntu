#!/bin/bash

function print {
	echo -e "\033[1;36m=> $1 \033[0m";
}

print "Starting."

sudo apt-get update
sudo apt-get upgrade

print "Install: wget."
if which wget &> /dev/null; then
    print "wget: already installed"
else
	sudo apt-get install wget
    print "wget: ok"
fi

print "Install: curl."
if which curl &> /dev/null; then
    print "curl: already installed"
else
	sudo apt-get install curl
    print "curl: ok"
fi

print "Install: samba."
if which samba &> /dev/null; then
    print "samba: already installed"
else
	sudo apt-get install samba
    print "samba: ok"
fi

print "Install SQL Server."
print "You must have a Ubuntu machine with at least 2 GB of memory."
print "Import the public repository GPG keys."

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

print "Register the Microsoft SQL Server Ubuntu repository."

sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"

print "Run the following commands to install SQL Server."

sudo apt-get update
sudo apt-get install -y mssql-server

print "After the package installation finishes, run mssql-conf setup and follow the prompts to set the SA password and choose your edition."

sudo /opt/mssql/bin/mssql-conf setup

print "Once the configuration is done, verify that the service is running."

systemctl status mssql-server

print "Install the SQL Server command-line tools."
print "Import the public repository GPG keys."

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

print "Register the Microsoft Ubuntu repository."

curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

print "Update the sources list and run the installation command with the unixODBC developer package."

sudo apt-get update 
sudo apt-get install mssql-tools unixodbc-dev

print "Optional: Add /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell."

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

print "Finish."