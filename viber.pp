include chocolatey

class windows::viber {

        package { 'viber':
        ensure   => 'latest',
        provider => 'chocolatey',

        }
}

