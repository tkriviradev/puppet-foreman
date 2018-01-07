include chocolatey

class windows::owncloud {

        package { 'owncloud-client':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

