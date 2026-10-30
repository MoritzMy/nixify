{
  # Proprietary NVIDIA driver + Wayland/Hyprland glue. Import only on hosts with
  # an NVIDIA GPU. Driver branch and open/closed kernel module depend on the
  # card generation, so hosts override `hardware.nvidia.package` / `.open`:
  #   - Turing (GTX 16xx / RTX 20xx) and newer: defaults below (stable, open)
  #   - Maxwell / Pascal / Volta (GTX 9xx / 10xx): legacy_580, open = false
  flake.modules.nixos.nvidia =
    { config, lib, pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.graphics = {
        enable = true;
        # VA-API on top of NVDEC, used by browsers / mpv for video decoding.
        extraPackages = [ pkgs.nvidia-vaapi-driver ];
      };

      hardware.nvidia = {
        package = lib.mkDefault config.boot.kernelPackages.nvidiaPackages.stable;
        open = lib.mkDefault true;
        # Required for any Wayland compositor (sets nvidia-drm.modeset=1).
        modesetting.enable = true;
        # Preserve VRAM across suspend/resume; avoids corrupted/black screens on wake.
        powerManagement.enable = lib.mkDefault true;
        nvidiaSettings = true;
      };

      # GPU access inside containers (`docker run --device nvidia.com/gpu=all`).
      hardware.nvidia-container-toolkit.enable = lib.mkDefault config.virtualisation.docker.enable;

      # Exported via PAM, so they reach SDDM -> UWSM -> Hyprland and every app.
      environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        NVD_BACKEND = "direct";
        # Electron / Chromium apps (Discord, Obsidian, Spotify, ...) on native Wayland.
        NIXOS_OZONE_WL = "1";
      };
    };
}
