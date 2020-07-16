# This file is overwritten by the vagrant-nixos plugin
{ options, config, pkgs, ... }:

let
  base = "/vagrant/nixos";

  secrets = import "${base}/secrets.nix";

  rnixLSP = import (fetchTarball {
    url = "https://github.com/nix-community/rnix-lsp/archive/06c15def36aa59c56b4593bd3df662ddc70fd166.tar.gz";
    sha256 = "0c7rnjr6cfjablx6wdi4745jpn86b72q7h66s1x1dlhxrv0fmbnd";
  }) {};

  helmEllisdon = pkgs.stdenv.mkDerivation {
    name = "helm";
    src = pkgs.fetchurl {
      url = "https://get.helm.sh/helm-v2.11.0-linux-amd64.tar.gz";
      sha256 = "18bk4zqdxdrdcl34qay5mpzzywy9srmpz3mm91l0za6nhqapb902";
    };

    unpackPhase = ''
      tar zxvf $src
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp linux-amd64/helm $out/bin
    '';
  };

  overlay = pkgs.writeText "overlay" ''
    self: super: with super.lib; let                                overlays = (import <nixpkgs/nixos> { }).config.nixpkgs.overlays;
    in foldl' (flip extends) (_: super) overlays self
  '';

  overlay-user = pkgs.writeText "overlay-user" ''
    self: super: with super.lib; let                                overlays = (import <nixpkgs/nixos> { }).config.home-manager.users.vagrant.nixpkgs.overlays;
    in foldl' (flip extends) (_: super) overlays self
  '';

  nixpkgs-overlay = pkgs.runCommand "overlays" { preferLocalBuild = true; } ''
    mkdir $out
    cp ${overlay} $out/overlays.nix
  '';

  nixpkgs-overlay-user = pkgs.runCommand "overlays-user" { preferLocalBuild = true; } ''
    mkdir $out
    cp ${overlay-user} $out/overlays.nix
  '';

  unstablePackages = builtins.fetchTarball {
    url =
      "https://github.com/nixos/nixpkgs/archive/41e06190bb3dbe644d1bb1673c9359579bf706fe.tar.gz";
    sha256 = "13cxbz09v9svx0576s9wf92wa4lkdglipsvg6qzjl0c9kvzqy77j";
  };

  packer = pkgs.stdenv.mkDerivation {
    name = "packer";

    buildInputs = [ pkgs.autoPatchelfHook ];

    src = pkgs.fetchzip {
      url =
        "https://releases.hashicorp.com/packer/1.5.6/packer_1.5.6_linux_amd64.zip";
      sha256 = "1l81vbg9i1s972qrjxfdr5d95b829yckn2cq340da2fwklaw9ar2";
    };

    installPhase = ''
      mkdir -p $out/bin

      cp packer $out/bin/
    '';
  };

  pip2nix =
    (pkgs.callPackage "${base}/packages/pip2nix"{});

  customPackages = import "${base}/packages/all-packages.nix" { inherit pkgs; };

  consul = pkgs.stdenv.mkDerivation {
    name = "consul";

    buildInputs = [ pkgs.autoPatchelfHook ];

    src =
      /home/vagrant/go14/src/github.com/hashicorp/consul/pkg/bin/linux_amd64;

    outputs = [ "bin" "out" ];

    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $bin/bin

      cp consul $out/bin/
      cp consul $bin/bin/
    '';
  };
