{ config, pkgs, ...}: {

	imports = [
	 	./programs/neovim.nix
		./programs/git.nix
		./programs/bash.nix
	];
	home = {
		username = "fanzi03";
		homeDirectory = "/home/fanzi03";
		stateVersion = "25.05";

		packages = with pkgs; [
			
		];
	};


}
