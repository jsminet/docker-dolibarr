# docker-dolibarr
Dockerfile for Dolibarr ERP/CRM

## Tips and tricks

- Only swarm mode can leverage docker secret
- Use these magic commands to deploy

On Windows gitbash

``` 
docker-compose config | docker stack deploy -c - stack-name 
```

On Linux

```
docker stack deploy -c <(docker-compose config) stack-name
```