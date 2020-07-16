{ fetchFromGitHub, buildGoPackage, lib, ... }:

buildGoPackage rec {
  pname = "allmark";
  version = "unstable";


  src = fetchFromGitHub {
    owner = "andreaskoch";
    repo = "allmark";
    rev = "a02d41510e05eb4e2cedba8e17c32fac6f1e1239";
    sha256 = "1dcc9sivz7bfqadivvz1x70a3k1jkl6yrv75j5lssjlwxzyngwr5";
  };

  goPackagePath = "github.com/andreaskoch/allmark";

  preInstall = ''
    mv go/bin/cli go/bin/allmark
  '';

  meta = with lib; {
    description = "A cross-platform markdown web server";
    homepage = "https://github.com/andreaskoch/allmark";
    license = licenses.bsd3;
  };
}
