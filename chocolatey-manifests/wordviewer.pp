include chocolatey

class windows::wordviewer {

        package { 'wordviewer':
        ensure   => 'absent',
        provider => 'chocolatey',

        }
}

