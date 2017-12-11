node 'puppetnode3' {

    include base

    class {'::tomcat':
        service_state => running,
    }

    tomcat::deploy { 'sysfoo':
        deploy_url	=> 'https://2-113859142-gh.circle-artifacts.com/0/tmp/circle-artifacts.btdOoSb/sysfoo.war',
        checksum_value => 'a60dcd4d864302bf4fa40588dfecaa0e',
    }

}
