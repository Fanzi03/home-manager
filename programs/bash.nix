{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
			configuration = "sudo -E nvim /etc/nixos/configuration.nix";
			ehm = "cd ~/.config/home-manager && nvim .";
			Envim = "nvim ~/.config/home-manager/programs/neovim.nix";
			projects = "cd ~/tool/MyProjects/ && nvim .";
			projectsD = "cd ~/tool/MyProjects";
			zapretD = "(cd ~/tool/zapret/zapret-discord-youtube-linux && sudo ./main_script.sh)";

			timers = "cd ~/.config/home-manager/scripts && ./timers.sh";
			timersS = "cd ~/.config/home-manager/scripts";
			minecraft = "cd ~/mine && steam-run java -jar TLauncher.jar";
		};	
		initExtra = ''
      			update_kitty_title() {
	  		local layout=$(setxkbmap -query 2>/dev/null | grep layout | awk '{print $2}')
	  		case $layout in 
				"us") echo -ne "\033]0;🇺🇸 $(basename "$PWD")\007" ;;
	      			"ru") echo -ne "\033]0;🇷🇺 $(basename "$PWD")\007" ;;
	      		*) echo -ne "\033]0;🌐 $(basename "$PWD")\007" ;;
	  		esac
      			}

      			PROMPT_COMMAND="update_kitty_title; $PROMPT_COMMAND"	
		'';
	};
}
