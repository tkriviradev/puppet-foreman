include chocolatey

class windows::silverlight {

        package { 'silverlight':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

