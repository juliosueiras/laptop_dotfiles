{ config, pkgs, ... }:

let
  base = "/vagrant/nixos";

  vimConfigured = pkgs.vim_configurable.override {
    python = pkgs.python3;
  };

  customPackages = import "${base}/packages/all-packages.nix" { inherit pkgs; };

  customRuby = pkgs.ruby.withPackages (p: with customPackages.rubyPackages; [
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

  time.timeZone = "America/Toronto";

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

    desktopManager = {
      #Mostly for tellico
      plasma5.enable = true;
    };

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

      browserpass = {
        enable = true;
        browsers = ["vivaldi"];
      };

      git = {
        enable = true;
        userName = "Julio Tain Sueiras";
        userEmail = "juliosueiras@gmail.com";

        aliases = {
          ignore = "\"!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi\"";
        };
      };


      vim = {
        enable = true;

        settings = {
          undodir = [
            "~/.vimtmp"
          ];

          directory = [
            "~/.vimtmp"
          ];

          backupdir = [
            "~/.vimtmp"
          ];

          undofile = true;

          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
        };

        plugins = with pkgs.vimPlugins;[
          vim-terraform
          coc-nvim
          zeavim-vim
          customPackages.customVimPlugins.onedark
          customPackages.customVimPlugins.ctrlspace
          customPackages.customVimPlugins.helper
          customPackages.customVimPlugins.treemenu
          customPackages.customVimPlugins.vikube
          vim-multiple-cursors
          vim-sensible
          vim-polyglot
          syntastic
          ultisnips
          vim-snippets
          lightline-vim
        ];

        extraConfig = ''
         set hidden
         let mapleader=','
         packloadall
         color onedark
         set nu
         set clipboard=unnamedplus

         autocmd filetype terraform,lua,sh,go,ruby inoremap <silent><expr> <C-X><C-O> coc#refresh()
         autocmd filetype vim inoremap <C-X><C-O> <C-X><C-V>

         nmap <leader>z <Plug>Zeavim
         vmap <leader>z <Plug>ZVVisSelection
         nmap gz <Plug>ZVOperator
         nmap <leader><leader>z <Plug>ZVKeyDocset

         let g:syntastic_puppet_checkers = ['puppetlint']

        '';
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

        ".vimtmp/.keep".text = "";

        ".jira.d/config.yml" = { 
          source = "${base}/files/jira.d/config.yml";
          executable = false;
        };

        ".jira.d/templates".source = "${base}/files/jira.d/templates";

        ".vim/coc-settings.json".text = builtins.toJSON {
          "coc.preferences.timeout" = 5000;

          languageserver = {
            terraform = {
              command = "${customPackages.terraform-lsp}/bin/terraform-lsp";
              args = [ "-enable-log-file" "-log-location" "/tmp/" ];
              filetypes = [ "terraform" ];
              rootPatterns = ["*.tf"];
              "trace.server" = "verbose";
            };

            bash = {
              command = "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server";
              args = [ "start" ];
              filetypes = [ "sh" ];
              rootPatterns = ["*.tf"];
              ignoredRootPaths = ["~"];
            };

            go = {
              command = "${pkgs.gotools}/bin/gopls";
              filetypes = [ "go" ];
              rootPatterns = ["go.mod"];
            };

            lua = {
              command = "${pkgs.luaPackages.lua-lsp}/bin/lua-lsp";
              filetypes = [ "lua" ];
            };
          };
        };
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
      pkgs.mongodb
      pkgs.slirp4netns
      pkgs.zip
      pkgs.ack
      pkgs.ripgrep
      pkgs.mdbook
      pkgs.wget
      pkgs.binutils
      pkgs.file
      pkgs.asciinema
      customPackages.terraform
      pkgs.ranger
      pkgs.kubectl
      pkgs.ansible
      pkgs.salt
      pkgs.go_1_12
      pkgs.dtrx
      pkgs.google-cloud-sdk
      pkgs.vault
      pkgs.kubernetes-helm
      pkgs.git-hub
      pkgs.plantuml
      pkgs.gitAndTools.hub
      pkgs.pandoc
      pkgs.nodejs
      pkgs.packer
      pkgs.bundler
      pkgs.puppet-lint
      customRuby
      pkgs.chefdk
      pkgs.autoconf
      pkgs.augeas
      (pkgs.pass.withExtensions (ext: [ ext.pass-import ]))
      pkgs.zeal
      pkgs.gnupg22
      pkgs.httpie
      pkgs.unzip
      pkgs.dos2unix
      pkgs.lftp
      pkgs.qt5.qtbase
      pkgs.kdeFrameworks.breeze-icons
      vimConfigured
      customPackages.pandoc-imagine
      customPackages.tellico
      customPackages.jira
      pkgs.omnisharp-roslyn

      # For Tellico
      pkgs.kdeFrameworks.khtml

      # LSPs
      pkgs.solargraph
      customPackages.terraform-lsp
    ];
  };
}
