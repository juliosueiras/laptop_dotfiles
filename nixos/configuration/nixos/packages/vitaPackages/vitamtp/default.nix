{ stdenv, libxml2, libusb, pkg-config, autoreconfHook, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  name = "vitamtp";

  buildInputs = [
    libxml2.dev
    libusb.dev
    pkg-config
    autoreconfHook
  ];

  src = fetchFromGitHub {
    owner = "codestation";
    repo = "vitamtp";
    rev = "7ab537a4f45e34984cbeb9cf1b1af543a75a3dc0";
    sha256 = "09c9f7gqpyicfpnhrfb4r67s2hci6hh31bzmqlpds4fywv5mzaf8";
  };
}
