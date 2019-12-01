{ stdenv, cmake, kdeFrameworks, qt5, ... }:

stdenv.mkDerivation {
  name = "tellico";

  buildInputs = [
    cmake
    kdeFrameworks.extra-cmake-modules
    qt5.qtbase.dev
    kdeFrameworks.karchive
    kdeFrameworks.kitemmodels
    kdeFrameworks.kjobwidgets
    kdeFrameworks.kio
    kdeFrameworks.kwallet
    kdeFrameworks.kxmlgui
    kdeFrameworks.khtml
  ];

  src = fetchTarball http://tellico-project.org/files/tellico-3.2.3.tar.xz;
}
