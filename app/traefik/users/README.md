Create a file you must name *usersfile* for traefik dashboard access with basicauth

Create hash password

```
echo $(htpasswd -nb username password) | sed -e s/\\$/\\$\\$/g
```