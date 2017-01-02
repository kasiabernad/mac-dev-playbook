# Check if PiP is installed
echo '--------- Installing PIP ----------'
sudo easy_install pip

# Install ansible
echo '--------- Installing Ansible ----------'
sudo pip install ansible

# Install brew
echo '--------- Installing Brew ----------'
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo '---------  Run Ansible ----------'
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i inventory -K

echo '--------- Adjust zshrc ----------'
cp .zprezto >> ~/.zprezto
cp .zshrc >> ~/.zshrc
