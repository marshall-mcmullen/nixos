{ ... }:

{
    security.pki.certificates = [ 
    	(builtins.readFile /usr/local/etc/ssl/zentireCA.crt) 
    	(builtins.readFile /usr/local/etc/ssl/bitwarden.zentire.com.crt) 
    ];
}
