let 
	nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
	pkgs = import nixpkgs { config = {}; overlays = []; };
	GREETING2 = "Hello everybody";
in 

	pkgs.mkShellNoCC {
		packages = with pkgs; [
			cowsay
			lolcat
		];
		GREETING1 = "HELLO";

		shellHook = ''
			cowsay ${GREETING2} | lolcat
			echo $GREETING1 | cowsay | lolcat
			
		'';
	}
