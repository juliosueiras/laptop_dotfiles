{ vimUtils, fetchgit, ... }:

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
}
