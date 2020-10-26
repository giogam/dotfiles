#!/usr/bin/env bash

set -e

# Dotfiles' project root directory
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOT_DIR/hosts"
# Main playbook
PLAYBOOK="$ROOT_DIR/dotfiles.yml"

# Installs ansible
pacman -Syu ansible

# Runs Ansible playbook using our user.
ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass

exit 0