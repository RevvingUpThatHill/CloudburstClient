# script for manually testing the creation & exposing of the workspace.
mvn package
docker build -t exa-vsc .
docker container kill exa-workspace
docker container rm exa-workspace
docker run -d -it --name=exa-workspace -e PUID=1000 -e product_key=${product_key} -e api_url=${api_url}0 -e lab=start -e PGID=1000 -e TZ=Etc/UTC -e DEFAULT_WORKSPACE=/config/workspace -p 8443:8443 --restart unless-stopped exa-vsc:latest