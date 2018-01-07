include chocolatey

class windows::vcredist2010 {

        package { 'vcredist2010':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

