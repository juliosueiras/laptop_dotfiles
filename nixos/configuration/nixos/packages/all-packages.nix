{ pkgs ? import <nixpkgs> {} }:

with pkgs;

{
  customVimPlugins = callPackage ./customVimPlugins/default.nix {};
}
