{
  stdenv,
  lib,
  pkgs,
}:

stdenv.mkDerivation {
  pname = "sddm-theme-homeless";
  version = "1.1";

  src = ./src;

  dontBuild = true;

  dontWrapQtApps = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/homeless

    cp -r * $out/share/sddm/themes/homeless/
  '';

  propagatedBuildInputs = with pkgs; [
    qt6.qtdeclarative
    qt6.qt5compat
    qt6.qtmultimedia
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    quickshell
  ];

  meta = with lib; {
    description = "The homeless SDDM theme";
    platforms = platforms.all;
  };
}
