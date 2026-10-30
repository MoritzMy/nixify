{
  flake.modules.homeManager.minecraft = { pkgs, lib, osConfig, ... }:
    let
      nvidia = builtins.elem "nvidia" osConfig.services.xserver.videoDrivers;

      # Minecraft 26.x renders through SDL3 + Vulkan/EGL, but the nixpkgs
      # wrapper hard-sets LD_LIBRARY_PATH (--set) to the old GLFW-era list:
      # no libvulkan and no Wayland libs, so the game dies with
      # "libvulkan.so.1" missing and EGL_BAD_DISPLAY. Extend it at the source.
      modrinth-app = pkgs.modrinth-app.overrideAttrs (old: {
        runtimeDependencies = old.runtimeDependencies + ":" + lib.makeLibraryPath [
          pkgs.vulkan-loader
          pkgs.wayland
          pkgs.libxkbcommon
          pkgs.libdecor
        ];
      });
    in
    {
      home.packages = [
        # WebKitGTK's DMA-BUF renderer crashes on NVIDIA under Wayland
        # ("Error 71 (Protocol error)"), so the launcher never opens.
        # Other GPUs (AMD) get the unwrapped package.
        #
        # The game inherits the rest: Minecraft 26.x's OpenGL backend fails on
        # NVIDIA + native Wayland EGL (EGL_BAD_DISPLAY on its second hidden
        # window), and then Iris crashes on the Vulkan fallback. Run the game
        # through XWayland and stop LWJGL from picking EGL just because
        # WAYLAND_DISPLAY is set, so SDL and LWJGL both use GLX.
        (if nvidia then
          pkgs.symlinkJoin {
            name = "modrinth-app";
            paths = [ modrinth-app ];
            nativeBuildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/ModrinthApp \
                --set WEBKIT_DISABLE_DMABUF_RENDERER 1 \
                --set SDL_VIDEO_DRIVER x11 \
                --set JAVA_TOOL_OPTIONS -Dorg.lwjgl.opengl.contextAPI=native
            '';
          }
        else
          modrinth-app)
      ];
    };
}
