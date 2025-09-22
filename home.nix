{ config, pkgs, ... }:

{
	home.username = "jo";
	home.homeDirectory = "/home/jo";
	home.stateVersion = "25.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			nix = "validate work";
		};
	};

	programs.git = {

		enable = true;
		userName = "Jochen Stierberger";
		userEmail = "jocsti@web.de";
	};
}
