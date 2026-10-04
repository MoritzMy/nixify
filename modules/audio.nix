{
  flake.modules.nixos.audio = {
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      pulse.enable = true;
      audio.enable = true;
    };
  };
}
