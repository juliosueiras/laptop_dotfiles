{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let 
  rubyPackages = (callPackage ./rubyPackages/default.nix {}).gems;
in {
  customVimPlugins = callPackage ./customVimPlugins/default.nix {};
  terraform-lsp = callPackage ./terraform-lsp/default.nix {};
  allmark = callPackage ./allmark/default.nix {};
  terraform = callPackage ./terraform/default.nix {};
  flashplayer-standalone = callPackage ./flashplayer-standalone/default.nix {};
  terraform-config-inspect = callPackage ./terraform-config-inspect/default.nix {};
  pandoc-imagine = callPackage ./pandoc-imagine/default.nix {};
  tellico = callPackage ./tellico/default.nix {};
  allure = callPackage ./allure/default.nix {};
  jira = callPackage ./jira/default.nix {};
  rubyPackages = rubyPackages;
  vitaPackages = (callPackage ./vitaPackages/vita-packages.nix {});

  #customRuby = pkgs.ruby.withPackages rubyPackages;

  customRuby = pkgs.ruby.withPackages (p: with rubyPackages; [  
    pkgs.bundler
    puppet
    bolt
    librarian-puppet
    inspec-bin
    chef
    test-kitchen
    kitchen-google
    kitchen-puppet
  ]);
}
