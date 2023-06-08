{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;
  inherit (inputs.std) std lib;
in
  l.mapAttrs (_: lib.dev.mkShell) rec {
    default = {...}: {
      name = "Test";
      imports = [std.devshellProfiles.default inputs.devops.automation.devshellProfiles.ansible];
    };
  }
