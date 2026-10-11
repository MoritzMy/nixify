{
  flake.modules.homeManager.gaming = { pkgs, ... }: {
    home.packages = with pkgs; [
      mindustry-wayland
    ];
  };
}
