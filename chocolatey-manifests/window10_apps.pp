class windows10::appsremove {

if $::major == '10' {


download_file { "Download remove_apps.ps1" :
      url                   => 'https://raw.githubusercontent.com/tkriviradev/chocolatey/master/remove_apps.ps1',
      destination_directory => 'C:\Users\Public',
      notify => Exec['uninstal_win10apps'],
    }

exec { 'uninstal_win10apps':
    command  => 'Powershell.exe -ExecutionPolicy RemoteSigned -File C:\Users\Public\remove_apps.ps1',
    provider => 'powershell',
    refreshonly => true,
  }

}
}
