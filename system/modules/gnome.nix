{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.excludePackages = [ pkgs.xterm pkgs.nixos-render-docs ];

  programs.dconf.enable = true;
  services.gvfs.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    nixos-render-docs
  ]) ++ (with pkgs.gnome; [
    epiphany
    totem
    gnome-music
  ]);
}
