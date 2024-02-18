# Linux New File Notification via Discord Webhook
This is a very simple bash script using inotifywait to monitor a directory (and sub-directories) for new file changes. For example, if a new file is created in the directory recursively, it will send a Discord message via a Discord webhook.

Install inotify-tools package for inotifywait:\
`dnf install inotify-tools`

Create a Discord webhook on your server and give it access to the channel you want to send notifications to and paste the webhook URL. You can also modify or remove the "<@Discord_User_ID>" section in the script if you don't want it to tag a user directly. The webbook message will show as "@User New file added: <Directory/File that was added>"

Run the script in the background so you can close your shell session:\
`nohup ./filenotify.sh &`
