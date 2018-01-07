Facter.add('check_mk_agent') do
  setcode do
    Facter::Util::Resolution.exec("rpm -qa |grep check-mk-agent | awk '{ print $1 }'")
  end
end
