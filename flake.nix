{
  inputs = {    
    import-tree.url = "github:denful/import-tree";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    nix-airgap.url = "github:bitbloxhub/nix-airgap";
  };

  outputs = inputs: {
    homeConfigurations."lujiaqi.p@ljs-10-140-84-0-889e" =
      let
        system = "x86_64-linux";
      in
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
        };
        modules = [
          (inputs.import-tree ./src)
        ];
      };

    devShells = inputs.nixpkgs.lib.genAttrs inputs.nixpkgs.lib.systems.flakeExposed (system: {
      default = import ./dev {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        nix-airgap = inputs.nix-airgap.packages.${system};
      };
    });
  };
}
