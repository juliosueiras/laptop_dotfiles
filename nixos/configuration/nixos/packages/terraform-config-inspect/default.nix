{ fetchFromGitHub, buildGoModule, lib, ... }:

buildGoModule rec {
  pname = "terraform-config-inspect";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "hashicorp";
    repo = "terraform-config-inspect";
    rev = "e9629612a2155da0dee267bbbd5dedc1a329b2da";
    sha256 = "05y18hh28s9radj8dq08xr912pw2kdq240mch9nzgn0p8mid0wgp";
  };

  modSha256 = "1vy7pmrz6pwlgqvkzx3lkgzxxy73wbnfhr9ys0kzv0q8wxvcc1am";

  meta = with lib; {
    description = "A helper library for shallow inspection of Terraform configurations
    ";
    homepage = "https://github.com/hashicorp/terraform-config-inspect";
    license = licenses.mpl20;
  };
}
