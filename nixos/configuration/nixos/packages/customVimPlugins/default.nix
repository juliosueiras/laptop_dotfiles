{ vimUtils, vimPlugins, python3Packages, python3, fetchgit, fetchFromGitHub, ... }:

{
  onedark = vimUtils.buildVimPlugin {
    name = "onedark";
    src = fetchgit {
      url = "https://github.com/joshdick/onedark.vim.git";
      rev = "7f36f83f13d3bdbd3dca4e3e8b2a10a5ecdca5e9";
      sha256 = "0cnn3j3invasqh5sn20gf9lvcksqhracrbyr3pn3fs9shp7f1kxw";
    };
    dependencies = [];
  };

  ctrlspace = vimUtils.buildVimPlugin {
    name = "vim-ctrlspace";
    src = fetchgit {
      url = "https://github.com/vim-ctrlspace/vim-ctrlspace.git";
      rev = "73397c226bc709bfc37262f9401fca0aab034aca";
      sha256 = "0yjsf6n339nm8w04y2kxjip4x8i1jcm47gww3z4dr2zf8lq63h09";
      
    };
    dependencies = [];
  };

  helper = vimUtils.buildVimPlugin {
    name = "helper";
    src = fetchgit {
      url = "https://github.com/c9s/helper.vim.git";
      rev = "2b8a3d48cdf66d81f88a5a2df97c03543352ed43";
      sha256 = "18v654sawsayqqna4fkjwa2k0m4hjr7x787as06ywsq5r89zk14g";
    };
    dependencies = [];
  };

  treemenu = vimUtils.buildVimPlugin {
    name = "treemenu";
    src = fetchgit {
      url = "https://github.com/c9s/treemenu.vim.git";
      rev = "3967c56f3536e53d61e715940d1b09a3b9f2f8a7";
      sha256 = "1s373680r4p40ahxxxwmzx8m3qpksw91hqnia5skvpb9ass8nqbs";
    };
    dependencies = [];
  };

  vikube = vimUtils.buildVimPlugin {
    name = "vikube";
    src = fetchgit {
      url = "https://github.com/c9s/vikube.vim.git";
      rev = "e4484f3c592e317399f7c6bf95fb779f5c67b046";
      sha256 = "1faqrspsclp2ff9ip8dwczckprw869c1qvx6g18avnhmx2zib8h4";
    };

    dependencies = [];
  };

  killersheep = vimUtils.buildVimPlugin {
    name = "killersheep";
    src = fetchgit {
      url = "https://github.com/vim/killersheep.git";
      rev = "3c6a7865a550244b150b7dbc11eeb4d1047ac4c5";
      sha256 = "1qr9cxvyf4p9zmrx0c4mcqidfrkqj2m12lz6rajbm2lgg6lkvzik";
    };

    dependencies = [];
  };

  vim-game-code-break = vimUtils.buildVimPlugin {
    name = "killersheep";
    src = fetchgit {
      url = "https://github.com/johngrib/vim-game-code-break.git";
      rev = "51ef5fadc79e2af65b76d120093a4176dcdbca53";
      sha256 = "0a384434qq606a1bagal66h1jnsys6ri9bqj0r4cf8l74wbkkndj";
    };

    dependencies = [];
  };

  vinarise = vimUtils.buildVimPlugin {
    name = "vinarise.vim";
    src = fetchgit {
      url = "https://github.com/Shougo/vinarise.vim.git";
      rev = "9285d3f0dc012c6bbe29210dc4f4628bb4ca5000";
      sha256 = "1jmqh87pfxhbrbw4lkcqlp028skr44whlka2y4pnl2q1z2qzjf5f";
    };

    dependencies = [];
  };

  vim-rego = vimUtils.buildVimPlugin {
    name = "vim-rego";
    src = fetchgit {
      url = "https://github.com/tsandall/vim-rego.git";
      rev = "365edd3f0ac22a5d29387607389f46ab12540789";
      sha256 = "1bj0ghi22zh8rxa3m01qw1cscszzvxjimsq40l537jpv8sp6c7ys";
    };

    dependencies = [];
  };

  coc-python = vimUtils.buildVimPluginFrom2Nix {
    pname = "coc-python";
    version = "1.2.12";
    propagatedBuildInputs = [
      python3Packages.jedi
    ];
    src = fetchFromGitHub {
      owner = "neoclide";
      repo = "coc-python";
      rev = "968aec39f74c6f80e6c9c3c0fed51b6113a1a35a";
      sha256 = "135z48idr8r7604ymiqdsml9z6d3swaja89697znszigpy05nz11";
    };
  };

  coc-nvim = vimUtils.buildVimPluginFrom2Nix rec {
    pname = "coc-nvim";
    version = "0.0.78";
    src = fetchFromGitHub {
      owner = "neoclide";
      repo = "coc.nvim";
      rev = "v${version}";
      sha256 = "1r8ysly8lcfpxky31mj5n5r641k44di5pa8n80l95v7ik939h3ws";
    };
  };

  coc-go = vimPlugins.coc-go.overrideAttrs(old: {
    src = fetchFromGitHub {
      owner = "josa42";
      repo = "coc-go";
      rev = "v0.7.0";
      sha256 = "16cgdxn93zf0q5d80xb9c6khzgx02qvsjdaw3kf07qqsmdjvy4gj";
    };
  });

  vim-dadbod = vimUtils.buildVimPluginFrom2Nix rec {
    pname = "vim-dadbod";
    version = "master";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-dadbod";
      rev = "779e8d6efc89b68be951ac1419baae75541cf51c";
      sha256 = "019k26g88y713wy3q06sbab82dgcgsj7f08g9xr2z2xsjmijp8g4";
    };
  };

  vim-dadbod-ui = vimUtils.buildVimPluginFrom2Nix rec {
    pname = "vim-dadbod-ui";
    version = "master";
    src = fetchFromGitHub {
      owner = "kristijanhusak";
      repo = "vim-dadbod-ui";
      rev = "9dad12021f82ff8541dec05031d3363ffbcb090f";
      sha256 = "1l8grqbcv9byp8ciswn47pnp734jbki28b3a73pzqbrp98nxirmj";
    };
  };

  vim-dadbod-completion = vimUtils.buildVimPluginFrom2Nix rec {
    pname = "vim-dadbod-completion";
    version = "master";
    src = fetchFromGitHub {
      owner = "kristijanhusak";
      repo = "vim-dadbod-completion";
      rev = "6533052bc5b7f9f3266907f19d1b15813d45953c";
      sha256 = "0qb69whzxvfh9zlrzw2gyhwsw836h3k7i66zfq5760w5ip6xdrrc";
    };
  };

  dbext-vim = vimUtils.buildVimPluginFrom2Nix rec {
    pname = "dbext-vim";
    version = "master";
    src = fetchFromGitHub {
      owner = "vim-scripts";
      repo = "dbext.vim";
      rev = "14f3d530b6189dc3f97edfa70b7a36006e21148c";
      sha256 = "03mrqrf689ww8ci80mwlz87zyijdrfnz57qq4n9waavjl9lbhpmn";
    };
  };

  jira-vim = vimUtils.buildVimPluginFrom2Nix rec {
    pname = "jira-vim";
    version = "master";
    propagatedBuildInputs = [
      (python3.withPackages(ps: [ ps.jira ps.requests ps.setuptools ps.pip ]))
      python3Packages.jira
      python3Packages.requests
      python3Packages.setuptools
      python3Packages.pip
    ];
    src = fetchFromGitHub {
      owner = "paulkass";
      repo = "jira-vim";
      rev = "bc54b6948042233356f1b8ddcb34186ba5aadd59";
      sha256 = "1qhfajc5dw20ll50hs2chyd34mj5hq0g30a8cfw903nqgc0j4yli";
    };
  };
}
