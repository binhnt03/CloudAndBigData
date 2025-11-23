[spark_master]
${master_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa

[spark_worker]
%{ for ip in worker_ips ~}
${ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
%{ endfor ~}

[spark_edge]
${edge_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa

[spark_cluster:children]
spark_master
spark_worker
spark_edge


[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
