#!/usr/bin/env bash
docker pull "geerlingguy/docker-centos7-ansible:latest"
container_id=$(mktemp)
docker run --detach --volume="$(pwd)":/etc/ansible/roles/role_under_test:rw --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro geerlingguy/docker-centos7-ansible:latest "usr/lib/systemd/systemd" > "$container_id"
docker exec --tty "$(cat $container_id)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml --syntax-check
docker exec --tty "$(cat $container_id)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml --syntax-check
docker exec --tty "$(cat $container_id)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml