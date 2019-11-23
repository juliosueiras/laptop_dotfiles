include chocolatey

package {["Virtualbox", "git", "Steam"]:
  provider  => chocolatey,
  ensure    => latest, 
}
