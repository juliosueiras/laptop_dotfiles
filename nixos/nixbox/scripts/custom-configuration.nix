{ config, pkgs, ... }:

{
  nix.binaryCaches = [ "https://cache.nixos.org" "https://laptop-dotfiles.cachix.org" ];

  nix.binaryCachePublicKeys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "laptop-dotfiles.cachix.org-1:Okurdv1/SRJkXNODJsAi/K6FZLDmhr4gMSwV9XiWw+g=" ];

  nix.trustedUsers = [ "root" "vagrant" ];

  nix.extraOptions = ''
  substituters = https://cache.nixos.org https://laptop-dotfiles.cachix.org https://cache.nixos.org/
  '';
}
