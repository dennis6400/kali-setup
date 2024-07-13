##
# Check inventory
##
inv:
	env | grep INVENTORY


##
# Deploy playbook comletely (tools, desktop, etc.)
##
deploy:
	ansible-playbook -i ${INVENTORY} --ask-become-pass --ask-vault-pass site.yml


##
# Tools
##

# Install only tools
tools:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'install-apt-tools, install-git-tools, install-further-tools' site.yml

# Skip installing tools
skip-tools:
	ansible-playbook -i ${INVENTORY} --ask-become-pass --skip-tags 'install-apt-tools, install-git-tools, install-further-tools' site.yml

# Install/update only Obsidian
obsidian:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'install-obsidian' site.yml

# Install/update only Sublime Text & Sublime Merge
sublime:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'install-sublime' site.yml

# Install/update only Burp Suite
burpsuite:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'install-burpsuite' site.yml

# Install/update only 1Password
1password:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'install-1password' site.yml


##
# Desktop
##

# Install and setup only GNOME desktop environment
force-deploy-gnome:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'install-desktop, setup-desktop' --extra-vars "install_desktop=only-gnome setup_desktop=only-gnome" site.yml

# Install and setup the choosen desktop environment
desktop:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'install-desktop, setup-desktop' site.yml

# Skip installing and customizing any desktop environment
skip-desktop:
	ansible-playbook -i ${INVENTORY} --ask-become-pass --skip-tags 'install-desktop, setup-desktop' --extra-vars "install_desktop=none setup_desktop=none" site.yml
	

##
# Basic setup
##

# Setup only keyboard, timezone, etc.
basic-setup:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'basic-setup' site.yml


##
# Shell
##

# Setup only shell profile & aliases
shell:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'setup-shell-profile, setup-shell-aliases' site.yml

# Setup only shell aliases
shell-aliases:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'setup-shell-profile, setup-shell-aliases' site.yml


##
# Hosts file
##

# Setup only hosts file
hosts:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'setup-hosts' site.yml


##
# SSH & VPN
##

# Setup only secrets (e.g. SSH, VPN)
secrets:
	ansible-playbook -i ${INVENTORY} --ask-become-pass --ask-vault-pass -t 'setup-secrets' site.yml

# Skip setting up secrets (e.g. SSH, VPN)
skip-secrets:
	ansible-playbook -i ${INVENTORY} --ask-become-pass --skip-tags 'setup-secrets' site.yml

# Remove all secrets
remove-secrets:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'remove-secrets' --extra-vars "remove_ssh=yes remove_vpn=yes" site.yml

# Remove SSH keys
remove-ssh:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'remove-secrets' --extra-vars "remove_ssh=yes" site.yml

# Remove VPN configurations & keys
remove-vpn:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'remove-secrets' --extra-vars "remove_vpn=yes" site.yml


##
# Misc
##
misc:
	ansible-playbook -i ${INVENTORY} --ask-become-pass -t 'setup-misc' site.yml


##
# Show ansible tags
##
tags: 
	ansible-playbook --list-tags site.yml


##
# Show git configuration file
##
git:
	cat .git/config


##
# Show the Makefile with all available make commands
##
help:
	cat ./Makefile