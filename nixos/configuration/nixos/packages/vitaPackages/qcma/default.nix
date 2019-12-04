{ gdk_pixbuf, ffmpeg, vitamtp, git, pkg-config, libnotify, qt5, fetchFromGitHub, stdenv, ... }:

stdenv.mkDerivation {
  name = "qcma-unstable";

  propagatedBuildInputs = [
    vitamtp
    git
    pkg-config
    libnotify
  ] ++ (with qt5; [ # Qt deps
    qttranslations
    qmake
  ]) ++ [ # Dev deps
    gdk_pixbuf.dev
    ffmpeg.dev
  ];

  preConfigure = ''
    lrelease common/resources/translations/qcma_*.ts
  '';

  src = fetchFromGitHub {
    owner = "codestation";
    repo = "qcma";
    rev = "65f0eab8ca0640447d2e84cdc5fadc66d2c07efb";
    sha256 = "1i8g4w05s1dalqyl42v6fmcng84nn95gd7vh3vvx4hg2bikdc5h3";
  };
}
