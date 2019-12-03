{ buildGoModule, fetchFromGitHub, ...}:

buildGoModule rec {
  name = "go-jira-unstable";

  goPackagePath = "github.com/go-jira/jira";

  src = fetchFromGitHub {
    owner = "go-jira";
    repo  = "jira";
    rev = "7cd34d36988f18466751d8432c38353902b7696f";
    sha256 = "1090a2gsg1nw5ajzgwxxwpa4n10zk0l6x37p3kqgl8v75naz4bd6";
    
  };

  modSha256 = "1m2abj3nry92clssyqqmxa15ixqpfl22i5fp9bzb95bgzcqznh8p";
  
  
}
