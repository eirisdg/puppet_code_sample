class base inherits base::params{

	user {'deploy':
		ensure		=> present,
		uid		=> 5001,
		password	=> '$1$eg4SzP0E$qgvPOG2EWIPTQRv58dXpG/',
		home		=> '/home/deploy',
		managehome	=> true,
	}

	package { ['tree', 'wget', 'git', 'unzip', 'ntp'] : }

	service { $::base::ntp_service :
		ensure		=> running,
		enable		=> true,
	}

	file { '/etc/motd':
		ensure => file,
		mode => '0644',
		owner => 'root',
		group => 'root',
		content => "

		==========================
		SERVER PROPERTY OF EIRISDG
		==========================

		SYSTEM INFO:
		------------

		IPADDRESS			: ${::ipaddress}
		HOSTNAME			: ${::hostname}
		MEMORY				: ${::memory['system']['total']}
		CPU CORES			: ${::processors['count']}
		OPERATING SYSTEM	: ${::os['name']} ${::os['release']['major']}

		"
	}
}
