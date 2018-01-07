class windows::zip {

include chocolatey

	package { '7zip':
	ensure   => 'installed',
	provider => 'chocolatey',
	install_options => ['--ignore-checksums']
	}
}

