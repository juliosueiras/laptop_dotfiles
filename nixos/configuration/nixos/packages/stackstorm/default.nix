{ pkgs ? import <nixpkgs> {} }:

let
  st2common = pkgs.callPackage ./st2common/default.nix {
    pythonPackages = pkgs.python3Packages;
  };

  st2actions = pkgs.callPackage ./st2actions/default.nix {
    pythonPackages = pkgs.python3Packages;
  };
in  {
  st2web = pkgs.callPackage ./st2web/default.nix {};
  st2common = st2common;

  st2actions = pkgs.python37.buildEnv.override {
    extraLibs = [
      st2common
      st2actions
      (pkgs.callPackage ./st2client/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      pkgs.python3Packages.virtualenvwrapper
      (pkgs.callPackage ./runners/orquesta/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      (pkgs.callPackage ./runners/http/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      (pkgs.callPackage ./runners/python/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      (pkgs.callPackage ./runners/noop/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      (pkgs.callPackage ./runners/action-chain/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      (pkgs.callPackage ./runners/local-shell/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
    ];

    ignoreCollisions = true;
  };

  st2api = pkgs.python37.buildEnv.override {
    extraLibs = [
      (pkgs.callPackage ./st2api/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      st2common
      st2actions
    ];

    ignoreCollisions = true;
  };
  
  st2auth = pkgs.python37.buildEnv.override {
    extraLibs = [
      (pkgs.callPackage ./st2auth/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      st2common
      st2actions
    ];

    ignoreCollisions = true;
  };

  st2stream = pkgs.python37.buildEnv.override {
    extraLibs = [
      (pkgs.callPackage ./st2stream/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      (pkgs.callPackage ./st2api/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      st2common
      st2actions
    ];

    ignoreCollisions = true;
  };

  st2client = pkgs.python37.buildEnv.override {
    extraLibs = [
      (pkgs.callPackage ./st2client/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      st2common
      st2actions
    ];

    ignoreCollisions = true;
  };

  st2reactor = pkgs.python37.buildEnv.override {
    extraLibs = [
      (pkgs.callPackage ./st2reactor/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      (pkgs.callPackage ./st2client/default.nix {
        pythonPackages = pkgs.python3Packages;
      })
      st2common
      st2actions
    ];

    ignoreCollisions = true;
  };
}
