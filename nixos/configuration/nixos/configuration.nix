{ config, pkgs, ... }:

let
    vimConfigured = pkgs.vim_configurable.override {
      python = pkgs.python3;
    };

    terraform = pkgs.terraform.overrideAttrs(oldAtts: {
      name = "terraform-0.12.16";
      version = "0.12.16";
      src = pkgs.fetchFromGitHub {
        owner = "hashicorp";
        repo = "terraform";
        rev = "v0.12.16";
        sha256 = "10r9vra4d3lyms9cvl0g1ij6ldcfi3vjrqsmd52isrmlmjdzm8nk";
        
      };
    });

in {
  imports = [
    ./configuration.nix
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
  ];

  #virtualisation.docker.enable = true;
  users.groups.docker.members = [ "vagrant" ];

  # For Podman
  users.users.vagrant.subUidRanges = [
    { startUid = 1000000; count = 65536; }
  ];

  # For Podman
  users.users.vagrant.subGidRanges = [
    { startGid = 1000000; count = 65536; }
  ];

  nixpkgs.config = {
    allowUnfree = true;

    vim = {
      perl = true;
      multibyte = true;
      nls = true;
      tcl = true;
      ftNix = true;
    };
  };

  fonts.fonts = with pkgs; [
    cantarell-fonts
    dejavu_fonts
    source-code-pro # Default monospace font in 3.32
    source-sans-pro
  ];


  services.fractalart.enable = true;

  services.xserver = {
    enable = true;

    videoDrivers = [ "intel" "virtualbox" "vesa" ];
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = false;

    windowManager = {
      awesome.enable = true;
    };
  };

  programs = {
    thefuck.enable = true;
   
    vim.defaultEditor = true;
  };

  home-manager.users.vagrant = {
    programs = {

      direnv.enable = true;

      bash = {
        enable = true;

	shellAliases = {
	  tf = "terraform";
	  docker = "podman";
	};

        sessionVariables = {
          EDITOR = "vim";
          VAULT_ADDR = "https://vault.gatethree.io";
        };
      };

      git = {
      	enable = true;
	userName = "Julio Tain Sueiras";
	userEmail = "juliosueiras@gmail.com";

        aliases = {
          ignore = "\"!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi\"";
        };
      };

      tmux = {
        enable = true;
	keyMode = "vi";
	customPaneNavigationAndResize = true;
	
	tmuxinator.enable = true;
      };
    };

    home = {
      file = {
        ".inputrc".text = ''
        set editing-mode vi
        set keymap vi-command
        '';
      };
    };
  };


  environment = {
    variables = {
      EDITOR = "vim";
    };


    etc = {
      "containers/registries.conf".text = ''
      [registries.search]
      registries = ['docker.io', 'quay.io', "gcr.io", "eu.gcr.io"]
      '';

      "containers/policy.json".text     = builtins.toJSON {
        default = [
          {
            type = "insecureAcceptAnything";
          }
        ];

        transports = {
          "docker-daemon" = {
            "" = [
              {
                type = "insecureAcceptAnything";
              }
            ];
          };
        };
      };
    };


    systemPackages = [
      pkgs.vivaldi
      pkgs.tilix
      pkgs.podman
      pkgs.conmon
      pkgs.runc
      pkgs.mongodb-tools
      pkgs.slirp4netns
      pkgs.zip
      pkgs.ack
      pkgs.ripgrep
      pkgs.mdbook
      pkgs.wget
      pkgs.binutils
      pkgs.file
      pkgs.asciinema
      terraform
      pkgs.ranger
      pkgs.kubectl
      pkgs.go_1_12
      pkgs.dtrx
      pkgs.google-cloud-sdk
      pkgs.vault
      pkgs.kubernetes-helm
      pkgs.git-hub
      vimConfigured
    ];
  };
}
