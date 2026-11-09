{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        vesktop
        mumble
        # Matrix Clients
        cinny-desktop
        element-desktop
    ];
    services.flatpak.packages = [

    ];
}
