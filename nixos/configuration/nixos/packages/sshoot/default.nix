{ python3Packages, sshuttle, stdenv, fetchgit, ... }:

python3Packages.buildPythonPackage rec {
  name = "sshoot";
  version = "unstable";

  propagatedBuildInputs = with python3Packages; [ setuptools sshuttle argcomplete pyyaml pyxdg];

  doCheck = false;

  src = fetchgit {
    url = "https://github.com/albertodonato/sshoot";
    rev = "a98317d1e5c8c91ca09e3429f402ee77b0e411e0";
    sha256 = "0shqsy5wdghm3mbcfvbd0w5lmdv7yfjjdyzf506g4ywbq4k9yiv2";
  };
}
