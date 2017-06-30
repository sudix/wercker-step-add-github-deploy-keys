#!/bin/sh

# Check variables
if [ -z "$WERCKER_ADD_GITHUB_DEPLOY_KEYS_KEY1" ]; then
  echo "Please set the 'key1' variable"
  exit 1
fi

main() {
    local ssh_dir="${HOME}/.ssh"
    local ssh_config="${ssh_dir}/config"
    $WERCKER_STEP_ROOT/add_deploy_keys.sh $ssh_dir $ssh_config
}

main;
