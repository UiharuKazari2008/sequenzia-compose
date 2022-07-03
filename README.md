<img src="https://user-images.githubusercontent.com/15165770/176505424-2e88c783-7294-48d9-bb0d-ce8da8ae0302.png" width="512" /><br/>

---
Sequenzia is a web based file manager and gallery for JuneFS<br/>
JuneFS is a Discord-backed Filesystem with large file support.

This is a simple "turn-key" solution for the Kanmi x Sequenzia system. This is meant to be a getting started solution and is not meant for production applications. You should start here and then export the database and manually install the parts if you plan to have a larger and more production ready deployment.

<img width="1059" src="https://user-images.githubusercontent.com/15165770/176510591-c0dd6320-eca8-44ec-bb99-fbcb20763b07.png" >

# Features
* Human-readable Discord Filesystem
* Indirect file access for end-users
  - Users do not need to be a member or need permission to see the channels in discord
  - Access controls are handled by assigning dummy roles to users
  - AuthWare provides a proxy to manage users and permissions
* File uploader with a dropbox folder
* Web interface for accessing and managing files
* Web based Ambient Display (Photo frame) that can be setup on a RPi
* Discord based command interface
* Automatic Backup system
* Many More...

### [Click here for installation and setup guide](https://github.com/UiharuKazari2008/sequenzia-compose/wiki/Installation)

## I NEED HELP!
If you need with Sequenzia, you can message me on Discord `Yukimi Kazari#9854` or [join the official private discord](https://discord.gg/TbNyVmqRzh). Otherwise if it's a issue, report it on GitHub as i cant keep track of comment off hand im very busy...

## Reporting Issues
Sequenzia is not a single project or system but multiple separate projects.
* **Issues related to the installation proccess or possibly related to docker should be reported here**
* Filesystem, backend, and discord should be reported [in the kanmi project](https://github.com/UiharuKazari2008/kanmi/issues)
* Web interface or its APIs should be reported [in the sequenzia project](https://github.com/UiharuKazari2008/sequenzia/issues)

## Quick Commands
### Start Server:
```shell
docker compose up
```

### Stop Server
```shell
docker compose down
```

### Start with Web Desktop for SQL Administration
```shell
docker compose -f docker-compose.yaml -f docker-compose-manager.yaml up
```

### Stop with Web Desktop for SQL Administration
```shell
docker compose -f docker-compose.yaml -f docker-compose-manager.yaml down
```

### Update Server
*Add `-f` for the extra modules you are trying to restart*
```shell
docker compose restart
```

### Update Base Image (When you modify files in /base)
*Add `-f` for the extra modules you are trying to restart*
```shell
docker build --no-cache -t kihara/across-base:latest ./base
docker compose build --no-cache
```
**If you are only updating the config files you do not need `--no-cache` to speed up build times**
