class vagrant::plugins::nixos () {
  exec { 'vagrant-nixos-plugin':
    path    => 'C:\HashiCorp\Vagrant\bin;C:\Windows\System32',
    command => "cmd.exe /c vagrant plugin install vagrant-nixos-plugin",
    onlyif  => "cmd.exe /c vagrant plugin list | findstr vagrant-nixos-plugin | find /c /v \"\" | find /i \"0\"",
  }
}
