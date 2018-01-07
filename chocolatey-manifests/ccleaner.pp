include chocolatey

class windows::ccleaner {

        package { 'ccleaner':
        ensure   => '5.31.6105',
        provider => 'chocolatey',
	install_options => ['--allow-downgrade']
        }
}

