{ inputs, ... }:
{
  flake.modules.nixos.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    # Pre-existing, unmanaged files make activation abort rather than clobber
    # them. Move them aside instead -- note this is the only mechanism that
    # works when a *directory* is in the way (e.g. ~/.config/hypr before the
    # out-of-store symlink in flake.modules.homeManager.hyprland takes over):
    # 'force = true' only skips the collision check, and the link step then
    # still fails on 'ln -Tsf' against a directory.
    home-manager.backupFileExtension = "hm-bak";
  };
}
