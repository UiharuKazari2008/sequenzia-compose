<img src="https://user-images.githubusercontent.com/15165770/176505424-2e88c783-7294-48d9-bb0d-ce8da8ae0302.png" width="512" /><br/>

---
Sequenzia is a web based file manager and gallery for JuneFS<br/>
JuneFS is a Discord-backed Filesystem with large file support.

This is a simple "turn-key" solution for the Kanmi x Sequenzia system. This is meant to be a getting started solution and is not meant for production applications. You should start here and then export the database and manually install the parts if you plan to have a larger and more production ready deployment.

This is currently based and locked on Sequenzia v20, For the bleading edge use the "development" branch and for testing updates that are soon to be released use the "prerelease" branch.

# Help Wanted
Do you know NodeJS, HTML, JavaScript, Pug, CSS, SQL, etc? Please contact me on Discord `Yukimi Kazari#9854` to see how you can help the project (possible paid positions avalible)

# Features
* Human-readable Discord Filesystem
* Indirect file access for end-users
  - Users do not need to be a member or need permission to see the channels in discord
  - Access controls are handled by assigning dummy roles to users
  - AuthWare provides a proxy to manage users and permissions
* File uploader with watch folders that are liked to channels
* Modern HTML5 Web interface for accessing and managing files
  - Supports Chrome and Apple WebKit
* Offline Access
* Kongou Media Manager and Player
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

**New v20 Homepage**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 37 21" src="https://user-images.githubusercontent.com/15165770/189299827-222fcba0-82ca-4c89-89c7-6adf1086d429.png"><br/>
**Ambient Homepage (When Idle)**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 37 21" src="https://user-images.githubusercontent.com/15165770/189300145-09082e34-ecc5-412e-83f1-0f592489d6a0.png"><br/>

**Loading Splash Screens**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 37 21" src="https://user-images.githubusercontent.com/15165770/189300505-550ff048-17bb-4d45-996c-c9ca6801427b.png"><br/>

**Channel Navigator**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 38 29" src="https://user-images.githubusercontent.com/15165770/189300983-6bb82653-ef86-4475-9efc-fb8e0a9cf532.png"><br/>

**Media Gallery with Menu open**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 38 29" src="https://user-images.githubusercontent.com/15165770/189301232-4060d0fb-efc0-4c6c-9650-84b90746ad82.png"><br/>

**File Listing**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189301373-780b591c-d828-43dd-a56c-fc17e0f5cdf9.png"><br/>

**NEW! Kongou Media Group**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189301559-14158bfd-80ca-47f4-b616-e703cae23473.png"><br/>

**NEW! Kongou Series**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189301961-28fe2b94-eba8-4940-b6b5-08e1e35ff1d4.png"><br/>

**NEW! Kongou Player (Building Video with Preview Playback**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189302200-d4839741-d135-428e-b15c-622aa504792c.png"><br/>

**NEW! Kongou Player (Full Video Playback with Advanced Controls and Screenshot Tools**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189302413-f383b0f0-8e90-4416-bdf0-b18518a0bcd4.png"><br/>

**NEW! Offline Access**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189303072-50cb5afe-bb7e-46c8-878d-1c780aa7c01f.png"><br/>

**NEW! Offline Gallery**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189303223-d26070b5-7c06-479a-a6b2-e181e4c96a57.png"><br/>

**External Application (Lizumi Web)**<br/>
<img width="1572" alt="Screen Shot 2022-07-04 at 19 54 04" src="https://user-images.githubusercontent.com/15165770/189303635-2f9b276d-d889-43f2-8213-c1189409466b.png"><br/>



## I NEED HELP!
If you need with Sequenzia, you can message me on Discord `Yukimi Kazari#9854`. Otherwise if it's a issue, report it on GitHub as i cant keep track of comment off hand im very busy...

## Reporting Issues
Sequenzia is not a single project or system but multiple separate projects.
* **Issues related to the installation proccess or possibly related to docker should be reported here**
* Filesystem, backend, and discord should be reported [in the kanmi project](https://github.com/UiharuKazari2008/kanmi/issues)
* Web interface or its APIs should be reported [in the sequenzia project](https://github.com/UiharuKazari2008/sequenzia/issues)
* Media Library Indexer should be reported [in the IntelliDex Project](https://github.com/UiharuKazari2008/sequenzia-intellidex/issues)

## Sequenzia CLI
```shell
~/IdeaProjects/sequenzia-compose (prerelease ✘)✹✭ ᐅ ./sequenzia         
Sequenzia Server Control (Alpha)

start      - Boot server
stop       - Shutdown server
restart    - Restart server
reset      - Reset server OS
             [?] Above commands support specifying a component or "list"
mode       - Show or Set Operator Mode
- append         - Append mode to operator mode

router     - Interface with embedded LANTIS router (must be enabled)
- start          - Start all routes
- stop           - Kill all routes
- keygen-setup   - Generate a new keypair for setup
- keygen-master  - Generate a new keypair for transport
- pubkeys        - Display public keys
- config         - Edit the Connections

status     - Status of components
logs       - Show components logs

test       - Boot server in foreground
test-core  - Boot Core Components in foreground

config     - Edit User Configuration File
env        - Edit User Environment File
setupaw    - Edit AuthWare Configuration File

certs      - Manage SSL Certificates
- request        - Request new certificate from Certbot
- selfsigned     - Generate self signed certificate
- reset          - Remove Certbot Certificates and Settings

[!] You MUST have configured a valid "EXTERNAL_FQDN", "CERT_EMAIL", and
    have configured LANTIS or Port Forwarding for remote access

refresh    - Update to latest commit (Non-Persistent)
prerelease - Update to latest prerelease commit (Non-Persistent)
build      - Rebuild Element(s) and Reload Static Files
fbuild     - Rebuild ACROSS, Update base files, and Build Elements
publish    - Publish ACROSS Images (Contributors Only)

upload     - Backup Database to Discord #backup Channel
backup     - Backup Database to /common/data/backup
restore    - Restore last Database from /common/data/backup

export     - Export Kickstart Tarball
import     - Import Kickstart Tarball
```
## Update Base Image (When you modify files in /base or Unsupposted CPU Architecture)
*Add `-f` for the extra modules you are trying to restart*
```shell
./sequenzia fbuild
```
