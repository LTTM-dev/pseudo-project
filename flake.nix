{
  description = "Pseudo Project for DevOps Lecture";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let 
            pkgs = nixpkgs.legacyPackages.${system};
            pythonPackages = pkgs.python39Packages;
            files  = pkgs.stdenv.mkDerivation rec {
                name = "files";
                src = ./.;
                installPhase = ''
                    mkdir -p $out/app
                    cp -r ./static $out/app
                    cp -r ./templates $out/app
                    cp app.py $out/app
                '';
            };
        in
        {
            devShells.default =
                pkgs.mkShell {
                    buildInputs = [
                        pythonPackages.flask
                        pythonPackages.gunicorn
                        pythonPackages.pytest
                        pythonPackages.prometheus-flask-exporter
                        pkgs.vagrant
                        pkgs.terraform
                    ];
                };


            packages.default = pkgs.dockerTools.buildImage {
                name = "pseudo-project";
                tag = "latest";

                copyToRoot = pkgs.buildEnv {
                    name = "image-root";
                    paths = [
                        pythonPackages.flask
                        files               
                    ];
                    pathsToLink = [ "/app" "/bin" ];
                };

                config = { 
                    WorkingDir = "/app";
                    Cmd = [ "flask" "run" "--host=0.0.0.0"];
                };
            };
        }
      );
}
