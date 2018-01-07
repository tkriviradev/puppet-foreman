class windows::vc_redist {

download_file { "Download vc_redist" :
	url                   => 'https://download.microsoft.com/download/6/D/F/6DF3FF94-F7F9-4F0B-838C-A328D1A7D0EE/vc_redist.x86.exe',
	destination_directory => 'C:\Users\Public',
#	notify => Package['install_vc_redist'],
    }

package { 'install_vc_redist':
	ensure	=> '14.0.24212.0',
	name   	=> 'Microsoft Visual C++ 2015 Redistributable (x86) - 14.0.24212',
    	source	=> 'C:\Users\Public\vc_redist.x86.exe',
	provider => windows,
   	install_options => ['/S']
  }

}

