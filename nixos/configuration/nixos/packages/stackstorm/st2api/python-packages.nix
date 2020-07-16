# Generated by pip2nix 0.8.0.dev1
# See https://github.com/nix-community/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
  "Babel" = super.buildPythonPackage rec {
    pname = "Babel";
    version = "2.8.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/15/a1/522dccd23e5d2e47aed4b6a16795b8213e3272c7506e625f2425ad025a19/Babel-2.8.0-py2.py3-none-any.whl";
      sha256 = "1m2jq6g2crhvp96npmr0l96j8nsngfwbwsis5mkj7dzq205ylw6n";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pytz"
    ];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "PrettyTable" = super.buildPythonPackage rec {
    pname = "PrettyTable";
    version = "0.7.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ef/30/4b0746848746ed5941f052479e7c23d2b56d174b82f4fd34a25e389831f5/prettytable-0.7.2.tar.bz2";
      sha256 = "0diwsicwmiq2cpzpxri7cyl5fmsvicafw6nfqf6p6p322dji2g45";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ { fullName = "BSD (3 clause)"; } pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "PyYAML" = super.buildPythonPackage rec {
    pname = "PyYAML";
    version = "5.3.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz";
      sha256 = "0pb4zvkfxfijkpgd1b86xjsqql97ssf1knbd1v53wkg1qm9cgsmq";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "amqp" = super.buildPythonPackage rec {
    pname = "amqp";
    version = "2.5.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/fc/a0/6aa2a7923d4e82dda23db27711d565f0c4abf1570859f168e3d0975f1eb6/amqp-2.5.2-py2.py3-none-any.whl";
      sha256 = "1f7k9wgklmvy0wv56m4xzli2sq56m452ifwbvjngmwvx7ahrqr3f";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."vine"
    ];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "appdirs" = super.buildPythonPackage rec {
    pname = "appdirs";
    version = "1.4.3";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/56/eb/810e700ed1349edde4cbdc1b2a21e28cdf115f9faf263f6bbf8447c1abf3/appdirs-1.4.3-py2.py3-none-any.whl";
      sha256 = "0vhnw9ihh67n7n7zdsn355pflz1da1nn6m7czbfk838xarj4dcnq";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "argparse" = super.buildPythonPackage rec {
    pname = "argparse";
    version = "1.4.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f2/94/3af39d34be01a24a6e65433d19e107099374224905f1e0cc6bbe1fd22a2f/argparse-1.4.0-py2.py3-none-any.whl";
      sha256 = "0533cr5w14da8wdb2q4py6aizvbvsdbk3sj7m1jx9lwznvnlf5n3";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  "certifi" = super.buildPythonPackage rec {
    pname = "certifi";
    version = "2020.4.5.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/57/2b/26e37a4b034800c960a00c4e1b3d9ca5d7014e983e6e729e33ea2f36426c/certifi-2020.4.5.1-py2.py3-none-any.whl";
      sha256 = "016kmf145apmfkrpxwd7434hcjchypy6djbwhi03qqvmijcpm60x";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mpl20 { fullName = "Mozilla Public License 2.0 (MPL 2.0)"; } ];
    };
  };
  "cffi" = super.buildPythonPackage rec {
    pname = "cffi";
    version = "1.14.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/05/54/3324b0c46340c31b909fcec598696aaec7ddc8c18a63f2db352562d3354c/cffi-1.14.0.tar.gz";
      sha256 = "1dn279gw5ql8i5n3s5v4rnv96rhhjjfn7xq729qbl5bs2954yf1d";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pycparser"
    ];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "chardet" = super.buildPythonPackage rec {
    pname = "chardet";
    version = "3.0.4";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl";
      sha256 = "14b621614q2lw7ik2igdv4qdbblqgdsiglgl5fhf1l5fmvy3ycpw";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ { fullName = "LGPL"; } { fullName = "GNU Library or Lesser General Public License (LGPL)"; } ];
    };
  };
  "cliff" = super.buildPythonPackage rec {
    pname = "cliff";
    version = "3.1.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/b9/17/57187872842bf9f65815b6969b515528ec7fd754137d2d3f49e3bc016175/cliff-3.1.0-py3-none-any.whl";
      sha256 = "0fqjpvvj0fi91ddzq2yzbybbjlph6a8c5y20rli6dkpk2mkhawvw";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."PrettyTable"
      self."PyYAML"
      self."cmd2"
      self."pbr"
      self."pyparsing"
      self."six"
      self."stevedore"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "cmd2" = super.buildPythonPackage rec {
    pname = "cmd2";
    version = "0.8.9";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/e9/40/a71caa2aaff10c73612a7106e2d35f693e85b8cf6e37ab0774274bca3cf9/cmd2-0.8.9-py2.py3-none-any.whl";
      sha256 = "141hld2yhf8k7zr9hjca8yvjni1w16m8wwkckmb0bavarf5rnxyf";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pyparsing"
      self."pyperclip"
      self."six"
      self."wcwidth"
    ];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "cryptography" = super.buildPythonPackage rec {
    pname = "cryptography";
    version = "2.9.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/56/3b/78c6816918fdf2405d62c98e48589112669f36711e50158a0c15d804c30d/cryptography-2.9.2.tar.gz";
      sha256 = "0af25w5mkd6vwns3r6ai1w5ip9xp0ms9s261zzssbpadzdr05hx0";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."cffi"
      self."six"
    ];
    meta = {
      license = [ { fullName = "BSD or Apache License, Version 2.0"; } pkgs.lib.licenses.bsdOriginal pkgs.lib.licenses.asl20 ];
    };
  };
  "debtcollector" = super.buildPythonPackage rec {
    pname = "debtcollector";
    version = "2.0.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/d0/9e/d3c893e756fa4901f6851bd1cc625629c1f57804ebce6726884aa1efa5e0/debtcollector-2.0.1-py3-none-any.whl";
      sha256 = "0bb0ii0kdikad8sp69yaar07k2jbzzhp5nwqj6622xyyndyykgcn";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pbr"
      self."six"
      self."wrapt"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "decorator" = super.buildPythonPackage rec {
    pname = "decorator";
    version = "4.4.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ed/1b/72a1821152d07cf1d8b6fce298aeb06a7eb90f4d6d41acec9861e7cc6df0/decorator-4.4.2-py2.py3-none-any.whl";
      sha256 = "0q7p11gj5g158gb1igy9cna5ppxf03zkrm2gpr4acjycl3159yj1";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ { fullName = "new BSD License"; } pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "dnspython" = super.buildPythonPackage rec {
    pname = "dnspython";
    version = "1.16.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ec/d3/3aa0e7213ef72b8585747aa0e271a9523e713813b9a20177ebe1e939deb0/dnspython-1.16.0-py2.py3-none-any.whl";
      sha256 = "0bb3y7j6wdly1pl41myk71wvl6ni95dr1i2ndsl4sbwni8l2377n";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ { fullName = "BSD-like"; } { fullName = "Freeware"; } ];
    };
  };
  "dogpile.cache" = super.buildPythonPackage rec {
    pname = "dogpile.cache";
    version = "0.9.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ac/6a/9ac405686a94b7f009a20a50070a5786b0e1aedc707b88d40d0c4b51a82e/dogpile.cache-0.9.0.tar.gz";
      sha256 = "0sr1fn6b4k5bh0cscd9yi8csqxvj4ngzildav58x5p694mc86j5k";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."decorator"
    ];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "eventlet" = super.buildPythonPackage rec {
    pname = "eventlet";
    version = "0.25.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ef/01/83454d11bac9015f34e93cf11efcae169390ddf2df97cb73ca86de6465ed/eventlet-0.25.1-py2.py3-none-any.whl";
      sha256 = "1cg6plbj43pw0175r23jlqn4xxi80lg89qhdhsjc3b9p17c1r2v5";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."dnspython"
      self."greenlet"
      self."monotonic"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "greenlet" = super.buildPythonPackage rec {
    pname = "greenlet";
    version = "0.4.15";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f8/e8/b30ae23b45f69aa3f024b46064c0ac8e5fcb4f22ace0dca8d6f9c8bbe5e7/greenlet-0.4.15.tar.gz";
      sha256 = "1g4g1wwc472ds89zmqlpyan3fbnzpa8qm48z3z1y6mlk44z485ll";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "gunicorn" = super.buildPythonPackage rec {
    pname = "gunicorn";
    version = "19.9.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/8c/da/b8dd8deb741bff556db53902d4706774c8e1e67265f69528c14c003644e6/gunicorn-19.9.0-py2.py3-none-any.whl";
      sha256 = "0w947i3p0b7y1qxkpfj573s6lvf7r52rynayvyjkcyqmni00p3ma";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "idna" = super.buildPythonPackage rec {
    pname = "idna";
    version = "2.9";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/89/e3/afebe61c546d18fb1709a61bee788254b40e736cff7271c7de5de2dc4128/idna-2.9-py2.py3-none-any.whl";
      sha256 = "1yk5hf2jkw1237b508mxmcdm8zqhfh26fr6rpwyxd968x8fa4s50";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ { fullName = "BSD-like"; } pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "importlib-metadata" = super.buildPythonPackage rec {
    pname = "importlib-metadata";
    version = "1.6.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ad/e4/891bfcaf868ccabc619942f27940c77a8a4b45fd8367098955bb7e152fb1/importlib_metadata-1.6.0-py2.py3-none-any.whl";
      sha256 = "03yr2r83p7m0fvwv6py3v7fcrbbfgb4vsj6zy63wa30fm6x8qs1a";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."zipp"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "iso8601" = super.buildPythonPackage rec {
    pname = "iso8601";
    version = "0.1.12";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ef/57/7162609dab394d38bbc7077b7ba0a6f10fb09d8b7701ea56fa1edc0c4345/iso8601-0.1.12-py2.py3-none-any.whl";
      sha256 = "18w93if6rxhbyc5xpq9f6xnxgqgi3pp7y218c0px1h3wcws023i1";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "jmespath" = super.buildPythonPackage rec {
    pname = "jmespath";
    version = "0.9.5";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/a3/43/1e939e1fcd87b827fe192d0c9fc25b48c5b3368902bfb913de7754b0dc03/jmespath-0.9.5-py2.py3-none-any.whl";
      sha256 = "1v2gp811lfz0kgb089z5aw8p3sqlazf3vdym4ls6c44alxpvfp39";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "jsonpatch" = super.buildPythonPackage rec {
    pname = "jsonpatch";
    version = "1.25";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/82/53/73ca86f2a680c705dcd1708be4887c559dfe9ed250486dd3ccd8821b8ccb/jsonpatch-1.25-py2.py3-none-any.whl";
      sha256 = "17l1ch7pvc4bc95r66dakxkiwg60w8xv78s507sx67qa050p4fnc";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."jsonpointer"
    ];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal { fullName = "Modified BSD License"; } ];
    };
  };
  "jsonpointer" = super.buildPythonPackage rec {
    pname = "jsonpointer";
    version = "2.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/18/b0/a80d29577c08eea401659254dfaed87f1af45272899e1812d7e01b679bc5/jsonpointer-2.0-py2.py3-none-any.whl";
      sha256 = "07hw6symim5jqbfgjqqlcyjv3gj5fxy4dv7m76simf6i46h9ydzz";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal { fullName = "Modified BSD License"; } ];
    };
  };
  "jsonschema" = super.buildPythonPackage rec {
    pname = "jsonschema";
    version = "2.6.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/77/de/47e35a97b2b05c2fadbec67d44cfcdcd09b8086951b331d82de90d2912da/jsonschema-2.6.0-py2.py3-none-any.whl";
      sha256 = "024sfr3bjikmsf085ignkdgi5lg7rah2ajal9192m5rwsfmnh3h0";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "keystoneauth1" = super.buildPythonPackage rec {
    pname = "keystoneauth1";
    version = "4.0.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/52/11/9f1538cd8186b6a684ded6ed816176ed262a0ed872285e9e733cbea88025/keystoneauth1-4.0.0-py3-none-any.whl";
      sha256 = "10k7chndhi99k8dfvghjc3a7yr3spjvadall8x5jjx860grpv9mg";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."iso8601"
      self."os-service-types"
      self."pbr"
      self."requests"
      self."six"
      self."stevedore"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "kombu" = super.buildPythonPackage rec {
    pname = "kombu";
    version = "4.6.6";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f7/86/496db94e44c6d0a16a52a1b539b5315d98e8aa59d14a8d4f1009d4eab6c2/kombu-4.6.6-py2.py3-none-any.whl";
      sha256 = "0w8py12z62p9lpfdq91k23xd484mw9fqrw0rd08qkf0xbal5lip7";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."amqp"
      self."importlib-metadata"
    ];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "mongoengine" = super.buildPythonPackage rec {
    pname = "mongoengine";
    version = "0.18.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/a7/1c/0749992c7a2b6a2f1879ad44ba5285f907d2024838459b4cd635c5e5effd/mongoengine-0.18.2.tar.gz";
      sha256 = "1xx2whg352ycy0p132q20np7mjmwam7sq0qirhabi8pwcv4p6gps";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pymongo"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "monotonic" = super.buildPythonPackage rec {
    pname = "monotonic";
    version = "1.5";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ac/aa/063eca6a416f397bd99552c534c6d11d57f58f2e94c14780f3bbf818c4cf/monotonic-1.5-py2.py3-none-any.whl";
      sha256 = "1iqc2k8nmk6bkqisg3xvca4hh20rl9ajcskws35k6bjkh7rr2ajm";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ { fullName = "Apache"; } pkgs.lib.licenses.asl20 ];
    };
  };
  "msgpack" = super.buildPythonPackage rec {
    pname = "msgpack";
    version = "1.0.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/e4/4f/057549afbd12fdd5d9aae9df19a6773a3d91988afe7be45b277e8cee2f4d/msgpack-1.0.0.tar.gz";
      sha256 = "1h5mxh84rcw04dvxy1qbfn2hisavfqgilh9k09rgyjhd936dad4m";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "munch" = super.buildPythonPackage rec {
    pname = "munch";
    version = "2.5.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/cc/ab/85d8da5c9a45e072301beb37ad7f833cd344e04c817d97e0cc75681d248f/munch-2.5.0-py2.py3-none-any.whl";
      sha256 = "1p9g09virz1fmjwwgp4i1aqlv63b485zfhfyz17x0knfla4syi3g";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "netaddr" = super.buildPythonPackage rec {
    pname = "netaddr";
    version = "0.7.19";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ba/97/ce14451a9fd7bdb5a397abf99b24a1a6bb7a1a440b019bebd2e9a0dbec74/netaddr-0.7.19-py2.py3-none-any.whl";
      sha256 = "1jh87s49dz1xywsk7559m2km83k672gk8bn5wjcnjgqzsy5mbcsn";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "netifaces" = super.buildPythonPackage rec {
    pname = "netifaces";
    version = "0.10.9";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/0d/18/fd6e9c71a35b67a73160ec80a49da63d1eed2d2055054cc2995714949132/netifaces-0.10.9.tar.gz";
      sha256 = "1wxby874kcr3pp4ygzk5aiarbzhg1yi093d56s1qg4k2s7yrzvid";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "openstacksdk" = super.buildPythonPackage rec {
    pname = "openstacksdk";
    version = "0.46.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/2f/21/2eb68fcdea3e2deaa53491b74c3b1333c182b408620ca1968afc78a3b003/openstacksdk-0.46.0-py3-none-any.whl";
      sha256 = "18nfqmzw5dnqp1lvrvs84pnrij0gjvkqw8lsx0jdjxp6pwir8q71";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."PyYAML"
      self."appdirs"
      self."cryptography"
      self."decorator"
      self."dogpile.cache"
      self."iso8601"
      self."jmespath"
      self."jsonpatch"
      self."keystoneauth1"
      self."munch"
      self."netifaces"
      self."os-service-types"
      self."pbr"
      self."requestsexceptions"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "os-service-types" = super.buildPythonPackage rec {
    pname = "os-service-types";
    version = "1.7.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/10/2d/318b2b631f68e0fc221ba8f45d163bf810cdb795cf242fe85ad3e5d45639/os_service_types-1.7.0-py2.py3-none-any.whl";
      sha256 = "1mk595v82d2q55dyfbwzsg436xghl7r8haxpgw3i02b90licf185";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pbr"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "osc-lib" = super.buildPythonPackage rec {
    pname = "osc-lib";
    version = "2.0.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/72/f3/d872dd8b6d8a15456958f517eb9913aa98b10d82d3996b40f96a4adaf2d9/osc_lib-2.0.0-py2.py3-none-any.whl";
      sha256 = "0a5v7b2p1xpkf4p3hwdl85sjjly7xds9ii9warxxgsysc4xyif4k";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."Babel"
      self."cliff"
      self."keystoneauth1"
      self."openstacksdk"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."simplejson"
      self."six"
      self."stevedore"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "oslo.config" = super.buildPythonPackage rec {
    pname = "oslo.config";
    version = "1.12.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/c7/82/263fa79866098034917be0def7ab4979480e6f429732cd6cd9f4e0405ec5/oslo.config-1.12.1-py2.py3-none-any.whl";
      sha256 = "0jypai43x8ygjf8xlcwh39gqmr8cpbmh97q110102pcmrq8isl6l";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."argparse"
      self."netaddr"
      self."six"
      self."stevedore"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "oslo.i18n" = super.buildPythonPackage rec {
    pname = "oslo.i18n";
    version = "4.0.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/d1/59/16e07470ba39f9a18d679755d66452acd36ca3e03e98aa109f3ff7def649/oslo.i18n-4.0.1-py3-none-any.whl";
      sha256 = "0wgygmrxq7kn3rmn537z0i9c03ayc414bln0040qkm991d1pndgc";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."Babel"
      self."pbr"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "oslo.serialization" = super.buildPythonPackage rec {
    pname = "oslo.serialization";
    version = "3.1.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/1e/95/7b2911102a78df16bb6feb1267821608da9f422375b86466cfc75a6ad4c9/oslo.serialization-3.1.1-py3-none-any.whl";
      sha256 = "0dxmrshqs1j9iiprxq6qmcipw6lpi081f9djwz9krh6yi9la936y";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."PyYAML"
      self."debtcollector"
      self."msgpack"
      self."oslo.utils"
      self."pbr"
      self."pytz"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "oslo.utils" = super.buildPythonPackage rec {
    pname = "oslo.utils";
    version = "3.37.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/68/8d/7567226f7f2528e481a9beca6afb1859b264fb74a1e562769e8a26ef53f7/oslo.utils-3.37.0-py2.py3-none-any.whl";
      sha256 = "0cjf7nkwicwdp520gd5mgv1dvjyrkb4vdmhmc50xxx29605jpy8m";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."debtcollector"
      self."iso8601"
      self."monotonic"
      self."netaddr"
      self."netifaces"
      self."oslo.i18n"
      self."pbr"
      self."pyparsing"
      self."pytz"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "pbr" = super.buildPythonPackage rec {
    pname = "pbr";
    version = "5.4.5";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/96/ba/aa953a11ec014b23df057ecdbc922fdb40ca8463466b1193f3367d2711a6/pbr-5.4.5-py2.py3-none-any.whl";
      sha256 = "1s13pashfg3bmqach8hkzdwwpv28yrqjyqfyn0j2y34f7zi714ap";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "pycparser" = super.buildPythonPackage rec {
    pname = "pycparser";
    version = "2.20";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ae/e7/d9c3a176ca4b02024debf82342dab36efadfc5776f9c8db077e8f6e71821/pycparser-2.20-py2.py3-none-any.whl";
      sha256 = "01apwc8fj6qh7lr01yxmns475rfhz07gccr8220ws3wgcwiav0km";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "pymongo" = super.buildPythonPackage rec {
    pname = "pymongo";
    version = "3.10.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/5d/86/bfcec2a1c99e52344530e581a89871738bdcbf2c8f2ba681ad891e0980f1/pymongo-3.10.0.tar.gz";
      sha256 = "0z1h7yzh9h1cxq7zw4z6ryj2hi51bbfgpsfshipam9ky8bz7jf64";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "pyparsing" = super.buildPythonPackage rec {
    pname = "pyparsing";
    version = "2.4.7";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/8a/bb/488841f56197b13700afd5658fc279a2025a39e22449b7cf29864669b15d/pyparsing-2.4.7-py2.py3-none-any.whl";
      sha256 = "12y8xwjb118a4jqvvfg9k90kqg03n4d3ygb5csz0l81wxy4pb7gg";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "pyperclip" = super.buildPythonPackage rec {
    pname = "pyperclip";
    version = "1.8.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f6/5b/55866e1cde0f86f5eec59dab5de8a66628cb0d53da74b8dbc15ad8dabda3/pyperclip-1.8.0.tar.gz";
      sha256 = "1wi8c0myfchvzv0l5skaascpfvhlxhnvmv96iih893a2c18rfnxp";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "python-mistralclient" = super.buildPythonPackage rec {
    pname = "python-mistralclient";
    version = "4.0.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ad/ec/7074c425e34c4659fc2fe84e56d01381a7dbb0a4c4af4655e8d7af6e237e/python_mistralclient-4.0.1-py3-none-any.whl";
      sha256 = "0cnylapa6vaff1vqgla1khch0qbnir2jql3knw1wsj56jad78a9a";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."PyYAML"
      self."cliff"
      self."keystoneauth1"
      self."osc-lib"
      self."oslo.i18n"
      self."oslo.serialization"
      self."oslo.utils"
      self."pbr"
      self."requests"
      self."six"
      self."stevedore"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "pytz" = super.buildPythonPackage rec {
    pname = "pytz";
    version = "2019.3";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/e7/f9/f0b53f88060247251bf481fa6ea62cd0d25bf1b11a87888e53ce5b7c8ad2/pytz-2019.3-py2.py3-none-any.whl";
      sha256 = "03ah44yp8013w30r69mylqnnal15zdh3z0ymrksy27c71rypsm8w";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "requests" = super.buildPythonPackage rec {
    pname = "requests";
    version = "2.23.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/1a/70/1935c770cb3be6e3a8b78ced23d7e0f3b187f5cbfab4749523ed65d7c9b1/requests-2.23.0-py2.py3-none-any.whl";
      sha256 = "1vizszbz6mdn0fmb1i75d0n5w3jn5f4f968xmyv08ad8pwv916a3";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."certifi"
      self."chardet"
      self."idna"
      self."urllib3"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "requestsexceptions" = super.buildPythonPackage rec {
    pname = "requestsexceptions";
    version = "1.4.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/01/8c/49ca60ea8c907260da4662582c434bec98716177674e88df3fd340acf06d/requestsexceptions-1.4.0-py2.py3-none-any.whl";
      sha256 = "1qwcyc5m1xfplfj0qax3v55234nrf5vg6gjn4g1wazg0nrrdi0rh";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "simplejson" = super.buildPythonPackage rec {
    pname = "simplejson";
    version = "3.17.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/98/87/a7b98aa9256c8843f92878966dc3d8d914c14aad97e2c5ce4798d5743e07/simplejson-3.17.0.tar.gz";
      sha256 = "108yf3252fy4ndqab7h46raksxfhcn113bzy2yd8369vidrjnjrb";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit { fullName = "Academic Free License (AFL)"; } ];
    };
  };
  "six" = super.buildPythonPackage rec {
    pname = "six";
    version = "1.13.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/65/26/32b8464df2a97e6dd1b656ed26b2c194606c16fe163c695a992b36c11cdf/six-1.13.0-py2.py3-none-any.whl";
      sha256 = "1zckxq1k0yyy65hzm3hmlvmiqhpvibkfm797nsfjl22lw917s6qz";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "st2api" = super.buildPythonPackage rec {
    pname = "st2api";
    version = "3.2.dev0";
    src = "${fetchgit {
        url = "https://github.com/stackstorm/st2.git";
        rev = "5bd298ac3ded9cad4eda0886b4d3197753edd0d3";
        sha256 = "0gl3pzh082d5hyacyqd6q63lwzvj97p7g4wlckdc8wvfjpchlfwq";
      }
    }/st2api";
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."eventlet"
      self."gunicorn"
      self."jsonschema"
      self."kombu"
      self."mongoengine"
      self."oslo.config"
      self."oslo.utils"
      self."pymongo"
      self."python-mistralclient"
      self."six"
    ];
    meta = {
      license = [ { fullName = "Apache License (2.0)"; } ];
    };
  };
  "stevedore" = super.buildPythonPackage rec {
    pname = "stevedore";
    version = "1.32.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/e6/49/a35dd566626892d577e426dbe5ea424dd7fbe10645f2c1070dcba474eca9/stevedore-1.32.0-py2.py3-none-any.whl";
      sha256 = "16wwys18v1an2bpr7wwphadmpm0rihsy5zyqyzif7wmhkxsxrrx4";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pbr"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  "urllib3" = super.buildPythonPackage rec {
    pname = "urllib3";
    version = "1.25.9";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/e1/e5/df302e8017440f111c11cc41a6b432838672f5a70aa29227bf58149dc72f/urllib3-1.25.9-py2.py3-none-any.whl";
      sha256 = "05cikmgc4phnk6aidvnhj00rvyz3159aqhs889ynfvbyp076n848";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "vine" = super.buildPythonPackage rec {
    pname = "vine";
    version = "1.3.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/7f/60/82c03047396126c8331ceb64da1dc52d4f1317209f32e8fe286d0c07365a/vine-1.3.0-py2.py3-none-any.whl";
      sha256 = "1bwq7yx13npsnil8wlljhvvndnfs4pp47mf8jlh6zzfiav64fjga";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "wcwidth" = super.buildPythonPackage rec {
    pname = "wcwidth";
    version = "0.1.9";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f6/d5/1ecdac957e3ea12c1b319fcdee8b6917ffaff8b4644d673c4d72d2f20b49/wcwidth-0.1.9-py2.py3-none-any.whl";
      sha256 = "1qdvs6cnb3c8p28lfkzfcn6qvcwwszff2b02cx0a02f0nf323zna";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  "wrapt" = super.buildPythonPackage rec {
    pname = "wrapt";
    version = "1.12.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/82/f7/e43cefbe88c5fd371f4cf0cf5eb3feccd07515af9fd6cf7dbf1d1793a797/wrapt-1.12.1.tar.gz";
      sha256 = "1mwpkdnqxf0yxj1a0hsnl06lf287qi5ap7309wm37x45zf0zlbxn";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "zipp" = super.buildPythonPackage rec {
    pname = "zipp";
    version = "3.1.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/b2/34/bfcb43cc0ba81f527bc4f40ef41ba2ff4080e047acb0586b56b3d017ace4/zipp-3.1.0-py3-none-any.whl";
      sha256 = "02rjw1wk2bcf6xpsbhga80a8kvhnf5wms19rlrzyzdy0y07madma";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
}
