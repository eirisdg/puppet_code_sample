node 'puppetnode1', 'puppetnode2', 'puppetnode5.localdomain' {
	# Si usamos una clase sin parámetros, simplemente importamos.
	include base
	include java::install

	# Si usamos una clase con parámetros, tendremos que llamarla como clase y sus parámetros.
	class { '::tomcat':
		$shutdown_verbose	=> true,
	}

}
