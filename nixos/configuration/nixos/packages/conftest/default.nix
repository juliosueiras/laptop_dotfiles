{ stdenv, fetchurl, ... }:

stdenv.mkDerivation {
  name = "conftest";
  src = fetchurl {
    url = "https://github.com/instrumenta/conftest/releases/download/v0.17.0/conftest_0.17.0_Linux_x86_64.tar.gz";
    sha256 = "02zpqfh0n1hmc5v307b18hi0ji8rarhf2brrbynhl3id29yddz6v";
  };

  unpackPhase = ''
    tar zxvf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp conftest $out/bin/
  '';
}
