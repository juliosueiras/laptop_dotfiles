{ stdenv, makeWrapper, jre8, fetchzip, ... }:

let 
  version = "2.13.0";
in stdenv.mkDerivation {
  name = "allure-${version}";

  buildInputs = [
    makeWrapper
  ];

  patches = [
    ./test.patch
  ];

  installPhase = ''
    mkdir -p $out/allure-lib
    cp -rf * $out/allure-lib
    makeWrapper $out/allure-lib/bin/allure $out/bin/allure --set JAVA_HOME ${jre8.home}
  '';

  src = fetchzip {
    url = "https://dl.bintray.com/qameta/maven/io/qameta/allure/allure-commandline/${version}/allure-commandline-${version}.zip";
    sha256 = "0a79rlh0gsmhy8529gry0nhhjwmp8m6smib208s7z5pvhm1nnmvy";
  };
}
