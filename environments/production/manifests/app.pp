node 'puppetnode1', 'puppetnode2', 'puppetnode5.localdomain' {
	include java::install
	include tomcat
	include base
}
