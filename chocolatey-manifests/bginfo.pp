include chocolatey

class windows::bginfo {

        package { 'bginfo':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

