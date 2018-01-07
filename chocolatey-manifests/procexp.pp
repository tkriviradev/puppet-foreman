include chocolatey

class windows::procexp {

        package { 'procexp':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

