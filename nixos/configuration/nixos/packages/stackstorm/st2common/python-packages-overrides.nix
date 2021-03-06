# Generated by pip2nix 0.8.0.dev1
# Adjust to your needs, e.g. to provide C libraries.

{ pkgs, basePythonPackages }:

self: super: {

  # Example adjustment for lxml: It needs a few C libraries
  #
  cffi = super.cffi.override (attrs: {
    buildInputs = with self; [
      pkgs.libffi.dev
    ];
  });

  cryptography = super.cryptography.override (attrs: {
    buildInputs = with self; [
      pkgs.openssl.dev
    ];
  });

  # Common needs

  # setuptools - avoid that we end up in a recursion
  # inherit (basePythonPackages) setuptools;

}
