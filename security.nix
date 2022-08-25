{ ... }:

{
    security.pki.certificates = [ (builtins.readFile /usr/local/etc/ssl/zentireCA.crt) ];

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.lightdm.enableGnomeKeyring = true;
    programs.ssh.startAgent = true;

    # Let GNUPG handle SSH keys
    #programs.gnupg.agent = {
    #  enable = true;
    #  enableSSHSupport = true;
    #};

    # Graphical SSH prompting
    #programs.seahorse.enable = true;
}
