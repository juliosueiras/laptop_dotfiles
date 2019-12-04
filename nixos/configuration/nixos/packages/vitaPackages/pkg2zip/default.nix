{ fetchFromGitHub, stdenv, ... }:

stdenv.mkDerivation {
  name = "pkg2zip-unstable";

  installPhase = ''
    mkdir -p $out/bin
    cp pkg2zip $out/bin
  '';

  src = fetchFromGitHub {
    owner = "mmozeiko";
    repo = "pkg2zip";
    rev = "9222c4e00235dfe7914e9db0cc352da07e63d9f9";
    sha256 = "1zz3vi12c2c4d48vvvkdl66fx5mdszcnv7lwwlgi4b8lfn1gvkr9";
  };

}
