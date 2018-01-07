Facter.add('check_mk_monnetwork') do
    setcode do
      Facter::Util::Resolution.exec("ifconfig |egrep '10.145.97|10.145.99|10.145.240|10.145.58' |  awk '{ print $2}' | sed 's/addr:*//'")
    end
  end  