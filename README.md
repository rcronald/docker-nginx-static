Azure commands:
- az group create --name RGEU2ELIMINARTMP --location "East US 2"
- az appservice plan create --name speliminartmp --resource-group RGEU2ELIMINARTMP --sku S1 --is-linux
- az webapp create --resource-group RGEU2ELIMINARTMP --plan speliminartmp --name webeliminartmp --deployment-container-image-name rcronald/docker-nginx-static:latest
- az webapp config appsettings set --resource-group RGEU2ELIMINARTMP --name webeliminartmp --settings WEBSITES_PORT=8000
- az webapp config appsettings set --resource-group RGEU2ELIMINARTMP --name webeliminartmp --settings NGINX_PORT_X=90

Based: https://docs.microsoft.com/en-us/azure/app-service/containers/tutorial-custom-docker-image
