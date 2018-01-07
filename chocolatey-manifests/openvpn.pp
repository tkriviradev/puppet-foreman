include chocolatey

class windows::openvpn {

        package { 'openvpn':
        ensure   => 'latest',
        provider => 'chocolatey',

        }
}

