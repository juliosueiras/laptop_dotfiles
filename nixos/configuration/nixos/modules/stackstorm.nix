{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.services.stackstorm;

  stBaseEnv = {
    ST2_USER = cfg.user;
    ST2_PASSWORD = cfg.password;
    ST2_API_URL = "http://127.0.0.1:9101";
    ST2_AUTH_URL = "http://127.0.0.1:9100";
    ST2_STREAM_URL = "http://127.0.0.1:9102";

    REDIS_PORT = cfg.redis.port;
    REDIS_HOST = cfg.redis.host;
    REDIS_PASSWORD = cfg.redis.password;

    MONGO_HOST = cfg.mongodb.host;
    MONGO_PORT = cfg.mongodb.port;

    RABBITMQ_DEFAULT_USER = cfg.rabbitmq.username;
    RABBITMQ_DEFAULT_PASS = cfg.rabbitmq.password;
    RABBITMQ_HOST = cfg.rabbitmq.host;
    RABBITMQ_PORT = cfg.rabbitmq.port;

    POSTGRES_USER = cfg.postgres.username;
    POSTGRES_PASSWORD = cfg.postgres.password;
    POSTGRES_HOST = cfg.postgres.host;
    POSTGRES_PORT = cfg.postgres.port;
    POSTGRES_DB = cfg.postgres.db;
  };

  stackstormServiceContainer = name: rec {
    extraDockerOptions = ["--network=host"];
    image = "stackstorm/stackstorm";

    environment = mkMerge [
      stBaseEnv
      {
        ST2_SERVICE = name;
      }

      (mkIf (cfg.mongodb.username != null) { MONGO_USER = cfg.mongodb.username; })
      (mkIf (cfg.mongodb.password != null) { MONGO_PASS = cfg.mongodb.password; })
      (mkIf (cfg.mongodb.db != null) { MONGO_DB = cfg.mongodb.db; })
    ];

    volumes = [
      "${config.services.stackstorm.volumeDir}/packs:/opt/stackstorm/packs"
      "${config.services.stackstorm.volumeDir}/virtualenvs:/opt/stackstorm/virtualenvs"
      "${config.services.stackstorm.volumeDir}/configs:/opt/stackstorm/configs"
      "${config.services.stackstorm.volumeDir}/log:/var/log"
    ];
  };
in {
  options = { 
    services.stackstorm = {
      enable = mkEnableOption "StackStorm";

      user = mkOption {
        default = "admin";
        description = "
        Username of Stackstorm Server
        ";
      };

      host = mkOption {
        default = "stackstorm.julio.com";
        description = "
        Nginx host for stackstorm
        ";
      };

      password = mkOption {
        default = "SuperSecurePassword";
        description = "
        Password of Stackstorm Server
        ";
      };

      mongodb = {
        password = mkOption {
          default = null;
          description = "
          MongoDB Password
          ";
        };

        username = mkOption {
          default = null;
          description = "
          MongoDB Username
          ";
        };

        host = mkOption {
          default = "127.0.0.1";
          description = "
          MongoDB Host
          ";
        };

        db = mkOption {
          default = null;
          description = "
          MongoDB DB
          ";
        };

        port = mkOption {
          default = "27017";
          description = "
          MongoDB Port
          ";
        };
      };

      redis = {
        host = mkOption {
          default = "127.0.0.1";
          description = "
          Redis host
          ";
        };

        port = mkOption {
          default = "6379";
          description = "
          Redis port
          ";
        };

        password = mkOption {
          default = "";
          description = "
          Redis password
          ";
        };
      };

      rabbitmq = {
        username = mkOption {
          default = "guest";
          description = "
          RabbitMQ username
          ";
        };

        password = mkOption {
          default = "guest";
          description = "
          RabbitMQ Password
          ";
        };

        host = mkOption {
          default = "127.0.0.1";
          description = "
          RabbitMQ Host
          ";
        };

        port = mkOption {
          default = "5672";
          description = "
          RabbitMQ Port
          ";
        };
      };

      postgres = {
        username = mkOption {
          default = "mistraluser";
          description = "
          Postgres username
          ";
        };

        password = mkOption {
          default = "SuperSecurePassword";
          description = "
          Postgres password
          ";
        };

        host = mkOption {
          default = "127.0.0.1";
          description = "
          Postgres host
          ";
        };

        port = mkOption {
          default = "5432";
          description = "
          Postgres Port
          ";
        };

        db = mkOption {
          default = "mistral";
          description = "
          Postgres DB
          ";
        };
      };

      volumeDir = mkOption {
        default = "/var/stackstorm";
        description = "
        Directory holding all the data of stackstorm
        ";
      };
    };
  };



  config = mkIf cfg.enable {
    services.redis.enable = mkDefault true;
    services.mongodb.enable = mkDefault true;
    services.rabbitmq.enable = mkDefault true;
    services.postgresql.enable = mkDefault true;

    services.postgresql.authentication = lib.mkForce ''
      # Generated file; do not edit!
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust
    '';

    services.postgresql.ensureDatabases = mkAfter [ "mistral" ];
    services.postgresql.ensureUsers = mkAfter [ {
      name = cfg.postgres.username;
      ensurePermissions = {
        "DATABASE ${cfg.postgres.db}" = "ALL PRIVILEGES";
      };
    } ];

    environment.etc."st2/keys/datastore_key.json" = {
      source = "${pkgs.runCommand "st2keys" {preferLocalBuild = true; } ''
        ${pkgs.stackstorm.st2common}/bin/st2-generate-symmetric-crypto-key -k $out
      ''}";
    };

    environment.etc."st2/st2.conf" = {
      text = pkgs.callPackage ./st2.nix {};
    };

    systemd.services.st2api = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2api}/bin/st2api";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2auth = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2auth}/bin/st2auth";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2stream = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2stream}/bin/st2stream";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2actionrunner = {
      enable = true;
      after = [ "network.target" ];                          
      path = [
        pkgs.git
        pkgs.python3
        pkgs.gcc
        pkgs.pkgconfig
        pkgs.krb5.dev
        pkgs.libffi.dev
        pkgs.sudo
        pkgs.bash
      ];

      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2actionrunner";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2sensorcontainer = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2reactor}/bin/st2sensorcontainer";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2scheduler = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2scheduler";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2notifier = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2notifier";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2resultstracker = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2resultstracker";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2workflowengine = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2workflowengine";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2rulesengine = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2rulesengine";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2timersengine = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2timersengine";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    systemd.services.st2garbagecollector = {
      enable = true;
      after = [ "network.target" ];                          
      serviceConfig = {
        ExecStart = "${pkgs.stackstorm.st2actions}/bin/st2garbagecollector";
        PermissionsStartOnly = true;
        User = "root";
        Group = "root";
        Restart = "on-failure";
        KillSignal = "SIGINT";
      };
    };

    services.nginx = {
      enable = mkDefault true;
      virtualHosts = {
        "${cfg.host}" = {
          locations = {
            "/" = {
              root = "${pkgs.stackstorm.st2web}/static";
            };

            "@apiError" = {
              extraConfig = ''
                add_header Content-Type application/json always;
              '';
              return = "503 '{ \"faultstring\": \"Nginx is unable to reach st2api. Make sure service is running.\" }'";
            };

            "/api/" = {
              extraConfig = ''
                error_page 502 = @apiError;
                rewrite ^/api/(.*)$  /$1 break;

                proxy_pass            http://127.0.0.1:9101$uri$is_args$args;
                proxy_read_timeout    90;
                proxy_connect_timeout 90;
                proxy_redirect        off;

                proxy_set_header      Host $host;
                proxy_set_header      X-Real-IP $remote_addr;
                proxy_set_header      X-Forwarded-For $proxy_add_x_forwarded_for;

                proxy_set_header Connection ''';
                chunked_transfer_encoding off;
                proxy_buffering off;
                proxy_cache off;
                proxy_set_header Host $host;
              '';
            };

            "@authError" = {
              extraConfig = ''
                add_header Content-Type application/json always;
              '';
              return = "503 '{ \"faultstring\": \"Nginx is unable to reach st2auth. Make sure service is running.\" }'";
            };

            "/auth/" = {

              extraConfig = ''
                error_page 502 = @authError;
                set $st2_auth_url http://127.0.0.1:9100;

                rewrite ^/auth/(.*)$  /$1 break;

                proxy_pass            $st2_auth_url$uri$is_args$args;
                proxy_read_timeout    90;
                proxy_connect_timeout 90;
                proxy_redirect        off;

                proxy_set_header      Host $host;
                proxy_set_header      X-Real-IP $remote_addr;
                proxy_set_header      X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_pass_header     Authorization;

                proxy_set_header Connection ''';
                chunked_transfer_encoding off;
                proxy_buffering off;
                proxy_cache off;
                proxy_set_header Host $host;
              '';
            };

            "@streamError" = {
              extraConfig = ''
                add_header Content-Type text/event-stream;
              '';
              return = "200 \"retry: 1000\n\n\"";
            };

            "/api/stream" = {
              extraConfig = ''
                rewrite ^/api/stream/?(.*)$ /stream/v1/stream/$1 last;
              '';
            };

            "/api/v1/stream" = {
              extraConfig = ''
                rewrite ^/api/v1/stream/?(.*)$ /stream/v1/stream/$1 last;
              '';
            };

            "/stream/" = {
              extraConfig = ''
                error_page 502 = @streamError;
                set $st2_stream_url http://127.0.0.1:9102;

                rewrite ^/stream/(.*)  /$1 break;
                proxy_pass  $st2_stream_url$uri$is_args$args;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                sendfile on;
                tcp_nopush on;
                tcp_nodelay on;

                proxy_set_header Connection ''';
                chunked_transfer_encoding off;
                proxy_buffering off;
                proxy_cache off;
              '';
            };
          };
        };
      };
    };
  };
}
