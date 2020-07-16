# Scaffold generated by pip2nix 0.8.0.dev1

{ pkgs ? (import <nixpkgs> {})
, pythonPackages ? "python27Packages"
}:

let
  inherit (pkgs.lib) fix extends;
  basePythonPackages = with builtins; if isAttrs pythonPackages
    then pythonPackages
    else getAttr pythonPackages pkgs;

  # Works with the new python-packages, still can fallback to the old
  # variant.
  basePythonPackagesUnfix = basePythonPackages.__unfix__ or (
    self: basePythonPackages.override (a: { inherit self; }));

  elem = builtins.elem;
  basename = path: with pkgs.lib; last (splitString "/" path);
  startsWith = prefix: full: let
    actualPrefix = builtins.substring 0 (builtins.stringLength prefix) full;
  in actualPrefix == prefix;

  src-filter = path: type: with pkgs.lib;
    let
      ext = last (splitString "." path);
    in
      !elem (basename path) [".hg" ".git" "__pycache__" ".eggs"] &&
      !elem ext ["egg-info" "pyc"] &&
      !startsWith "result" path;

  pythonPackagesGenerated = import ./python-packages.nix {
    inherit pkgs;
    inherit (pkgs) fetchurl fetchgit fetchhg;
  };

  pythonPackagesOverrides = import ./python-packages-overrides.nix {
    inherit basePythonPackages pkgs;
  };

  myPythonPackages =
    (fix
    (extends pythonPackagesOverrides
    (extends pythonPackagesGenerated
             basePythonPackagesUnfix)));

in myPythonPackages.stackstorm-runner-python
