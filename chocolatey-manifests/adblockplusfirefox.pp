include chocolatey

class windows::adblockplusfirefox {

        package { 'adblockplus-firefox':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

