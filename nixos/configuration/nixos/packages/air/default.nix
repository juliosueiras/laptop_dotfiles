{ fetchFromGitHub, buildGoModule, lib, ... }:

buildGoModule rec {
  pname = "air";
  version = "1.12.0";

  src = fetchFromGitHub {
    owner = "cosmtrek";
    repo = pname;
    rev = "v${version}";
    sha256 = "17grs4l5dl84rl6hpsdah5sqdapi71m0n7f9bb0cs1snda6cqjsv";
    
  };

  modSha256 = "0jvqr4c7csih987igcvr2wa9zgn6rh9nlw9133dn5hszhjv6m7jp";

  meta = with lib; {
    description = "Live reload for Go apps";
    homepage = "https://github.com/cosmtrek/air";
    license = licenses.mit;
  };
}
