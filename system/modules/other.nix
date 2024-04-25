{ pkgs, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ glib json-glib ];

  services.fwupd.enable = true;
}
