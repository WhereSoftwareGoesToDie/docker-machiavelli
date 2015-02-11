# docker-machiavelli
Docker build scripts for machiavelli

# Sample configuration

Run the dockerised machiavelli using the host filesystem's config yaml file as the settings: 

    docker run -p 8080:80 --name machiavelli -v machiavelli-config.yml:/machiavelli/config/settings.yml anchor/machiavelli
