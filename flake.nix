{
  inputs.devops.url = "github:monacohq/chain-devops-nix";
  inputs.nixpkgs.follows = "std/nixpkgs";
  inputs.std.url = "github:divnix/std";

  outputs = { std, self, ...} @ inputs: std.growOn {
    inherit inputs;

    cellsFrom = ./nix;

    cellBlocks = with std.blockTypes; [
      (devshells "devshells" {ci.run = true;})
    ];
  }

  {
    devShells = std.harvest self ["automation" "devshells"];
  };
}
