{ stdenv, ... }:

stdenv.mkDerivation {
  name = "step";

  src = fetchTarball {
    url = "https://github.com/smallstep/cli/releases/download/v0.14.4-rc.1/step_linux_0.14.4-rc.1_amd64.tar.gz";
    sha256 = "1lh1wa9fm6lli5bdhhv3828q78zpl2l6vfwl81z6yy9x5q84pwr2";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bin/step $out/bin/
  '';
}
