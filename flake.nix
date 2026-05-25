{
  description = "My personal Nix packages, icons, and themes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          wlogout-icons = pkgs.callPackage ./pkgs/data/wlogout-icons/icons { };
          sddm-theme = pkgs.callPackage ./pkgs/data/sddm-themes/homeless { };
        }
      );
    };
}
