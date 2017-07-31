include chocolatey

class windows::flashplayerplugin {

        package { 'flashplayerplugin':
        ensure   => 'latest',
        provider => 'chocolatey',

        }
}

