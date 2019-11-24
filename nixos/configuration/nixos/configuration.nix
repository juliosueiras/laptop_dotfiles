{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
  ];

  virtualisation.docker.enable = true;
  users.groups.docker.members = [ "vagrant" ];

  nixpkgs.config = {
    allowUnfree = true;
  };


  services.fractalart.enable = true;

  services.xserver = {
    enable = true;

    resolutions = [
     {
       x = 1920;
       y = 1080;
     }
    ];

    desktopManager = {
      gnome3.enable = true;
    };

    displayManager.gdm.enable = true;

    windowManager.awesome.enable = true;
    
  };

  home-manager.users.vagrant = {
    programs = {
      git = {
      	enable = true;
	userName = "Julio Tain Sueiras";
	userEmail = "juliosueiras@gmail.com";
      };

      tmux = {
        enable = true;
	keyMode = "vi";
	
	tmuxinator.enable = true;
      };
    };

    home.file = {
      ".inputrc".text = ''
      set editing-mode vi
      set keymap vi-command
      '';
    };
  };

  environment.systemPackages = [
    pkgs.vivaldi
    pkgs.tilix
  ];
}
