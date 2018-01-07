include chocolatey

class windows::libreoffice {

        package { 'libreoffice':
        ensure   => 'absent',
        provider => 'chocolatey',

        }
}

