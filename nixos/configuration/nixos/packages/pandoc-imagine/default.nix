{ pandoc-imagine, fetchFromGitHub, ... }:

pandoc-imagine.overrideAttrs(oldAtts: {
  name = "pandoc-imagine-unstable-2019-11-26";
  version = "2019-11-26";
  src = fetchFromGitHub {
    owner = "hertogp";
    repo = "imagine";
    rev = "a2704337acf14196e797cf5939d241b7146e36d9";
    sha256 = "04n6q751daw6bg71mvzi6qd7rilv4i0n745wrsi5p542rzq92ya1";
  };
})
