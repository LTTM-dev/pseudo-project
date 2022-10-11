{
  description = "Pseudo Project for DevOps Lecture";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let 
            pkgs = nixpkgs.legacyPackages.${system};
            pythonPackages = pkgs.python39Packages;
        in
        {
          devShells.default =
            pkgs.mkShell {
                buildInputs = [pythonPackages.flask];
            };
        }
      );
}
