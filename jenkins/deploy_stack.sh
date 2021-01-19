#!/bin/bash
scp docker-compose.yaml jenkins@swarm-master:/home/jenkins/docker-compose.yaml
ssh -i ~/.ssh/ansible_id_rsa jenkins@swarm-master << EOF
    export DATABASE_URI=${DATABASE_URI}
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml
EOF