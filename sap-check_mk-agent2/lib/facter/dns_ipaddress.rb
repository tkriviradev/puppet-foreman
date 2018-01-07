Facter.add('dns_ipaddress') do
  setcode do
    Facter::Util::Resolution.exec("/usr/bin/host -t a $(facter fqdn) | /bin/awk '{print $NF}'")
  end
end
