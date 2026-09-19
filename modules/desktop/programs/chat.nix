{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        vesktop # Discord sob
        bluebubbles # iMessage xd
        mumble
# Matrix Clients 
        fractal
        cinny-desktop

    ];
    services.flatpak.packages = [
#        "org.telegram.desktop" 
    ];
}
