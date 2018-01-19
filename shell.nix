{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc801" }:

let
  haskellPackages =
    if compiler == null || !(nixpkgs.lib.hasAttr compiler nixpkgs.pkgs.haskell.packages)
      # use the current default version
      then nixpkgs.pkgs.haskellPackages
      else nixpkgs.lib.attrByPath [compiler] {} nixpkgs.pkgs.haskell.packages;
in (nixpkgs.pkgs.haskell.lib.overrideCabal
     (import ./default.nix { inherit nixpkgs haskellPackages; })
       (args: { testToolDepends = [ haskellPackages.cabal-install ]; })).env
