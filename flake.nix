{
  description = "My dotfiles flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    atuin.url = "github:atuinsh/atuin";
    atuin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: let
    system = "x86_64-linux";
    username = "cyril";
    pkgs = import nixpkgs { inherit system; };
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        {
          home.username = username;
          home.homeDirectory = "/home/${username}";
          home.stateVersion = "24.05";
        }
      ];
    };

    apps.${system}.default = {
      type = "app";
      program = "${self.homeConfigurations.${username}.activationPackage}/activate";
    };
  };
}
