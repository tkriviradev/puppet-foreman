include chocolatey

class windows::anydesk {

        package { 'anydesk':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

