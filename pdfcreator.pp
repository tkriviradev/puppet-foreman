include chocolatey

class windows::pdfcreator {

        package { 'pdfcreator':
        ensure   => 'installed',
        provider => 'chocolatey',

        }
}

