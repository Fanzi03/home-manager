{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
			configuration = "sudo -E nvim /etc/nixos/configuration.nix";
			ehm = "nvim ~/.config/home-manager";
			Envim = "nvim ~/.config/home-manager/programs/neovim.nix";
			projects = "nvim ~/tool/MyProjects";
		};	
	};
}
