{ stdenv, fetchFromGitHub, lib, ... }:

stdenv.mkDerivation {
  name = "gh-md-toc";

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp gh-md-toc $out/bin
  '';

  src = fetchFromGitHub {
    owner = "ekalinin";
    repo = "github-markdown-toc";
    rev = "83fadb60a7f1607c1c46e868ed2a866bb70b4c76";
    sha256 = "1xr7zh1b95v6y0anlr4g3wqh27i32ysw0q7mim70wmbsi551jisb";
  };
}
