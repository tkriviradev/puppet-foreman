include chocolatey

class windows::adblockplusie {

        package { 'adblockplusie':
        ensure   => 'latest',
        provider => 'chocolatey',

        }
}

