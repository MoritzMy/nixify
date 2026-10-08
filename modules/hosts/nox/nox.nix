{ config, inputs, ... }:
let
  nixos = config.flake.modules.nixos;
  hm = config.flake.modules.homeManager;
in
{
  flake.nixosConfigurations.nox = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./_hardware-configuration.nix
      nixos.home-manager
      nixos.nix
      nixos.git
      nixos.hyprland
      nixos.sddm
      nixos.audio
      nixos.steam
      nixos.battery
      nixos.brightness
      nixos.bluetooth
      nixos.wine
      {
        networking.hostName = "nox";
        # Required for the "networkmanager" group below to exist; matches the
        # previous /etc/nixos configuration.
        networking.networkmanager.enable = true;
        system.stateVersion = "26.05";

        i18n.defaultLocale = "en_US.UTF-8";

        i18n.extraLocaleSettings = {
          LC_ADDRESS = "de_DE.UTF-8";
          LC_IDENTIFICATION = "de_DE.UTF-8";
          LC_MEASUREMENT = "de_DE.UTF-8";
          LC_MONETARY = "de_DE.UTF-8";
          LC_NAME = "de_DE.UTF-8";
          LC_NUMERIC = "de_DE.UTF-8";
          LC_PAPER = "de_DE.UTF-8";
          LC_TELEPHONE = "de_DE.UTF-8";
          LC_TIME = "de_DE.UTF-8";
        };

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        users.users.dyna = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "networkmanager"
          ];
        };

        nixpkgs.config.allowUnfree = true;

        home-manager.users.dyna = {
          imports = [
            hm.git
            hm.hyprland
            hm.bash
            hm.claude
            hm.zen-browser
            hm.awww
            hm.helix
            hm.fastfetch
            hm.kitty
            hm.noctalia
            hm.obsidian
            hm.devenv
            hm.netTools
            hm.wine
          ];
          home.stateVersion = "26.05"; # keep your existing value
        };
      }
    ];
  };
}
