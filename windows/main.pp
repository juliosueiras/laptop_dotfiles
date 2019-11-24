include chocolatey

Package {
  ensure => latest,
  provider => 'chocolatey',
}

reboot {'dsc_reboot':
  when => pending,
}

# Utilities
package {["Virtualbox", "git", "Steam"]:
}

# HashiCorp's Tools
package {["terraform", "packer", "vagrant"]:
}->
class { 'vagrant::plugins::nixos':}

# Packages Graveyard
package {["mongoclient", "mongodb.portable"]:
  ensure => 'absent',
}


package {'powershell':}->

# Install WSL(Linux in Windows)
dsc {'WSL':
  resource_name => 'WindowsOptionalFeature',
  module        => {
    name    => 'PSDesiredStateConfiguration',
    version => '1.1'
  },
  properties => {
    ensure => 'Enable',
    name => 'Microsoft-Windows-Subsystem-Linux',
  }
}->package {'wsl-alpine': }


dsc_xregistry {'remap caps lock to escape':
  dsc_ensure => 'Present',
  dsc_key => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout',
  dsc_valuename => 'Scancode Map',
  dsc_valuedata => '0000000000000000030000003a00460001003a0000000000',
  dsc_valuetype => 'Binary',
  dsc_hex => true,
  notify => Reboot['dsc_reboot'],
}
