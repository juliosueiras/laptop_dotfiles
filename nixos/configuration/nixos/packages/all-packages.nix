{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let 
  rubyPackages = (callPackage ./rubyPackages/default.nix {}).gems;
in {
  customVimPlugins = callPackage ./customVimPlugins/default.nix {};
  terraform-lsp = callPackage ./terraform-lsp/default.nix {};
  terraform-compliance = callPackage ./terraform-compliance/default.nix {
    pythonPackages = python37Packages;
  };
  conftest = callPackage ./conftest/default.nix {};
  air = callPackage ./air/default.nix {};
  sshoot = callPackage ./sshoot/default.nix {};
  allmark = callPackage ./allmark/default.nix {};
  terraform = callPackage ./terraform/default.nix {};
  flashplayer-standalone = callPackage ./flashplayer-standalone/default.nix {};
  terraform-config-inspect = callPackage ./terraform-config-inspect/default.nix {};
  pandoc-imagine = callPackage ./pandoc-imagine/default.nix {};
  tellico = callPackage ./tellico/default.nix {};
  allure = callPackage ./allure/default.nix {};
  jira = callPackage ./jira/default.nix {};
  gh-md-toc = callPackage ./gh-md-toc/default.nix {};
  pp = callPackage ./pp/default.nix {};
  conduktor = callPackage ./conduktor/default.nix {};
  stackstorm = callPackage ./stackstorm/default.nix {};
  step = callPackage ./step/default.nix {};
  step-ca = callPackage ./step-ca/default.nix {};

  rubyPackages = rubyPackages;
  vitaPackages = (callPackage ./vitaPackages/vita-packages.nix {});

  #customRuby = pkgs.ruby.withPackages rubyPackages;

  customRuby = ruby.withPackages (p: with rubyPackages; [  
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
