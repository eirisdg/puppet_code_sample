node 'puppetnode1', 'puppetnode2', 'puppetnode5.localdomain' {
	include base
	include java::install
	include tomcat

}
