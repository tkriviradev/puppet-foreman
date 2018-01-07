include chocolatey

class windows::visioviewer {

        package { 'visioviewer':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

