include chocolatey

class windows::vlc {

        package { 'vlc':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

