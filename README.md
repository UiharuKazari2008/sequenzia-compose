<img src="https://user-images.githubusercontent.com/15165770/176505424-2e88c783-7294-48d9-bb0d-ce8da8ae0302.png" width="512" /><br/>

---
Sequenzia is a web based file manager and gallery for JuneFS<br/>
JuneFS is a Discord-backed Filesystem with large file support.

This is a simple "turn-key" solution for the Kanmi x Sequenzia system. This is meant to be a getting started solution and is not meant for production applications. You should start here and then export the database and manually install the parts if you plan to have a larger and more production ready deployment.


# NOTICE
This is considered to be in active development and Dockerfiles and configurations can be changed on the fly to make this more reliable for the long term. Please allways check the CHANGELOG for the latest chnages and the Installation guide for the latest configuration.<br/>

# Features
* Human-readable Discord Filesystem
* Indirect file access for end-users
  - Users do not need to be a member or need permission to see the channels in discord
  - Access controls are handled by assigning dummy roles to users
  - AuthWare provides a proxy to manage users and permissions
* File uploader with watch folders that are liked to channels
* Modern HTML5 Web interface for accessing and managing files
  - Supports Chrome and Apple WebKit
* Client-side file compiler (LB+CS-FC) in browser
  - Allows large files that have been split into parity to be build on the client side browser
  - This reduces server load and makes the end user the bearer of the file
* Web based Ambient Display (Photo frame) that can be setup on a RPi
* Discord based command interface
* Automatic Backup system
* Many More...

### [Click here for installation and setup guide](https://github.com/UiharuKazari2008/sequenzia-compose/wiki/Installation)

# Screenshots
_Screenshots are from the production installation and may not refect a new installation and may show features that have not been documented yet_<br/>

**Homepage**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 37 21" src="https://user-images.githubusercontent.com/15165770/177521828-654963fe-00d7-4af1-81ad-6e3a39b85ce3.png"><br/>

**Latest Media Gallery with Menu open**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 38 29" src="https://user-images.githubusercontent.com/15165770/177522138-5a526172-9047-4dba-af57-952db0e17097.png"><br/>

**Gallery of a channel**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 33 56" src="https://user-images.githubusercontent.com/15165770/177522385-3eca45e5-7f78-4cc6-ae86-1a69ac8dd260.png"><br/>

**File list of a channel**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/177522643-54974aa3-fe8c-4f0a-ae7a-3eab94e9b207.png"><br/>

**Playback of a large video file by useing client-side file compiler (LB+CS-FC v1)**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/177522920-93a36950-57d7-4043-9e52-e7067607ef87.png"><br/>

## I NEED HELP!
If you need with Sequenzia, you can message me on Discord `Yukimi Kazari#9854`. Otherwise if it's a issue, report it on GitHub as i cant keep track of comment off hand im very busy...

## Reporting Issues
Sequenzia is not a single project or system but multiple separate projects.
* **Issues related to the installation proccess or possibly related to docker should be reported here**
* Filesystem, backend, and discord should be reported [in the kanmi project](https://github.com/UiharuKazari2008/kanmi/issues)
* Web interface or its APIs should be reported [in the sequenzia project](https://github.com/UiharuKazari2008/sequenzia/issues)
* Media Library Indexer should be reported [in the IntelliDex Project](https://github.com/UiharuKazari2008/sequenzia-intellidex/issues)

## Quick Commands
### Start Server:
```shell
docker compose up -d
```

### Stop Server
```shell
docker compose down
```

### Update Server
*Add `-f` for the extra modules you are trying to restart*
```shell
docker compose restart
```

### Start with Web Desktop for SQL Administration
```shell
docker compose -f docker-compose.yaml -f docker-compose-manager.yaml up
```

### Stop with Web Desktop for SQL Administration
```shell
docker compose -f docker-compose.yaml -f docker-compose-manager.yaml down
```


### Update Base Image (When you modify files in /base)
*Add `-f` for the extra modules you are trying to restart*
```shell
docker build --no-cache -t kihara/across-base:latest ./base
docker compose build --no-cache
```
**If you are only updating the config files you do not need `--no-cache` to speed up build times**
