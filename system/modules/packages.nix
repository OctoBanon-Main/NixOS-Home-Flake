{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
 
  environment.systemPackages = with pkgs; [
    # sbctl
    sbctl
    fwupd

    # GNOME stuff
    gnomeExtensions.appindicator
    gnome.nautilus
    
    # Web browser
    firefox
     
    # Software
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    helix
    tetrio-desktop
    cider
    vesktop
    
    # Home-manager
    home-manager
    
    # CachyOS Kernel
    scx
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
  ];
}
