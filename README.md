# Sequenzia All-In-One

---
A easy turn-key solution for the Kanmi x Sequenzia system. This is ment to be a getting started solution and is not ment for production applications. You should start here and then export the database if you plan to have a larger and more production ready deployment.

## Prerequisites
- Docker
- Docker Compose
- 4 Cores
- 4 GB RAM MINIMUM
  - This is a heavy system with everything on a single host

## Steps required on Discord 
Required steps to setup discord:<br/>
Suggestion: Create a new discord account that will be the owner of the Bots and Storage Servers<br/>
* This keeps them out of your server list
* Prevents data loss in the event someone could gains access to your account
* There is a built in Elevation commands in AuthWare to get permissions when you need it

### Storage Server
Now create your first data storage server, This is where data will be stored. You can create additional servers later.<br/>

Here are some important things to consider:<br/>
- Data Storage servers should be separate from end users for privacy and security reason
    - Community members and administrators that are not actual sequenzia server administrators should NEVER have access to data storage servers.
    - There is very little administration that can be done outside of Sequenzia due to the sheer amount of data that can add up and become burred into the channels.
- There should always be a "Home Server" that all logging and commands will occur in, this first server should be it
- Users that will login and access Sequenzia will be in a separate "AuthWare Enabled" server.
    - You do not have to but if you want to add other users its easier to just add roles in a existing community
    - To start your first servers will have AuthWare enabled, please disable it after you have setup AuthWare on a server.

**Make sure your Discord client is in Developer Mode to be able to Copy IDs: User Settings > Advanced > Developer Mode**<br/>

[Create a new Discord server based on Server Template](https://discord.new/24abfE2KTdd9)<br/>
**It is not suggested that you use an exsisting server if this is your first time and are new to the structure of JuneFS. You can later add an exiting server by manually setting the records in the database. (Not newby stuff)**<br/>

* Add a image to your server, If you want to use the default there is one provided in /assets/seq.png and /assets/datastore.png
* Set a name for your server
* Import the emojis into your server from /assets/emojis/, **Do not change there names**
    - If you don't, the automatic setup will not setup reaction actions and CMS will not work out the box.
* Once created, DO NOT change anything until you have completed the initialization.
* Give your self all the read, write, and manage files, aswell as the server manager role

### AuthWare Bot
Next, You will want to enable a server that contains members to be AuthWare enabled, this will provision users with the appropriate roles to access Sequenzia and its contents.
Here are some important things to consider:<br/>

* You can add this bot to any any existing server as long as you create the required roles
* New servers must be registered with the database manually
* Each AuthWare Server should each have similar Roles like bellow
    * Framework - Bot Role that contains the AuthWare and Sequenzia Bots
    * Admin Mode - Elevated User Status for Administration Tasks (For Elevation Feature) - Required for Data Storage Servers
    * Manager - Elevate to Administrator Mode, and other admin functions - Required for Data Storage Servers
    * Access - Allowed to Login - REQUIRED
        * The named permissions that you would like to assign
        * "Some Permission" Read - Read/View a group of channels
        * "Some Permission" Write - Upload to a group of channels
        * "Some Permission" Manage - Move/Delete from a group of channels
    * The bot must have permissions above the administrator mode in order to elevation
        * If you do not want the security of elevation then "Admin Mode" but Manager Role is still required

* Create the Discord Application for AuthWare - https://ptb.discord.com/developers/applications
    * Set a name, Users will see this when they login
    * Set a image, You can use the /assets/authware.png image for the application
    * Set a description, users will see this in there Applications section of there account
        * Example: Sequenzia-compatible Single Sign-on Authentication Interface
* Go to OAuth2
    * Add Redirect
    * Copy the Client ID and Client Secret to a notepad
    * http://localhost:3000/discord/callback
    * For external access, you will need to read the section at the end of the readme
* Go to Bot
    * Add Bot
    * Copy Token to a notepad
    * Disable Public Bot
    * <b>You must enable the 2 privileged gateway Intents</b>
        * You are responsible for getting you instance of the Bot verified if you are installing this on more then 100 servers
* Add the Bot to your Community Servers or your Data Server (for small deployments)
    * Open a new tab and add the bot to your new data storage server: `https://discord.com/oauth2/authorize?client_id=123456789012345678&scope=bot+applications.commands`<br/>
    * Replace `123456789012345678` with your Application ID<br/>
    * Once Added to the Server add the bot to the "Security Engine" Role: Server Settings > Roles > Framework > Add Members > Select the Bot<br/>

### Framwwork Bot
Next, You will want to create and add the framework bots that will do all communications for data storage servers.<br/>
Here are some important things to consider:<br/>
* Do not add this to community servers, The Framework bot should only be installed in storage servers
* Its important that you secure your account and access to the bot token.

- Create the Discord Application for Framework - https://ptb.discord.com/developers/applications
    - Set a name
    - Set a image, You can use the /assets/framework.png image for the application
- Go to Bot
    - Add Bot
    - Copy Token to a notepad
    - Disable Public Bot
    * <b>You must enable all Intents</b>
        * You are responsible for getting you instance of the Bot verified if you are installing this on more then 100 servers
- Add the Bot to your Data Server
    - Open a new tab and add the bot to your new data storage server: `https://discord.com/oauth2/authorize?client_id=123456789012345678&scope=bot+applications.commands`<br/>
      - Replace `123456789012345678` with your Application ID<br/> 
      - Once Added to the Server add the bot to the "Framework Engine" Role: Server Settings > Roles > Framework > Add Members > Select the Bot

## Configuration File
Create the user-config.json file in /common/config/
```json
{
  "Discord_Key": "The framework bots token",
  "Authware_Key": "The authware bots token",
  "DiscordHomeGuild": "The new discord server ID",
  "discord_id": "The authware bot's OAuth client ID",
  "discord_secret": "The authware bot's OAuth client secret",
  "discord_redirect_base": "http://127.0.0.1:3000",
  "cookie_secret": "DockerKanmi@CHANGETHISDAMNSECRET",
  "enable_impersonation": true,
  "use_secure_cookie": false
}
```
<b>Remove enable_impersonation if there is not on your localhost</b>

## Setup
```shell
docker build --no-cache -t acr/across-kanmi:latest ./base
docker compose up -f docker-compose-setup.yaml
```
Once you see AuthWare running you can shutdown and then run it normally
```shell
docker compose up
```
* You should be able to login from http://localhost:3000 or use http://localhost:3000/discord/impersonate/YOUR_USER_ID
* Add `-d` to run in the background

## Closeing
* Your FileWorker Upload folder is /common/data/upload
* Please go to the admin console at http://localhost:6080 to access the GUI database manager (DBadger)
  * You will have to edit SQL to do:
    * Set inital parent channel permmisons
    * Set a folders watchfolder name for FileWorker
    * Set channel name overides
    * Assign custom role mappings
    * Etc.
  * You may want to read the full setup guide in the Kanmi repo wiki to understand the database so you can do more advanced things
