include chocolatey

class windows::adblockpluschrome {

        package { 'adblockpluschrome':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

