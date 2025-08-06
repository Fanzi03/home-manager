{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
			configuration = "sudo nvim /etc/nixos/configuration.nix";
			ehm = "sudo nvim ~/.config/home-manager";
		};	
	};
}
