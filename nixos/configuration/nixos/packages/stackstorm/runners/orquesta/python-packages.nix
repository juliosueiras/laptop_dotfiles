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
  "Jinja2" = super.buildPythonPackage rec {
    pname = "Jinja2";
    version = "2.11.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/30/9e/f663a2aa66a09d838042ae1a2c5659828bb9b41ea3a6efa20a20fd92b121/Jinja2-2.11.2-py2.py3-none-any.whl";
      sha256 = "0dbhqghlha2qsgn37xz8mcwdd91scsa3sky0i5534mgr7hfn997h";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."MarkupSafe"
    ];
    meta = {
      license = [ pkgs.lib.licenses.bsd3 pkgs.lib.licenses.bsdOriginal ];
    };
  };
  "MarkupSafe" = super.buildPythonPackage rec {
    pname = "MarkupSafe";
    version = "1.1.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz";
      sha256 = "0sqipg4fk7xbixqd8kq6rlkxj664d157bdwbh93farcphf92x1r9";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
    meta = {
      license = [ pkgs.lib.licenses.bsd3 pkgs.lib.licenses.bsdOriginal ];
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
      license = [ { fullName = "GNU Library or Lesser General Public License (LGPL)"; } { fullName = "LGPL"; } ];
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
    version = "0.25.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/9d/4d/43a042ef699624b5e65dee7cc7c1cd9452348d301ea0d851074720615c91/eventlet-0.25.2-py2.py3-none-any.whl";
      sha256 = "07fv0abqdifhhk1pdf6mvijmkbp88375m25anfvzr6w273sjqpwm";
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
  "networkx" = super.buildPythonPackage rec {
    pname = "networkx";
    version = "1.11";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/d3/2c/e473e54afc9fae58dfa97066ef6709a7e35a1dd1c28c5a3842989322be00/networkx-1.11-py2.py3-none-any.whl";
      sha256 = "1zy12ngnn8dbmls5sz9aaix4k491an42mq2dxsf01jwwzra9n8hv";
    };
    format = "wheel";
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
  "orquesta" = super.buildPythonPackage rec {
    pname = "orquesta";
    version = "1.1.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/a0/82/d6e068ecb386fdbbe83c2051262f518dd4443eefa92d6f5fc8baa779a46b/orquesta-1.1.1-py3-none-any.whl";
      sha256 = "1xjh24p5vgr46d89jk643spsh1mkz7mpv3p2w0f6sm0qcbw25197";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."Jinja2"
      self."PyYAML"
      self."chardet"
      self."eventlet"
      self."jsonschema"
      self."networkx"
      self."python-dateutil"
      self."six"
      self."stevedore"
      self."ujson"
      self."yaql"
    ];
    meta = {
      license = [ { fullName = "Apache License (2.0)"; } pkgs.lib.licenses.asl20 ];
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
    version = "2.8.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/d4/70/d60450c3dd48ef87586924207ae8907090de0b306af2bce5d134d78615cb/python_dateutil-2.8.1-py2.py3-none-any.whl";
      sha256 = "0answacgnckybm5iyfnaqsgval3mdbpak4i6fsbi2vv8x8qkzfvm";
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
      license = [ pkgs.lib.licenses.bsdOriginal pkgs.lib.licenses.asl20 { fullName = "Dual License"; } ];
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
    version = "1.14.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/65/eb/1f97cb97bfc2390a276969c6fae16075da282f5058082d4cb10c6c5c1dba/six-1.14.0-py2.py3-none-any.whl";
      sha256 = "0v2bfai6xiqkl06hy7996wkbali2p5vxznfnygkr7xyqakid4g4g";
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
  "stackstorm-runner-orquesta" = super.buildPythonPackage rec {
    pname = "stackstorm-runner-orquesta";
    version = "3.2.dev0";
    src = "${fetchgit {
        url = "https://github.com/stackstorm/st2.git";
        rev = "5bd298ac3ded9cad4eda0886b4d3197753edd0d3";
        sha256 = "0gl3pzh082d5hyacyqd6q63lwzvj97p7g4wlckdc8wvfjpchlfwq";
      }
    }/contrib/runners/orquesta_runner";
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."orquesta"
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
  "ujson" = super.buildPythonPackage rec {
    pname = "ujson";
    version = "2.0.3";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/50/d7/dce3fc97329639bba9c8b3cdadaa51ae2757c9402d4b43ac5feb8b624792/ujson-2.0.3.tar.gz";
      sha256 = "18z9gb9ggy1r464b9q1gqs078mqgrkj6dys5a47529rqk3yfybdx";
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
  "yaql" = super.buildPythonPackage rec {
    pname = "yaql";
    version = "1.1.3";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/77/89/cfee017cf4f2d6f5e7159bbf13fe4131c7dbf20d675b78c9928ae9aa9df8/yaql-1.1.3.tar.gz";
      sha256 = "02fj0n6919n0h0qkrb3szyk9g4s3c3x2f3gq0fn9f75nm3lxjd0i";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [
      self."pbr"
    ];
    propagatedBuildInputs = [
      self."Babel"
      self."pbr"
      self."ply"
      self."python-dateutil"
      self."six"
    ];
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
}
