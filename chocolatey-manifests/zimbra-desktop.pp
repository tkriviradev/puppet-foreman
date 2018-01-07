include chocolatey

class windows::zimbra_desktop {

        package { 'zimbra-desktop':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

