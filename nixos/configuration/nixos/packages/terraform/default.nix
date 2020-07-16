{ stdenv, fetchzip, autoPatchelfHook, ... }:


stdenv.mkDerivation {
  name = "terraform";

  buildInputs = [
    autoPatchelfHook
  ];

  src = fetchzip {
    url = "https://releases.hashicorp.com/terraform/0.13.0-beta3/terraform_0.13.0-beta3_linux_amd64.zip";
    sha256 = "0wbfv2vkpj7m9vdxgh5sg5ci135xxfk551w2cpmb75ssndchmg85";
  };

  installPhase = ''
    mkdir -p $out/bin

    cp terraform $out/bin/
  '';
}
