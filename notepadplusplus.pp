include chocolatey

class windows::notepadplusplus {

        package { 'notepadplusplus':
        ensure   => 'latest',
        provider => 'chocolatey',

        }
}

