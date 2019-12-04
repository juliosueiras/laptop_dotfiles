{ pkgs ? import <nixpkgs> {} }:

with pkgs;

{
  customVimPlugins = callPackage ./customVimPlugins/default.nix {};
  terraform-lsp = callPackage ./terraform-lsp/default.nix {};
  terraform = callPackage ./terraform/default.nix {};
  pandoc-imagine = callPackage ./pandoc-imagine/default.nix {};
  tellico = callPackage ./tellico/default.nix {};
  jira = callPackage ./jira/default.nix {};
  rubyPackages = (callPackage ./rubyPackages/default.nix {}).gems;
  vitaPackages = (callPackage ./vitaPackages/vita-packages.nix {});
}
