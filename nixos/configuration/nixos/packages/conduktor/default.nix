{ stdenv, fetchurl, oraclejre8, makeWrapper, ... }:

stdenv.mkDerivation rec {
  name = "conduktor";
  version = "1.0";

  nativeBuildInputs = [
    makeWrapper
  ];

  dontUnpack = true;
  dontInstall = true;

  buildPhase = ''
  jar=$out/share/java/Conduktor-${version}.jar
  install -Dm444 $src $jar
  makeWrapper ${oraclejre8}/bin/java $out/bin/conduktor --add-flags "-jar $jar"
  '';

  src = fetchurl {
    url = "https://cdn.conduktor.io/jar/Conduktor-${version}.jar";
    sha256 = "0jliakjzgc2ripgisi3j81j7w4f9gb2drjh7r1wv5q3yc298zbqk";
  };
}
