# desktop_config::apps::discord

class desktop_config::apps::discord {
#TODO: Have this auto update
        exec {"install_discord":
          command => "wget -q 'https://discordapp.com/api/download?platform=linux&format=deb' -O /tmp/discord.deb && dpkg -i /tmp/discord.deb",
          unless => "dpkg -l  | grep -iq 'discord'",
          cwd => "/tmp/",
          path => "/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin", 
	}
# sudo apt-get -f install
 
}

