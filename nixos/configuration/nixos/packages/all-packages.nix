{ pkgs ? import <nixpkgs> {} }:

with pkgs;

{
  customVimPlugins = callPackage ./customVimPlugins/default.nix {};
  terraform-lsp = callPackage ./terraform-lsp/default.nix {};
  terraform = callPackage ./terraform/default.nix {};
}
