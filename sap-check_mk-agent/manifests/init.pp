class agent (
    $only_from     = [ ],
    $add_logs      = [ ],
    $mk_sap_local_cfg      = [ ],

){

   Package {
   allow_virtual => true,
   }

    package { 'check-mk-agent':
     ensure     => installed,
    }

    package { 'xinetd':
     ensure     => installed,
    }

    service { 'xinetd':
     ensure     => running,
     enable     => true,
     hasrestart => true,
     hasstatus  => true,
     # pattern    => 'name',
    }

    file { '/etc/xinetd.d/check-mk-agent':
     notify     => Service['xinetd'],
     ensure     => file,
     content    => template('agent/check-mk-agent.erb');
    }
    # puppet will not execute this command if path is detected
    exec {'semanage port -a 6556 -p tcp -t port_t':
     path       => ['/usr/bin', '/usr/sbin', '/bin',],
     unless     => 'ls /usr/share/check-mk-agent/plugins/mk_inventory 2>/dev/null',
     returns    => [0, 1, 14],
    }

    file { '/etc/check-mk-agent/logwatch.cfg':
     ensure     => file,
     content    => template('agent/logwatch.erb');
    }

    file { '/usr/share/check-mk-agent/plugins/mk_sap':
     ensure     => file,
     owner  	=> 'root',
     group  	=> 'root',
     mode   	=> '0740',
     content    => template('agent/mk_sap.erb');
    }

    # From here puppet will copy local agent files from one dir to antoher

    file { '/usr/share/check-mk-agent/plugins/logwatch.cfg':
     ensure => 'present',
     source => '/etc/check-mk-agent/logwatch.cfg',
    }

    file { '/usr/share/check-mk-agent/plugins/mk_inventory':
     ensure => 'present',
     source => '/usr/share/check-mk-agent/available-plugins/mk_inventory',
     owner  => 'root',
     group  => 'root',
     mode   => '0740',
    }

    #file { '/usr/share/check-mk-agent/plugins/mk_sap':
    # ensure => 'present',
    # source => '/usr/share/check-mk-agent/available-plugins/mk_sap',
    # owner  => 'root',
    # group  => 'root',
    # mode   => '0740',
    #}

    file { '/usr/share/check-mk-agent/plugins/mk_logwatch':
     ensure => 'present',
     source => '/usr/share/check-mk-agent/available-plugins/mk_logwatch',
     owner  => 'root',
     group  => 'root',
     mode   => '0740',
    }
 
	# From here Puppet will copy local checks and plugins and some config files

	file {'/usr/share/check-mk-agent/local/': 
	source  => "puppet:///modules/agent/local_checks", 
	ensure  => "directory", 
	owner   => 'root',
        group   => 'root',
        mode    => '0741',
	recurse => "true";
	}
	
	file {'/usr/share/check-mk-agent/plugins/':
        source 	=> "puppet:///modules/agent/plugins",
        ensure 	=> "directory",
	owner   => 'root',
        group   => 'root',
        mode    => '0740',
        recurse => "true";
        }

	file {'/usr/share/check-mk-agent/check_logwatch.sh':
	ensure  => 'present',
	owner   => 'root',
    	group   => 'root',
    	mode    => '0740',
        source 	=> "puppet:///modules/agent/check_logwatch.sh";
        }

	file {'/etc/check-mk-agent/sap.cfg':
        source => "puppet:///modules/agent/sap.cfg",
        ensure => "present";
        }

	# puppet will execute this file only when sap is detected on the system

   	exec { 'check_logwatch.sh':
	onlyif  => '/usr/bin/test -e /usr/sap/hostctrl/exe/lssap',
    	command => "/usr/share/check-mk-agent/check_logwatch.sh";
   	}

        # Register host to Check_MK Server

        file {'/usr/share/check-mk-agent/host_register.sh': 
	source => "puppet:///modules/agent/host_register.sh", 
	ensure => "file", 
	owner  => 'root',
        group  => 'root',
        mode   => '0740',
	}
        
exec { 'host_register.sh':
        path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin',],
        onlyif => '/usr/bin/test -e /usr/share/check-mk-agent/host_register.sh',
        command => '/usr/share/check-mk-agent/host_register.sh -u autouser -p XXXXXXXXXXXXXXXXXXXXXXXXXXX',
        #refreshonly => true,
        returns => [0, 1, 7];
        }

}
