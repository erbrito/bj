#!/bin/bash

export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
export ANSIBLE_RETRY_FILES_ENABLED=0
export ANSIBLE_ROLES_PATH=../
#export ANSIBLE_CALLBACK_WHITELIST="profile_tasks,junit"
export JUNIT_OUTPUT_DIR=reports/
export ANSIBLE_CALLBACK_WHITELIST="junit"
_ROLENAME=$(basename $(pwd)|xargs)
yamllint . && \
ansible-lint .  && \
ansible-playbook tests/*.yaml -e "rolename=${_ROLENAME}" -t init,end && \
ansible-playbook tests/*.yaml -e "rolename=${_ROLENAME}"
