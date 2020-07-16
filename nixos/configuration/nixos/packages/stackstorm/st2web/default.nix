{ callPackage, stdenvNoCC, fetchgit, ... }:

let
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {};
  node = buildNodejs {
    enableNpm = true;
    version = "10.15.3";
    sha256 = "1mcijznh481s44i59p571a38bfvcxm9f8x2l0l1005aly0kdj8jf";
  };

  customNodePackages = import <nixpkgs/pkgs/development/node-packages/composition-v10.nix> {
    nodejs = node;
  };

in stdenvNoCC.mkDerivation {
  name = "st2web";

  src = fetchgit {
    url = "https://github.com/StackStorm/st2web";
    rev = "eee27cf1013fe3cd285b50fdff9291e3696b2801";
    sha256 = "14ban7p7s62n52q95qg25g5icqi1n363hrdly2hcflrqfykmgw4z";
    leaveDotGit = true;
  };

  propagatedBuildInputs = with customNodePackages; [
    yarn
  ];

  patches = [
    ./git.patch
  ];

  buildPhase = ''
    ${customNodePackages.lerna}/bin/lerna bootstrap
    ${customNodePackages.gulp-cli}/bin/gulp production
  '';

  installPhase = ''
    mkdir -p $out/static
    cp -rf build/* $out/static/
  '';
}
