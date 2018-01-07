include chocolatey

class windows::adobereader {

if $facts['check_adobe_installation'] {
       {
       message  => 'Adobe is installed',
}
} else {
       notify { 'windows::adobereader' :
       message  => 'Adobe is not installed',
}
}
        package { 'adobereader':
        ensure   => 'installed',
        provider => 'chocolatey',
        }
}
