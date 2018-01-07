include chocolatey

class windows::powerpointviewer {

        package { 'powerpoint.viewer':
        ensure   => 'absent',
        provider => 'chocolatey',

        }
}

