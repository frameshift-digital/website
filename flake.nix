{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = {
      hello = nixpkgs.legacyPackages.x86_64-linux.hello;
      hugo = nixpkgs.legacyPackages.x86_64-linux.hugo;
      default = nixpkgs.legacyPackages.x86_64-linux.hugo;
    };

    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [
        nixpkgs.legacyPackages.x86_64-linux.hugo
      ];
    };
  };
}
