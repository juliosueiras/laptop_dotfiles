# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "juliosueiras/nixbox"

  config.vm.hostname = "nixos"

  config.vm.provision :nixos,
    run: 'always',
    path: "#{ENV["PWD"]}/nixos/configuration.nix",
    include: true,
    verbose: true

end

