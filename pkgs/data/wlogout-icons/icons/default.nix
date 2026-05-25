{ stdenv, lib }:

stdenv.mkDerivation {
  pname = "wlogout-icons";
  version = "1.0";

  src = ./src;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/wlogout/icons

    cp -r * $out/share/wlogout/icons/
  '';

  meta = with lib; {
    description = "My wlogout icons";
    platforms = platforms.all;
  };
}
