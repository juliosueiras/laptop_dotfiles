{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  vitamtp = callPackage ./vitamtp/default.nix {};
in {
  vitamtp = vitamtp;
  qcma = callPackage ./qcma/default.nix { inherit vitamtp; };
  psvimgtools = callPackage ./psvimgtools/default.nix {};
  pkg2zip = callPackage ./pkg2zip/default.nix {};
}
