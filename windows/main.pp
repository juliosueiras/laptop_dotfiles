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
}

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
