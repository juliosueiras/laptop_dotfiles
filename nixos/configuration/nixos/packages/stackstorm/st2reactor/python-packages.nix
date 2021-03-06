# Generated by pip2nix 0.8.0.dev1
# See https://github.com/nix-community/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
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
  "apscheduler" = super.buildPythonPackage rec {
    pname = "apscheduler";
    version = "3.6.3";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f3/34/9ef20ed473c4fd2c3df54ef77a27ae3fc7500b16b192add4720cab8b2c09/APScheduler-3.6.3-py2.py3-none-any.whl";
      sha256 = "09p5c8if0rm9sfj101v86s4wpiw3h64xarpp2f4q3ckw9kdyrcg8";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."pytz"
      self."setuptools"
      self."six"
      self."tzlocal"
    ];
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
      license = [ { fullName = "Freeware"; } { fullName = "BSD-like"; } ];
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
  "jsonpath-rw" = super.buildPythonPackage rec {
    pname = "jsonpath-rw";
    version = "1.4.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/71/7c/45001b1f19af8c4478489fbae4fc657b21c4c669d7a5a036a86882581d85/jsonpath-rw-1.4.0.tar.gz";
      sha256 = "1v7vqkx136y8xm2xx05ajqp1m0x4qy72dl83c4zi3bj53hl73i05";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."decorator"
      self."ply"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
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
      license = [ pkgs.lib.licenses.asl20 { fullName = "Apache"; } ];
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
      license = [ pkgs.lib.licenses.bsdOriginal pkgs.lib.licenses.mit ];
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
  "ply" = super.buildPythonPackage rec {
    pname = "ply";
    version = "3.11";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/a3/58/35da89ee790598a0700ea49b2a66594140f44dec458c07e8e3d4979137fc/ply-3.11-py2.py3-none-any.whl";
      sha256 = "1kh7m0i2ghjhrbzi6a28yw3rcnzy5r2i4srls4pvspmna21rnvq9";
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
  "python-dateutil" = super.buildPythonPackage rec {
    pname = "python-dateutil";
    version = "2.8.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/41/17/c62faccbfbd163c7f57f3844689e3a78bae1f403648a6afb1d0866d87fbb/python_dateutil-2.8.0-py2.py3-none-any.whl";
      sha256 = "1yzj7m4h5babisvqac674xx82a8gd7ynxqhm2rwj7mpf9b3q8rby";
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
      license = [ pkgs.lib.licenses.asl20 pkgs.lib.licenses.bsdOriginal { fullName = "Dual License"; } ];
    };
  };
  "pytz" = super.buildPythonPackage rec {
    pname = "pytz";
    version = "2020.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/4f/a4/879454d49688e2fad93e59d7d4efda580b783c745fd2ec2a3adf87b0808d/pytz-2020.1-py2.py3-none-any.whl";
      sha256 = "1vbrpdzhalwjb45q1gwvybj0ahz16rrj7v1v9kjcdhrrdlxxb554";
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
  "st2reactor" = super.buildPythonPackage rec {
    pname = "st2reactor";
    version = "3.2.dev0";
    src = "${fetchgit {
        url = "https://github.com/stackstorm/st2.git";
        rev = "5bd298ac3ded9cad4eda0886b4d3197753edd0d3";
        sha256 = "0gl3pzh082d5hyacyqd6q63lwzvj97p7g4wlckdc8wvfjpchlfwq";
      }
    }/st2reactor";
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."apscheduler"
      self."eventlet"
      self."jsonpath-rw"
      self."jsonschema"
      self."kombu"
      self."oslo.config"
      self."python-dateutil"
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
  "tzlocal" = super.buildPythonPackage rec {
    pname = "tzlocal";
    version = "2.0.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ef/99/53bd1ac9349262f59c1c421d8fcc2559ae8a5eeffed9202684756b648d33/tzlocal-2.0.0-py2.py3-none-any.whl";
      sha256 = "0j4h0dp5f9m51hlhnrvvwr1d0h33lkc9gppfw5h4nfv319pg3j8i";
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
