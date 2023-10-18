{
  lib,
  pkgs,
  ...
}:
let
  inherit (pkgs.python310Packages) buildPythonApplication pydbus six tendo tkinter;
in
buildPythonApplication {
  name = "blockyalarm";
  pname = "blockyalarm";
  version = "1.1";

  propagatedBuildInputs = ([
    pydbus
    six
    tendo
    tkinter
  ]);

  src = ./.;

}
