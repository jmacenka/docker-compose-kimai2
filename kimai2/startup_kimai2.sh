echo "NOW: Sourcing .env"
source .env
echo "NOW: Pulling GitHub Repo..."
git clone https://github.com/tobybatch/kimai2.git && cd kimai2
echo "NOW: Waiting for containers to finally come up..."
docker-compose up -d
echo "NOW: Creatig superuser..."
docker exec kimai2_kimai_1 /opt/kimai/bin/console kimai:create-user $USERNAME $USEREMAIL ROLE_SUPER_ADMIN $USERPW
echo "All Done, Containers are up and running. Visite http://$(hostname -I | cut -d' ' -f1):8001"