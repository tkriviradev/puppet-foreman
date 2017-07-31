include chocolatey

class windows::skype {

        package { 'skype':
        ensure   => '7.37.0.103',
        provider => 'chocolatey',
	install_options => ['--ignore-checksums']
        }
}

