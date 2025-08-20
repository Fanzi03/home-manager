{ config, pkgs, ...}: {

	imports = [
	 	./programs/neovim.nix
		./programs/git.nix
		./programs/bash.nix
		./programs/waybar.nix
		#		./programs/hyprland.nix
	];
	home = {
		username = "fanzi03";
		homeDirectory = "/home/fanzi03";
		stateVersion = "25.05";

		packages = with pkgs; [
			
			pavucontrol
			timer
			libnotify
			mako
			haskellPackages.pulseaudio

			jq
			python313Packages.xmljson
			waybar
     			xorg.libX11 
     			xorg.libXrender
     			xorg.libXtst 
     			gtk3 
     			glib
     			openjfx21

		];
	};


}
