{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
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
  
  environment.systemPackages = [
    pkgs.vivaldi
    pkgs.tilix
  ];
}
