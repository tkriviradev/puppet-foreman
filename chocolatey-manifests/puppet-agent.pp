include chocolatey

class windows::puppetagent {

        package { 'puppet-agent':
        ensure   => 'latest',
        provider => 'chocolatey',
        }
}

