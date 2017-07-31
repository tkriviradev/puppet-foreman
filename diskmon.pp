include chocolatey

class windows::diskmon {

        package { 'diskmon':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

