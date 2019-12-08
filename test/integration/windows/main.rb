control 'windows-choco-utility' do
  title 'Windows: Chocolatey utlity packages'
  desc 'rationale', 'This ensures that the utlity packages are installed'
  tag 'windows','choco'
  for package in ["parsec", "virtualbox", "steam", "f.lux", "PowerShell", "discord", "git"] do
    describe chocolatey_package(package) do
      it { should be_installed }
    end 
  end
end 

control 'windows-choco-graveyard' do
  title 'Windows: Chocolatey graveyard packages'
  desc 'rationale', 'This ensures that these packages are not installed'
  tag 'windows','choco'
  for package in ["mongoclient"] do
    describe chocolatey_package(package) do
      it { should_not be_installed }
    end
  end
end


control 'windows-choco-hashicorp' do
  title 'Windows: Chocolatey hashicorp packages'
  desc 'rationale', 'This ensures that the hashicorp packages are installed'
  tag 'windows','choco'
  for package in ["terraform", "packer", "vagrant"] do
    describe chocolatey_package(package) do
      it { should be_installed }
    end
  end
end

control 'windows-wsl' do
  title 'Windows: WSL'
  desc 'rationale', 'This ensures that WSL is installed' 
  tag 'windows','wsl'

  describe windows_feature("Microsoft-Windows-Subsystem-Linux") do
    it { should be_installed }
  end
end
