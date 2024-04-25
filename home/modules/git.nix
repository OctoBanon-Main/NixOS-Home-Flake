{ pkgs, ... }: {
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
 
  programs.git = {
    enable = true;
    userName = "OctoBanon";
    userEmail = "octobanonreserve@gmail.com";
  };
}
