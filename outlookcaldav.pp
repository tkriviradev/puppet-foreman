include chocolatey

class windows::outlookcaldav {

        package { 'outlookcaldav':
        ensure   => 'latest',
        provider => 'chocolatey',

        }
}

