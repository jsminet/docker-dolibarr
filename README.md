
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


## 🛠️ File generation


### Compose file for swarm

**Warning:** Due to json incompatibility between docker compose and docker swarm specifications, you must convert some tags, here is an example using linux sed command

```Bash
docker compose config | sed '/published:/s/\"//g' | sed '/^name:/d' | sed -E 's/(cpus*[^:]+:)\s*([^"#\n]+)$/\1 "\2"/' > stack.yml
```
### Docker secret
```bash
# Windows gitbash
openssl rand -base64 20 | docker secret create mysql_root_password -
```

## 🧑🏻‍💻 Usage

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
        
## 🙇 Author
#### JS
- Github: [@jsminet](https://github.com/jsminet)
        
## ➤ License
Distributed under the MIT License. See [LICENSE](LICENSE) for more information.
        