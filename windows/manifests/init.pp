include chocolatey

Package {
  ensure => latest,
  provider => 'chocolatey',
}

reboot {'dsc_reboot':
  when => pending,
}

# Utilities
package {["Virtualbox", "git", "Steam", "Discord", "f.lux"]:
}

# Parsec(seperate to skip checksums)
package {'parsec':
  install_options => ["--ignore-checksums", "--pre"],
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
dsc_windowsoptionalfeature {'WSL':
  dsc_ensure => 'Enable',
  dsc_name => 'Microsoft-Windows-Subsystem-Linux',
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

dsc_registry {'disable lock key':
  dsc_ensure => 'Present',
  dsc_key => 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System',
  dsc_valuename => 'DisableLockWorkstation',
  dsc_valuedata => '1',
  dsc_valuetype => 'Dword',
  #dsc_hex => true,
  dsc_force => true,
  dsc_psdscrunascredential => {
    user => lookup('user'),
    password => Sensitive(lookup('password')),
  },
}
