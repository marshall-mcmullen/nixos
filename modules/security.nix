{ ... }:

{
    security.pki.certificates = [ 
    	(builtins.readFile /usr/local/etc/ssl/zentireCA.crt) 
    ];
}
