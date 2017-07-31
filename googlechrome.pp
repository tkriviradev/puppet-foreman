include chocolatey

class windows::googlechrome {

        package { 'googlechrome':
        ensure   => 'latest',
        provider => 'chocolatey',
	install_options => ['--ignore-checksums']

        }
}

