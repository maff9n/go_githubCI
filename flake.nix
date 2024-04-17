{
  description = "A Nix-flake-based Go development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pipelineCapabilities = import ./.github/nix/default.nix { inherit pkgs; };
      activatedPipelineCapabilities = with pipelineCapabilities; [
        test_go
        lint_go
      ];
    in
    {
      devShells.${system}.default =
        pkgs.mkShell {
          packages = with pkgs; [
            go
            gotools
            golangci-lint
          ] ++ activatedPipelineCapabilities;
        };
    };
}
