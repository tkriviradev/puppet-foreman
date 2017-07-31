include chocolatey

class windows::vcredist140 {

        package { 'vcredist140':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

