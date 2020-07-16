{ buildGoModule, fetchFromGitHub, ...}:

buildGoModule rec {
  name = "go-jira-unstable";

  goPackagePath = "github.com/go-jira/jira";

  src = fetchFromGitHub {
    owner = "go-jira";
    repo  = "jira";
    rev = "af7a8f45e4b6cafe520dfa611801e14311314dc2";
    sha256 = "0s4hkb0hchshd1yrdr5x4x1f5l26ffqa92gv0yp1i61fj5wskaqm";
    
  };

  modSha256 = "0vzxz1b37crlbd6v6fdgi4q5c20jj5y4ds9pbgbhf3zdm8i25z2f";
  
  
}
