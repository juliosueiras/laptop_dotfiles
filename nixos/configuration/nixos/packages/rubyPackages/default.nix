{ bundlerEnv, ruby, ... }:

bundlerEnv {
  name = "custom-ruby-packages";
  inherit ruby;
  gemfile  = ./Gemfile;
  lockfile = ./Gemfile.lock;
  gemset   = ./gemset.nix;
}
