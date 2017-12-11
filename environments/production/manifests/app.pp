node 'puppetnode1', 'puppetnode2', 'puppetnode5.localdomain' {
	# Si usamos una clase sin parámetros, simplemente importamos.
	include base
	include java::install

	# Si usamos una clase con parámetros, tendremos que llamarla como clase y sus parámetros.
	class { '::tomcat':
		shutdown_verbose	=> running,
	}

	tomcat::deploy {'sysfoo':
		deploy_url	=> 'https://2-113859142-gh.circle-artifacts.com/0/tmp/circle-artifacts.btdOoSb/sysfoo.war',
		checksum_value => 'a60dcd4d864302bf4fa40588dfecaa0e',
	}

}
