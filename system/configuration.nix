{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./modules/imports.nix
      ./hardware-configuration.nix
    ];

  # Set your time zone.
  time.timeZone = "Asia/Novosibirsk";

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "23.11";

}

