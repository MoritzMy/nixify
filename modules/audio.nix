{
  flake.modules.nixos.audio = { pkgs, ... }: {
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      pulse.enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      pwvucontrol
    ];
  };

  flake.modules.homeManager.audio = {
    services.easyeffects = {
      enable = true;
      preset = "loudness";
    };
  };
}