in {
  imports = [
    ./configuration.nix
    "${ builtins.fetchTarball {
        url = "https://github.com/rycee/home-manager/archive/7c30831e8fb6449e5eaadc2a6bd5a24aff9bfd6e.tar.gz";
        sha256 = "0xa9d552aksm238q0xiyvwy7s8azvdhg2bkgks7hsfvy98c64wk8";
      }
    }/nixos"
  ];

  virtualisation.docker.enable = true;
  users.groups.docker.members = [ "vagrant" ];

  # For Podman
  users.users.vagrant.subUidRanges = [{
    startUid = 1000000;
    count = 65536;
  }];

  docker-containers = {
    #sourcegraph = {
    #  image = "sourcegraph/server:3.13.0";

    #  ports = [
    #    "7080:7080"
    #    "127.0.0.1:3370:3370"
    #  ];

    #  volumes = [
    #    "/home/vagrant/.sourcegraph/config:/etc/sourcegraph"
    #    "/home/vagrant/.sourcegraph/data:/var/opt/sourcegraph"
    #  ];
    #};
  };

  # For Podman
  users.users.vagrant.subGidRanges = [{
    startGid = 1000000;
    count = 65536;
  }];

  nix.useSandbox = false;

  nix.binaryCaches =
    [ "https://cache.nixos.org" "https://laptop-dotfiles.cachix.org" ];

  nix.binaryCachePublicKeys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "laptop-dotfiles.cachix.org-1:Okurdv1/SRJkXNODJsAi/K6FZLDmhr4gMSwV9XiWw+g="
  ];

  nix.trustedUsers = [ "root" "vagrant" ];

  nix.extraOptions = ''
    substituters = https://cache.nixos.org https://laptop-dotfiles.cachix.org https://cache.nixos.org/
    experimental-features = nix-command flakes
  '';

  nixpkgs.config = {
    allowUnfree = true;
    oraclejdk.accept_license = true;

    vim = {
      perl = true;
      multibyte = true;
      nls = true;
      tcl = true;
      ftNix = true;
    };
  };

  time.timeZone = "America/Toronto";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  fonts.fonts = with pkgs; [
    cantarell-fonts
    dejavu_fonts
    (pkgs.callPackage "${unstablePackages}/pkgs/data/fonts/iosevka/bin.nix" {})
    source-code-pro # Default monospace font in 3.32
    source-sans-pro
  ];

  #services.dockerRegistry.enable = true;
  networking.firewall.enable = false;

  networking.nat.enable = true;
  networking.nat.internalInterfaces = [ "ve-+" ];
  networking.nat.externalInterface = "enp0s3";
  networking.hosts = {
    "10.91.32.234" = ["automation-reports-uat.gatethree.io"];
    "192.168.102.11" = [ "plex" ];
    "192.168.10.63" = [ "test-vm" ];
    "10.104.120.22" = [ "kafka-broker-0.c.radix-shared-inf.internal" ];
    "10.104.120.21" = [ "kafka-broker-1.c.radix-shared-inf.internal" ];
    "10.104.120.23" = [ "kafka-broker-2.c.radix-shared-inf.internal" ];
    "10.105.8.12" = [ "kafka-broker-0.c.radix-shared-inf-prod.internal " ];
    "10.105.8.10" = [ "kafka-broker-1.c.radix-shared-inf-prod.internal " ];
    "10.105.8.8" = [ "kafka-broker-2.c.radix-shared-inf-prod.internal " ];
    "10.0.2.15" = [ "api.kube" ];
  };

  nixpkgs.overlays = [
    (self: super: { 
      vim = pkgs.vim_configurable.override { python = pkgs.python3; };
    })
  ];

  services.xserver = {
    enable = true;

    videoDrivers = [ "intel" "virtualbox" "vesa" ];
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = false;

    #desktopManager = {
    #  #Mostly for tellico
    #  plasma5.enable = true;
    #};

    windowManager = { awesome.enable = true; };
  };

  programs = {
    thefuck.enable = true;
    adb.enable = true;

    vim.defaultEditor = true;
  };

  home-manager.users.vagrant = {
    nixpkgs = {
      overlays = [
        (self: super: { 
          helmEllisdon = helmEllisdon;
          vim_configurable = pkgs.vim_configurable.override { python = pkgs.python3; };
        })
      ];

      config = {
        allowUnfree = true;
        allowUnsupportedSystem = true;
        oraclejdk.accept_license = true;
      };
    };

    programs = {

      direnv.enable = true;

      bash = {
        enable = true;

        shellAliases = {
          tf = "terraform";
          #docker = "podman";
        };

        sessionVariables = {
          EDITOR = "vim";
          PATH = "$PATH:$HOME/.bin";
          VAULT_ADDR = "https://vault.gatethree.io";
          GO111MODULE = "on";
          NOMAD_ADDR = "http://10.0.2.15:4646";
          NIX_PATH = "$HOME/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels:nixpkgs-overlays=${nixpkgs-overlay-user}";
        };

        initExtra = ''
          eval "$(${customPackages.jira}/bin/jira --completion-script-bash)"
        '';
      };

      browserpass = {
        enable = true;
        browsers = [ "vivaldi" ];
      };

      git = {
        enable = true;
        userName = "Julio Tain Sueiras";
        userEmail = "juliosueiras@gmail.com";

        signing = {
          key = "DD3C1B7D62F621B1";
          signByDefault = true;
        };

        aliases = {
          ignore =
            ''"!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi"'';
        };

        extraConfig = {
          credential = {
            helper = "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper";
          };
        };
      };

      vim = {
        enable = true;

        settings = {
          undodir = [ "~/.vimtmp" ];

          directory = [ "~/.vimtmp" ];

          backupdir = [ "~/.vimtmp" ];

          undofile = true;

          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
        };

        plugins = with pkgs.vimPlugins; [
          vim-terraform
          zeavim-vim
          customPackages.customVimPlugins.onedark
          customPackages.customVimPlugins.coc-nvim
          customPackages.customVimPlugins.vim-rego
          customPackages.customVimPlugins.ctrlspace
          customPackages.customVimPlugins.helper
          customPackages.customVimPlugins.treemenu
          customPackages.customVimPlugins.vikube
          customPackages.customVimPlugins.killersheep
          customPackages.customVimPlugins.vim-game-code-break
          customPackages.customVimPlugins.vim-dadbod
          customPackages.customVimPlugins.vim-dadbod-ui
          customPackages.customVimPlugins.vim-dadbod-completion
          vim-multiple-cursors
          vim-sensible
          vim-polyglot
          syntastic
          #ultisnips
          vim-snippets
          lightline-vim
          customPackages.customVimPlugins.vinarise
          #vim-go
        ];

        extraConfig = ''
          set hidden
          let mapleader=','
          packloadall
          color onedark
          set nu
          set clipboard=unnamedplus

          autocmd filetype typescript,typescript.tsx,python,terraform,lua,sh,ruby,nix,go inoremap <silent><expr> <C-X><C-O> coc#refresh()
          autocmd filetype vim inoremap <C-X><C-O> <C-X><C-V>


          nmap <leader>z <Plug>Zeavim
          vmap <leader>z <Plug>ZVVisSelection
          nmap gz <Plug>ZVOperator
          nmap <leader><leader>z <Plug>ZVKeyDocset

          nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
          nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>" 

          let g:syntastic_puppet_checkers = ['puppetlint']
           inoremap <silent><expr> <TAB>
           \ pumvisible() ? coc#_select_confirm() :
           \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump','''])\<CR>" :
           \ <SID>check_back_space() ? "\<TAB>" :
           \ coc#refresh()

           function! s:check_back_space() abort
           let col = col('.') - 1
           return !col || getline('.')[col - 1]  =~# '\s'
           endfunction

           autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

           let g:coc_snippet_next = '<tab>'
           let g:jiraVimDomainName = "https://ellisdon-jira.atlassian.net"
           let g:jiraVimEmail = "jsueiras@ellisdon.com"
           let g:jiraVimToken = "${secrets.jira_token}"
        '';
      };

      tmux = {
        enable = true;
        keyMode = "vi";
        customPaneNavigationAndResize = true;

        tmuxinator.enable = true;

        plugins = with pkgs; [ tmuxPlugins.yank ];
      };
    };

    home = {
      packages = [ pkgs.cachix ];

      file = {
        ".inputrc".text = ''
          set editing-mode vi
          set keymap vi-command
        '';

        ".config/pass-git-helper/git-pass-mapping.ini".text =
          pkgs.lib.generators.toINI { } {
            "github.com" = { target = "ellisdon/github"; };
          };

        ".vimtmp/.keep".text = "";

        ".jira.d/config.yml" = {
          source = "${base}/files/jira.d/config.yml";
          executable = false;
        };

        ".jira.d/subtask.yml" = {
          source = "${base}/files/jira.d/subtask.yml";
          executable = false;
        };

        ".jira.d/templates".source = "${base}/files/jira.d/templates";

        ".vim/coc-settings.json".text = builtins.toJSON {
          "coc.preferences.timeout" = 5000;
          #"suggest.floatEnable" = false;
          #"diagnostic.messageTarget" = "echo";
          #"signature.target" = "echo";
          #"coc.preferences.hoverTarget" = "echo";
          "coc.preferences.snippets.enable" = true;
          "suggest.noselect" = false;

          languageserver = {

            nix = {
              command =
                "${rnixLSP}/bin/rnix-lsp";
              filetypes = [ "nix" ];
            };

            golang = {
              command = "gopls";
              rootPatterns = [ "go.mod" ];
              disableWorkspaceFolders = true;
              filetypes = [ "go" ];
            };

            terraform = {
              command = "${customPackages.terraform-lsp}/bin/terraform-lsp";
              args = [ "serve" ];
              filetypes = [ "terraform" "tf" ];
              rootPatterns = [ "*.tf" "terragrunt.hcl" ];
              "trace.server" = "verbose";
            };

            #terraform = {
            #  command = "/home/vagrant/.bin/terraform-lsp";
            #  args = [ "-debug" "-enable-log-file" "-log-location" "/tmp/"];
            #  #args = [ "-debug"];
            #  filetypes = [ "terraform" "hcl" ];
            #  rootPatterns = ["*.tf" "terragrunt.hcl"];
            #  "trace.server" = "verbose";
            #};

            bash = {
              command =
                "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server";
              args = [ "start" ];
              filetypes = [ "sh" ];
              rootPatterns = [ "*.tf" ];
              ignoredRootPaths = [ "~" ];
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

  security.wrappers.spice-client-glib-usb-acl-helper.source =
    "${pkgs.spice_gtk}/bin/spice-client-glib-usb-acl-helper";

  environment = {
    variables = { EDITOR = "vim"; };

    etc = {
      "docker/daemon.json".text = builtins.toJSON {
        insecure-registries = [ "docker.julio.com" ];
        debug = true;
      };

      "containers/registries.conf".text = ''
        [registries.search]
        registries = ['docker.io', 'quay.io', "gcr.io", "eu.gcr.io"]
      '';

      "containers/policy.json".text = builtins.toJSON {
        default = [{ type = "insecureAcceptAnything"; }];

        transports = {
          "docker-daemon" = { "" = [{ type = "insecureAcceptAnything"; }]; };
        };
      };
    };

    systemPackages = [
      pkgs.nix-index
      pkgs.kafkacat
      pkgs.nixfmt
      pkgs.bat
      pkgs.git-crypt
      pkgs.mariadb-client
      pkgs.postgresql
      pkgs.redis
      pkgs.glib
      pkgs.gsettings-qt
      pip2nix
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
      pkgs.spice_gtk
      pkgs.mdbook
      pkgs.wget
      pkgs.binutils
      pkgs.file
      pkgs.asciinema
      customPackages.terraform
      customPackages.conftest
      pkgs.terraform-docs
      customPackages.terraform-config-inspect
      customPackages.allmark
      pkgs.ranger
      pkgs.kubectl
      pkgs.ansible
      pkgs.salt
      pkgs.go_1_12
      pkgs.goimports
      pkgs.dtrx
      pkgs.google-cloud-sdk
      pkgs.vault
      pkgs.kubernetes-helm
      pkgs.git-hub
      pkgs.plantuml
      pkgs.gitAndTools.hub
      pkgs.pandoc
      pkgs.nodejs
      packer
      pkgs.bundler
      pkgs.puppet-lint
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
      pkgs.vim
      customPackages.pandoc-imagine

      # Removed due to using Collectorz Cloud Connect
      #customPackages.tellico
      customPackages.jira
      customPackages.gh-md-toc
      (customPackages.pp.override {
        haskell = (import "${builtins.fetchTarball
          "https://github.com/nixos/nixpkgs/archive/dcf9a77568b84295c92c8dc5c2df1f4292818601.tar.gz"}"
          { }).haskell;
      })
      pkgs.azure-cli
      pkgs.xsel
      pkgs.nix-prefetch-github
      pkgs.nix-prefetch-git
      pkgs.libreoffice
      pkgs.pdfgrep
      pkgs.gimp
      pkgs.slack-term
      pkgs.zathura
      pkgs.unrar
      pkgs.bundix
      pkgs.linuxPackages.exfat-nofuse
      pkgs.xdelta
      pkgs.browsh
      pkgs.firefox
      pkgs.pypi2nix
      pkgs.radare2-cutter
      customPackages.customRuby

      # For Tellico
      pkgs.kdeFrameworks.khtml

      # LSPs
      pkgs.solargraph
      #customPackages.terraform-lsp
      customPackages.step
      customPackages.step-ca

      # Vita
      customPackages.vitaPackages.qcma
      customPackages.vitaPackages.psvimgtools
      customPackages.vitaPackages.pkg2zip
      (pkgs.python3.withPackages (ps: with ps; [ customPackages.sshoot ]))
      pkgs.kube3d

      pkgs.ngrok
      pkgs.rclone
      pkgs.krb5Full
      pkgs.python3Packages.jedi
      pkgs.python3Packages.pylint
      pkgs.nodePackages.typescript-language-server
    ];
  };

  programs.ssh.forwardX11 = true;
  #programs.ssh.setXAuthLocation = true;

  services.consul = {
    enable = true;
    package = consul;

    webUi = true;

    dropPrivileges = false;
    extraConfig = {
      bootstrap_expect = 1;
      server = true;
      client_addr = "0.0.0.0";

      ports = { dns = 53; };

      recursors = [ "192.168.2.101" ];

      connect = { enabled = true; };
    };

    interface = {
      bind = "enp0s3";
      advertise = "enp0s3";
    };
  };

  security.pki.certificates = [ "${pkgs.lib.readFile "${base}/files/sheridan-ca.pem"}" ];

  nix.nixPath = options.nix.nixPath.default
    ++ [ "nixpkgs-overlays=${nixpkgs-overlay}" ];

  nix.package = pkgs.nixFlakes;


  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureUsers =	[
      {
        name = "vagrant";
        ensurePermissions = {
          "*.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
