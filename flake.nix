{
  description = "NixOS";

  inputs = {
	nixpkgs.url = "nixpkgs/nixos-25.05";
	home-manager = {
		url = "github:nix-community/home-manager/release-25.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
	nixosConfigurations.blitz = nixpkgs.lib.nixosSystem {
	  system = "aarch64-linux";
	  modules = [
		./configuration.nix
		home-manager.nixosModules.home-manager
		{
		  home-manager = {
		    useGlobalPkgs = true;
		    useUserPackages = true;
		    users.jo = import ./home.nix;
		    backupFileExtension = "backup";
		  };
		}
	  ];
	};
  };
}
