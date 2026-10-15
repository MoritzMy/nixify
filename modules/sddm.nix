{
  flake.modules.nixos.sddm =
    { pkgs, ... }:
    let
      sddm-theme = pkgs.sddm-astronaut.override {
        embeddedTheme = "pixel_sakura";
      };
    in
    {
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm; # Qt6 SDDM, required for this theme
        theme = "sddm-astronaut-theme";
        extraPackages = [ sddm-theme ];
      };

      environment.systemPackages = [ sddm-theme ];
    };
}
