# modules/desktop/system/packages.nix
{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        # very important packages
        hyfetch
        fastfetch
        btop
        wget
        curl
        jfsutils
        ntfs3g
        exfatprogs
        dosfstools
        btrfs-progs
        xfsprogs
        hfsprogs
        f2fs-tools
        xdg-utils
        #ffmpeg
        xwayland
        pam_u2f
        yubikey-manager
    ];
}