{ terraform, fetchFromGitHub, ... }:

terraform.overrideAttrs(oldAtts: {
  name = "terraform-0.12.16";
  version = "0.12.16";
  src = fetchFromGitHub {
    owner = "hashicorp";
    repo = "terraform";
    rev = "v0.12.16";
    sha256 = "10r9vra4d3lyms9cvl0g1ij6ldcfi3vjrqsmd52isrmlmjdzm8nk";
  };
})
