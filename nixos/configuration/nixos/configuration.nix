{ config, pkgs, ... }:

let
    vimConfigured = pkgs.vim_configurable.override {
      python = pkgs.python3;
    };
in {
  imports = [
    ./configuration.nix
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
  ];

  virtualisation.docker.enable = true;
  users.groups.docker.members = [ "vagrant" ];

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


  services.fractalart.enable = true;

  services.xserver = {
    enable = true;

    resolutions = [
     {
       x = 1920;
       y = 1080;
     }
    ];

    desktopManager = {
      gnome3.enable = true;
    };

    displayManager.gdm.enable = true;

    windowManager.awesome.enable = true;
    
  };

  programs = {
    vim.defaultEditor = true;
  };

  home-manager.users.vagrant = {
    programs = {
      bash = {
        enable = true;
        sessionVariables = {
          EDITOR = "vim";
        };
      };

      git = {
      	enable = true;
	userName = "Julio Tain Sueiras";
	userEmail = "juliosueiras@gmail.com";
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
      pkgs.zip
      vimConfigured
    ];
  };
}
