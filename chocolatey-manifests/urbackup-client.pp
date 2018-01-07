include chocolatey

class windows::urbackup {

        package { 'urbackup-client':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

