{ fetchFromGitHub, ... }:

(import "${fetchFromGitHub { 
  owner = "datakurre";
  repo = "pip2nix";
  rev = "7557e61808bfb5724ccae035d38d385a3c8d4dba";
  sha256 = "jTJp2h0Ukr1DnExvT/XmYJv15LhDdGr+q4LWAuOanWc=";
}}/release.nix" {}).pip2nix.python37.overrideAttrs(oldAttrs: {
  patches = [
    ./11.patch
  ];
})
