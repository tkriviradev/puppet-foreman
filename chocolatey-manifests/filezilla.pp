include chocolatey

class windows::filezilla {

        package { 'filezilla':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

