Ansible Cloudwatch Monitoring Python 
=========

[![Build Status](https://travis-ci.org/andreyrusanov/cloudwatch-py-ansible.svg?branch=master)](https://travis-ci.org/andreyrusanov/cloudwatch-py-ansible)

Configures your instances with cloudwatch monitoring scripts from [cloudwatch-mon-scripts-python](https://github.com/osiegmar/cloudwatch-mon-scripts-python)

Requirements
------------

Python2 and pip should be installed; 
Any issues relate to system setup like configuring locale is not covered by this role.

Role Variables
--------------

```yaml
cwm_crontab: 'cloudwatch'  # crontab name
cwm_use_venv: True  # install in virtualenv
cwm_create_venv: "{{ cwm_use_venv }}"  #  is it needed to create virtualenv
cwm_iam_policy: True 

# should be set only if cwm_iam_policy is true
cwm_aws:
  access_key: null
  secret_key: null

cwm_user: root  # default user
cwm_venv_path: "/home/{{ cwm_user }}/venv"
cwm_cronfile: 'cloudwatch'  # cronfile name(if separate file for cron needs to be created)

cwm_flags:
  - mem-util
```

Dependencies
------------

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: andreyrusanov.cloudwatch-py-ansible }

License
-------

MIT
