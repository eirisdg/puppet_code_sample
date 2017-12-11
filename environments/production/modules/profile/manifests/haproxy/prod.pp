class profile::haproxy::prod {
    include ::haproxy
    # Nombramos el balanceador. La ip la saca del facter
    haproxy::listen { 'loadbalancer-01':
      collect_exported => false,
      ipaddress        => $::ipaddress,
      ports            => '80',
    }

    # Definimos los nodos del balanceador y las IP y puertos que tienen que balancear
    haproxy::balancermember { 'puppetnode1':
      listening_service => 'loadbalancer-01',
      server_names      => 'puppetnode1',
      ipaddresses       => '192.168.0.76',
      ports             => '8080',
      options           => 'check',
    }
    haproxy::balancermember { 'puppetnode2':
      listening_service => 'loadbalancer-01',
      server_names      => 'puppetnode2',
      ipaddresses       => '192.168.0.77',
      ports             => '8080',
      options           => 'check',
    }
    haproxy::balancermember { 'puppetnode5':
      listening_service => 'loadbalancer-01',
      server_names      => 'puppetnode5',
      ipaddresses       => '192.168.0.80',
      ports             => '8080',
      options           => 'check',
    }
}
