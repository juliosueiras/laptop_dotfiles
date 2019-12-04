{ stdenv, lib, fetchFromGitHub, cmake, curl, libgcrypt, clang, ... }:

stdenv.mkDerivation {
  name = "psvimgtools";

  src = fetchFromGitHub {
    owner = "yifanlu";
    repo = "psvimgtools";
    rev = "f446c5663804d8f28ca8cdf4ff6d714bce73b05f";
    sha256 = "0hzvz4rri7mqqblik7aap29yp7l78sbpkpnmaaxkf461lkk8nzcb";
  };

  buildInputs = [
    curl
    cmake
    libgcrypt
  ];

  meta = with lib; {
    description = "Decrypt Vita CMA backups";
    homepage = https://github.com/yifanlu/psvimgtools/;
    maintainers = with maintainers; [ yifanlu ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
