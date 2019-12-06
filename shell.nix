with import <nixpkgs> {};

let
  gems = bundlerEnv {
    name = "laptop_dotfiles";

    ruby = ruby;

    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in mkShell {
  buildInputs = [
    vagrant
    gems
  ];
}
