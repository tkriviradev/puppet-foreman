include chocolatey

class windows::powershell {

	package { 'powershell':
	ensure   => 'latest',
	provider => 'chocolatey',

	}
}
