# docker-machiavelli
Docker build scripts for machiavelli

# Sample configuration

Run the dockerised machiavelli using the host filesystem's config yaml file as the settings: 

    docker run -v machiavelli-config.yml:/machiavelli/config/settings.yml anchor/machiavelli
