let
  nixos = import <nixos> { config = { allowUnfree = true; }; };
  nixos-unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
  }) {
    python = "python310";
  };

in
  mach-nix.nixpkgs.mkShell {
    buildInputs = [
      nixos-unstable.python310Packages.pytorchWithCuda
      nixos-unstable.python310Packages.transformers
      nixos-unstable.python310Packages.pip
      nixos-unstable.python310Packages.autopep8
      nixos-unstable.python310Packages.jupyter
      nixos-unstable.vale
    ];

    shellHook = ''
      code
    '';
  }
