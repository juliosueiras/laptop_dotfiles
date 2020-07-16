{ haskell, fetchFromGitHub, ... }:
# need unstable nixpkg

haskell.lib.buildStackProject {
  name = "pp";

  patches = [
    ./tag_hs.patch
    ./jar.patch
  ];
  
  src = fetchFromGitHub {
    owner = "CDSoft";
    repo = "pp";
    rev = "f0b4ba38c195352c22d80df4980c85b2272a753f";
    sha256 = "16j933xk58hgld03i0ysf9p5jmygmn77irfg18g0a8gv7n2sn9rg";
  };
}
