{
  description = "Ironman's Nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
        lib = inputs.snowfall-lib.mkLib {
            inherit inputs;
            src = ./.;
            snowfall = {
                meta = {
                    name = "ironman-pkgs";
                    description = "Ironman's Packages";
                };
                namespace = "ironman";
            };
        };
    in
    lib.mkFlake {
        channels-config = {
            allowUnfree = true;
        };

        alias = {
            packages.default = "blockyalarm";
            shells.default = "blockyshell";
        };
    };
}
