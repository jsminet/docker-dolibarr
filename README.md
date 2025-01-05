
## <p align="center">Dolibarr on Swarm</p>
    
## 🧐 Features    
- Using docker compose version 2
- Traefik as an tcp/http edge proxy
- MariaDB as database
- Docker secret (that's why swarm is **mandatory**)
        
## 🛠️ Tech Stack
- [Dolibarr](https://www.dolibarr.org/)
- [Traefik](https://doc.traefik.io/traefik/)
- [MariaDB](https://mariadb.org/)


## ⚡ File generation

### Compose file for swarm

The first step is to generate a compose file compliant with Docker Swarm.

**Warning:** Due to json incompatibility between docker compose and docker swarm specifications, you must convert some tags, here is an example using linux sed command

```Bash
docker compose config | sed '/published:/s/\"//g' | sed '/^name:/d' | sed -E 's/(cpus*[^:]+:)\s*([^"#\n]+)$/\1 "\2"/' > stack.yml
```
The **stack.yml** generated file is ready to deploy on a Swarm cluster (see Usage below)

### Docker secret
```bash
# Windows gitbash
openssl rand -base64 20 | docker secret create mysql_root_password -
```

## 🧑🏻‍💻 Usage

### Managing the stack

```Bash
# Swarm initialization
$ docker swarm init
```
```Bash
# Starting the stack
$ docker stack deploy -c stack.yml dolibarr
```
```Bash
# Stopping the stack
$ docker stack rm dolibarr
```
```Bash
# Cleaning all volumes
$ docker compose down -v
```

## 🌱 Backup data

The simplest way is to create a dedicated container with cron jobs (**ubuntu-cron**) to export all critical data into external volumes.

Check the injected [crontab](app/docker-cron/crontab) and change the setup if needed with [some examples](https://crontab.guru/examples.html).

### Database
See [dump_database](app/docker-cron/scripts/dump_database.sh) shell script, the scripts will launch every day at midnight.

### Documents
See [dump_documents](app/docker-cron/scripts/dump_documents.sh) shell script, the script will launch every day at 01:00 am.


        
## 🙇 Author
#### JS
- Github: [@jsminet](https://github.com/jsminet)
        
## ➤ License
Distributed under the MIT License. See [LICENSE](LICENSE) for more information.
        