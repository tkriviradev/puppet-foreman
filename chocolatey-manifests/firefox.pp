include chocolatey

class windows::firefox {

        package { 'firefox':
        ensure   => 'latest',
        provider => 'chocolatey',

        }
}

