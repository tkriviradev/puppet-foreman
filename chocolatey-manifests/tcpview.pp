include chocolatey

class windows::tcpview {

        package { 'tcpview':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

