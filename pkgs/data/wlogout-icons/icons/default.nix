{ stdenv, lib }:

stdenv.mkDerivation {
  pname = "wlogout-icons";
  version = "1.0";

  # Point this to the folder containing your raw image files
  src = ./src;

  # No compiling is necessary for images
  dontBuild = true;

  installPhase = ''
    # Create the output directory in the Nix store
    mkdir -p $out/share/wlogout/icons

    # Copy all files from the src folder into the output directory
    cp -r * $out/share/wlogout/icons/
  '';

  meta = with lib; {
    description = "My wlogout icons";
    platforms = platforms.all;
  };
}
