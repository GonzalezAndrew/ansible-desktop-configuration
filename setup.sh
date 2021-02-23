#!/usr/bin/bash

linux () {
    sudo apt-get update 
    sudo apt-get upgrade -y
    sudo apt-get install -y git software-properties-common apt-transport-https ca-certificates gnupg-agent python3-pip
    install_ansible
}

mac () {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install python git
    install_ansible
}

install_ansible() {
    pip3 install ansible
    ansible-galaxy install -r requirements.yml --force
}

case "$(uname -s)" in
    Darwin)
        mac
        echo "Ready to run the dry-check. $ ansible-playbook -i inventories/mac playbook.yml --check"
        ;;
    Linux)
        linux
        echo "Ready to run the dry-check. $ ansible-playbook -i inventories/popos playbook.yml --check"
        ;;
    *)
        exit
        ;;
esac