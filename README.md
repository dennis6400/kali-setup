---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-14 01:14:30
---

# Kali Setup

This Ansible Playbook automates the setup of Kali machines used penetration tests. The containing Ansible roles automate the downloading & installation of additional tools for penetration testing, installing & customization further desktop environments and setting up Kali itself. The playbook consists of the following roles:

|Role|Description|
|-|-|
|tools|Installation and configuration of tools.|
|desktop|Installation of desktop environments (e.g. GNOME).|
|services|Installation and configuration of services (e.g. SSH server).|
|basic-customization|Setup timezone, keyboard layout and locales|
|desktop-customization|Customization of installed desktops (e.g. applying GNOME settings).|
|special-customization|Setup of the shell profile, aliases, host file, etc.|
|secrets|Rollout of secrets (e.g. SSH key, VPN configurations).|

## Installation of Ansible

### Linux

***Important: This Ansible playbook is also using the comunity collections, which are not included in `ansible-core`., which is in many officially Linux repositories. Therefore, the Ansible repository must be added for installing Ansible  with the community collections (see [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#selecting-an-ansible-package-and-version-to-install)).***

**Step 01 -** Define code name: 

```shell
UBUNTU_CODENAME="jammy"
```

**Step 02 -** Download and import repo keys:

```shell
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
```

**Step 03 -** Add Ansible repository:

```shell
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu ${UBUNTU_CODENAME} main" | sudo tee /etc/apt/sources.list.d/ansible.list
```

**Step 04 -** Install Ansible:

```shell
sudo apt update && sudo apt install -y ansible
```

For additional Information, see [here](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-debian)!

### MacOS

**Step 01 -** Install Homebrew:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Step 02 -** Update Homebrew:

```shell
brew update
```

**Step 03 -** Install Ansible:

```shell
brew install ansible
```

## Usage

### Setup Inventory

This playbook is intented to deploy a default environment on the kali hosts. In order to use this playbook efficiently, it should be run against an inventory of kali hosts. This can be done by creating an inventory of hosts.

To configure the hosts inventory, open and edit the file `kali-default-hosts` for including the hosts in the following manner:

```yml
[kali-default] # <- Group
192.168.xx.xx vmware_vm=yes # CHANGE THIS
192.169.xx.xx vmware_vm=no  # CHANGE THIS
...
```

*Inspired by https://github.com/hackedbyagirl/offensive-kali-ansible.*

### Setup variables

The directory `group_vars` contains the variables of the groups which are defined inventory.  The "default" group is `kali-default`. All relevant variables should be defined in the file `group_vars/kali-default.yml`. Refer to [Custom Variables](doc/Custom%20Variables.md) for getting an overview of all available variables.

Variables will be defined in several location within the playbook:

|Priority|Variable Location|Description|
|-|-|-|
|1|Command line param (`--extra-vars`)|Variables can be defined also on command line. These variables will overwrite all variables defined in other locations. Refer to [Makefile](doc/Makefile.md) for examples.|
|2|`host_vars`|Variable definitions which will affect only one specific host.|
|3|`group_vars`|Variable definitions which will a affects a group of hosts (e.g. ***kali* group**). |
|4|`host_vars`|Variable definitions which will a affects only a specific host (e.g. ***kali* group**). | 
|5|`role/<role>/default/main.yml`|The purpose of the dafults directories in each role is to setup default values for variables and to ensure, that playbooks runs correctly if no variable is setup somewhere else.|

The defined variables in the directory group_vars "overwrites" the variables, which are defined in `roles/<role>/default/main.yml`, because variable in the directory `group_vars` has a higher priority. For more information about **variables** and **their precedence**, refer to [Variable precedence](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable) and [Using Variables](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.htm).

***Important:  Variables, which are defined in `roles/<role>/default/main.yml` <u>should not</u> be altered. Otherwise the playbook may will not work correctly.***

The file `group_vars/template.yml` contains an example configuration and can be used as template:

```shell
cat group_vars/template.yml
```

Configuration changes should be done in the file `group_vars/kali-default.yml`:

```shell
nano group_vars/kali-default.yml
```

### Setup SSH connection

 If **no SSH key** is available, generate a **new** SSH key. After that, Copy the key to the remote sever(s):

```shell
ssh-copy-id -i ~/.ssh/<private SSH key> kali@192.168.xx.xx
```

```shell
ssh-copy-id -i ~/.ssh/<private SSH key> kali@192.169.xx.xx
```

### Setup SSH server on the remote server(s)

It is recommend making the SSH server on the remote sever(s) bootsafe. Connect to the remote server(s) and executing the following commands on each remote server:

```shell
sudo systemctl enable ssh.service && sudo systemctl start ssh.service 
```

For checking the satus of the respective SSH server, use the following command:

```shell
systemctl status ssh.service 
```

###  Downloading & Running the Playbook 

**Step 01 -** Clone the repository:

```shell
git clone git@github.com:dennis6400/kali-setup.git && cd kali-setup
```

The command above clone the latest state (master branch) of the repository. Refer to [Alternative Downloads](#Alternative%20Downloads) for alternative downloads.

**Step 02 -** Edit the inventory file and add the corresponding hosts:

```shell
nano kali-default-hosts
```

**Step 03 -** Edit the "global" configuration for the Kali machine(s):

```shell
nano group_vars/kali-default.yml
```

**Step 04 -** Setup SSH connection:

```shell
eval $(ssh-agent -s) && ssh-add ~/.ssh/<private SSH key>
```

**Step 05 -** Load profile:

```shell
. profiles/default-hosts.profile
```

**Step 06 -** Start deployment:

```shell
make skip-secrets
```

*The make command `skip-secrets` is used, because the secrets are not configured yet.*

**(Optional) Step 07 -** Restart the Kali machine(s) after the deployment. This step is only needed, if a desktop environment was installed.

## Alternative Downloads

### Clone Master Branch

```shell
git clone git@github.com:dennis6400/kali-setup.git
```

### Download Master Branch

```
https://github.com/dennis6400/kali-setup/archive/refs/heads/master.zip
```

### Clone Specific Branch/Tag/Release

```shell
git clone --depth 1 --branch v1.0.0 git@github.com:dennis6400/kali-setup.git
```

### Download Specific Branch/Tag/Release

```
https://github.com/dennis6400/kali-setup/archive/refs/tags/v1.0.0.zip
```

## Vagrant

### Installation of Vagrant

#### MacOS

```shell
brew install vagrant
```

#### Linux

```shell
sudo apt update && sudo apt install vagrant
```

### Installation of Vagrant Plugin for VMware

See [here](https://developer.hashicorp.com/vagrant/docs/providers/vmware/installation)!

### Starting a Kali Test VM 

**Step 01 -** Clone the repository:

```shell
git clone git@github.com:dennis6400/kali-custom-setup.git && cd kali-custom-setup
```

**Step 02 -** Start Kali test VM via vagrant:

```shell
vagrant up --provider=virtualbox
```

```shell
vagrant up --provider=vmware_fusion
```

The test VM will be started by vagrant and automatically configured by the `provision.sh` script. 

### Stop the Kali Test VM

```shell
vagrant halt
```

### Delete the Kali Test VM

```shell
vagrant halt && vagrant destroy -f
```

## Advanced Usage

Refer to  the following articles:
- [Important Params](doc/Important%20Params.md)
- [Tags](doc/Tags.md)
- [Makefile](doc/Makefile.md)
- [Setup Shell](doc/Setup%20Shell.md)
- [Setup Hosts File](doc/Setup%20Hosts%20File.md)
- [Setup Git](doc/Setup%20Git.md)
- [Setup Secrets](doc/Setup%20Secrets.md)

## Acknowledgements

The developmen of te playbook was inspired by the following autors and projects:
- [@hackedbyagirl -  Offensive Kali Ansible Playbook ](https://github.com/hackedbyagirl/offensive-kali-ansible)
- [@iesplin - ansible-playbook-kali](https://github.com/iesplin/ansible-playbook-kali)