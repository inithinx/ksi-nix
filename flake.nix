{
  description = "Nithin's NixOs Flake";

##############
### INPUTS ###
##############
  inputs = {

    # Nixpkgs channel selection
    nixpkgs = { 
      url = "github:nixos/nixpkgs/nixos-23.11"; 
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };


  };

###############
### OUTPUTS ###
###############
  #outputs = inputs: {
  outputs = { self, nixpkgs, ...}@inputs: {

    # Host 1 - IT
    nixosConfigurations = {
        eins = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
	            # Home Manager
	            inputs.home-manager.nixosModules.home-manager {
                    home-manager = {
                        useUserPackages = true;
                        useGlobalPkgs = true;
                        extraSpecialArgs = {inherit inputs;};
                        users.itlab= ./home/itlab/home.nix;
	                };
	            }
	            # Import Host-Specific files.
                ./core/itlab/core.nix
            ];
        };
    };

    # Host 2 - CSE
    nixosConfigurations = {
        zwei = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
	            # Home Manager
	            inputs.home-manager.nixosModules.home-manager {
                    home-manager = {
                        useUserPackages = true;
                        useGlobalPkgs = true;
                        extraSpecialArgs = {inherit inputs;};
                        users.cselab= ./home/cselab/home.nix;
	                };
	            }
	            # Import Host-Specific files.
                ./core/cselab/core.nix
            ];
        };
    };

}
