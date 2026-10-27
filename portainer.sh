
# 1. Check Docker
docker --version
docker info

# 2. Check Swarm status
docker node ls

# 3. Download Portainer Agent stack file
curl -L https://downloads.portainer.io/ce2-16/portainer-agent-stack.yml -o portainer-agent-stack.yml

# 4. Deploy Portainer on Docker Swarm
docker stack deploy -c portainer-agent-stack.yml portainer

# 5. Check deployed services
docker stack services portainer

# 6. Check running containers
docker ps

# 7. Check Portainer service tasks
docker service ps portainer_portainer
docker service ps portainer_agent
