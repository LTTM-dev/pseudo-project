# Pseudo Project

## Description
A simple pseudo project for the lecture DevOps at the DHBW Stuttgart.

## Installation
### Docker
You can use Docker to use this application.
You can also use a prebuilt docker image from [hub.docker.com/lukasljl/pseudo-project](https://hub.docker.com/r/lukasljl/pseudo-project)
Start the docker container with the docker compose file
```bash
docker compose up -d
```

If you want you can build by your self and start it via docker compose. 
```bash
docker compose -f docker-compose-local-yaml up -d --build
```

### Vagrant with Ansible
You can use Vagrant to provision a local VM to run this application.
Start the provisioned VM with:
```bash
vagrant up
```

### Nix
To develop on your local system use:
```bash
nix develop
```

To build a docker image use:
```bash
nix build
docker load < result  
```

## Develop
To run flask locally use:
```bash
flask run --host=0.0.0.0
```
To run this app locally with an WSGI server(recommended for production):
```bash
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

To run the tests use:
```bash
python -m pytest -v
```

## Deployment
To deploy our container to Azure use the following command:
```bash
terraform init
terraform apply
```
Note: Make sure to have azure cli installed with your account logged in.

