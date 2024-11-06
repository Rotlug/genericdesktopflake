{ stdenv
, lib
, kdePackages
, fetchFromGitHub
, cmake
, extra-cmake-modules
}:

stdenv.mkDerivation {
  pname = "lightly-boehs";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "boehs";
    repo = "Lightly";
    rev = "00ca23447844114d41bfc0d37cf8823202c082e8";
    sha256 = "NpgOcN9sDqgQMjqcfx92bfKohxaJpnwMgxb9MCu9uJM=";
  };

  buildInputs = with kdePackages; [
    kdecoration
    plasma-workspace
    wrapQtAppsHook
    qtbase
  ];

  patches = [
    ./fix-missing.patch
  ];

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

  meta = with lib; {
    description = "Fork of the Lightly breeze theme style that aims to be visually modern and minimalistic";
    mainProgram = "lightly-settings6";
    homepage = "https://github.com/boehs/Lightly";
    license = licenses.gpl2Plus;
    platforms = platforms.all;
  };
}
