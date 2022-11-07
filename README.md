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