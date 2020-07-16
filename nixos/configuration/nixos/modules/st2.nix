{ lib, callPackage, ... }:

lib.generators.toINI {} {
  api = {
    host = "127.0.0.1";
    port = 9101;
    mask_secrets = true;
    logging = "${callPackage ./logging.nix { type = "api"; }}";
  };

  auth = {
    host = "127.0.0.1";
    port = 9100;
    use_ssl = false;
    debug = false;
    enable = true;
    logging = "${callPackage ./logging.nix { type = "auth"; }}";

    mode = "standalone";

    backend = "flat_file";
    backend_kwargs = "{\"file_path\": \"/etc/st2/htpasswd\"}";

    api_url = "";
  };

  stream = {
    logging = "${callPackage ./logging.nix { type = "stream"; }}";
  };

  content = {
    system_packs_base_path = "/opt/stackstorm/packs";
    packs_base_paths = "/opt/stackstorm/packs";
    system_runners_base_path = "/opt/stackstorm/runners";
    runners_base_path = "/opt/stackstorm/runners";
  };

  actionrunner = {
    logging = "${callPackage ./logging.nix { type = "actionrunner"; }}";
    virtualenv_opts = "--always-copy,--system-site-packages";
  };

  sensorcontainer = {
    logging = "${callPackage ./logging.nix { type = "sensorcontainer"; }}";
  };

  scheduler = {
    logging = "${callPackage ./logging.nix { type = "scheduler"; }}";
  };

  keyvalue = {
    encryption_key_path = "/etc/st2/keys/datastore_key.json";
  };

  resultstracker = {
    logging = "${callPackage ./logging.nix { type = "resultstracker"; }}";
  };

  notifier = {
    logging = "${callPackage ./logging.nix { type = "notifier"; }}";
  };

  workflow_engine = {
    logging = "${callPackage ./logging.nix { type = "workflowengine"; }}";
  };

  garbagecollector = {
    logging = "${callPackage ./logging.nix { type = "garbagecollector"; }}";
  };

  timersengine = {
    logging = "${callPackage ./logging.nix { type = "timersengine"; }}";
  };

  rulesengine = {
    logging = "${callPackage ./logging.nix { type = "rulesengine"; }}";
  };
}
