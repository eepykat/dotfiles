{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        vesktop # Discord sob
        fractal
        mumble
        bluebubbles # iMessage xd
    ];
    services.flatpak.packages = [
#        "org.telegram.desktop" 
    ];
}
