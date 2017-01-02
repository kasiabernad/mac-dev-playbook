echo '--------- Install Xcode-select ----------'
xcode-select --install

# Check if PiP is installed
echo '--------- Installing PIP ----------'
sudo easy_install pip

# Install ansible
echo '--------- Installing Ansible ----------'
sudo pip install ansible

# Install brew
echo '--------- Installing Brew ----------'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Java
brew cask install java


echo '---------  Run Ansible ----------'
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i inventory -K

echo '--------- Install oh-my-zsh ----------'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo '--------- Use zsh as default shell ----------'
chsh -s /bin/zsh
