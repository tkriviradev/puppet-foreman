include chocolatey

class windows::chocolateypkg {

        package { 'chocolatey':
        ensure   => 'latest',
        provider => 'chocolatey',
        install_options => ['--ignore-checksums']
        }
}

