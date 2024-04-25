{ pkgs, ... }: {
  users = {
    users.octobanon = {
      isNormalUser = true;
      description = "OctoBanon";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
