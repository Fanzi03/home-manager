{ config, pkgs, ...}: {

	imports = [
	 	./neovim.nix
	];
	home = {
		username = "fanzi03";
		homeDirectory = "/home/fanzi03";
		stateVersion = "25.05";

		packages = with pkgs; [
			
		];
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
		};
	};

}
