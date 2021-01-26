#!/usr/bin/env bash

set -e

# Dotfiles' project root directory
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOT_DIR/hosts"
# Main playbook
PLAYBOOK="$ROOT_DIR/dotfiles.yml"

# Installs base dependencies
sudo apt update
sudo apt install ansible
# Runs Ansible playbook using our user.
ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass --extra-vars "username=$USERNAME"

exit 0