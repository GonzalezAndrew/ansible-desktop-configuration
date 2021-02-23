# Ansible-Desktop

The following repository handles and configures my personal desktop environment. Currently, only Debian based environments can be configured by the Ansible playbook.

# Configuration Files
|Fies|Description|
|----|----|
| `requirements.yml`| Will install other Ansible roles from Ansible Galaxy.|
| `playbook.yml`| The playbook which will configure the environment.|
| `host_vars/mac`| The host variables that will be used by a Mac OS environment.|
| `host_vars/popos`| The host variables that will be used by any Ubuntu environment.|
| `base/files/dotfiles`| The dotfiles that will be used for the environment. Change or add your own dotfiles. Keep in mind you may have to reconfigure `base/tasks/users.yml` in order to incorporate new/different dotfiles.|
| `base/files/sudoers_<user>`| The user sudoer file to add to the sudoers configuration directory.|
| `base/defaults/main.yml`| The default variables for the base configuration.|

## Usage

1. Run the setup shell script.

```bash
$ ./setup.sh
```

2. Configure any files or roles to fit your needs.


3. Run a dry check to verify Ansible will work as expected.

```bash
$ ansible-playbook -i inventories/popos playbook.yml --dry-check
```
4. Run the playbook. 

```bash
$ ansible-playbook -i inventories/popos playbook.yml
```

## TODO
- [ ] Add `mac` role.
- [ ] Make `base` role more robust in installing dotfiles. 
- [ ] Add `vscode` plugin & setting configuration.
- [ ] Add `oh-my-zsh` installation and configuration.
