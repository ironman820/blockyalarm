{ lib, inputs, pkgs, stdenv, ... }:
let
  inherit (pkgs.python310) withPackages;
  inherit (pkgs.python310Packages) pydbus six tendo tkinter;
  python = withPackages (py: with py; [
    pydbus
    six
    tendo
    tkinter
  ]);
in
stdenv.mkDerivation {
  name = "blockyshell";
  nativeBuildInputs = ([
    python
  ]);
}
