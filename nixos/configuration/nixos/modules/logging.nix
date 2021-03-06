{ lib, writeText, type, ... }:

let
  logging = lib.generators.toINI {} {
  loggers = {
    keys = "root";
  };

  handlers = {
    keys = "fileHandler";
  };

  formatters = {
    keys = "simpleConsoleFormatter, verboseConsoleFormatter, gelfFormatter";
  };

  logger_root = {
    level = "INFO";
    handlers = "fileHandler";
  };

  handler_fileHandler = {
    class = "handlers.RotatingFileHandler";
    level = "INFO";
    formatter = "verboseConsoleFormatter";
    args = "(\"/var/log/st2/st2${type}.log\",)";
  };

  formatter_simpleConsoleFormatter = {
    class = "st2common.logging.formatters.ConsoleLogFormatter";
    format = "%(asctime)s %(levelname)s [-] %(message)s";
    datefmt = "";
  };

  formatter_verboseConsoleFormatter = {
    class = "st2common.logging.formatters.ConsoleLogFormatter";
    format = "%(asctime)s %(thread)s %(levelname)s %(module)s [-] %(message)s";
    datefmt = "";
  };

  formatter_gelfFormatter = {
    class = "st2common.logging.formatters.GelfLogFormatter";
    format = "%(message)s";
  };
};
in writeText "logging.${type}.gunicorn.conf" logging
