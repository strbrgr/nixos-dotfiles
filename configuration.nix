{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "blitz";
  networking.wireless.enable = true;

  time.timeZone = "America/Chicago";

  services.xserver = {
	enable = true;
	autoRepeatDelay = 200;
	autoRepeatInterval = 35;
	windowManager.i3 = {
		enable = true;
		extraPackages = with pkgs; [
			dmenu
			i3status
			i3blocks
		];
	};
  };
  services.displayManager.defaultSession = "none+i3";
  programs.i3lock.enable = true;
  users.users.jo = {
	isNormalUser = true;
	extraGroups = [ "wheel" ];
	packages = with pkgs; [
		tree
	];
  };
  
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
	vim
	wget
	ghostty
	git
  ];

  fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
  ];


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05"; # Did you read the comment?

}

