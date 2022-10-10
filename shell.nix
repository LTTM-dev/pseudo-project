{ pkgs ? import <nixpkgs> { } }:

let
  pythonEnv = pkgs.python3.withPackages(ps: [ pkgs.python39Packages.flask ]);

in
pkgs.mkShell {
  packages = [
    pythonEnv
  ];
}
