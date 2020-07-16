{ stdenv, ... }:

stdenv.mkDerivation {
  name = "step-ca";

  src = fetchTarball {
    url = "https://github.com/smallstep/certificates/releases/download/v0.14.4/step-certificates_linux_0.14.4_amd64.tar.gz";
    sha256 = "1y4gk7634q6f9cr9jxd3p3j2qhnca1nc1d47f7zaq67r1s66arfr";
    
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bin/* $out/bin/
  '';
}
