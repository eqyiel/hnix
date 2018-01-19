{ nixpkgs ? import <nixpkgs> {}, haskellPackages ? nixpkgs.pkgs.haskellPackages }:

haskellPackages.callPackage ./project.nix {
  pkgs = nixpkgs;
}
