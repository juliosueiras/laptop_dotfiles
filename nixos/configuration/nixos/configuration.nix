{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
  ];

  virtualisation.docker.enable = true;
  users.groups.docker.members = [ "vagrant" ];

  services.xserver.desktopManager.gnome3.enable = true;
}
