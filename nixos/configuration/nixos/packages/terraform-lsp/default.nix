{ fetchFromGitHub, buildGoModule, lib, ... }:

buildGoModule rec {
  pname = "terraform-lsp";
  version = "master";

  src = fetchFromGitHub {
    owner = "juliosueiras";
    repo = pname;
    rev = "master";
    sha256 = "Grlcx4LbhTvYdUPfWsa+1rLdlaVg2d3SB8ra8ZCknPs=";
  };

  modSha256 = "/hzVXQTyqbw4bgWRa0/FOTDpmTyfdnd4nXFL1WsJ06k=";

  meta = with lib; {
    description = "Language Server Protocol for Terraform";
    homepage = "https://github.com/juliosueiras/terraform-lsp";
    license = licenses.mit;
    maintainers = [ maintainers.marsam ];
  };
}
