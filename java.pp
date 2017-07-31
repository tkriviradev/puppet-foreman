include chocolatey

class windows::java {

        package { 'jre8':
        ensure   => '8.0.141',
        provider => 'chocolatey',

        }
}

