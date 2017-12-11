node 'puppetnode4' {
  include ::haproxy
  haproxy::listen { 'loadbalancer-01':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }
  haproxy::balancermember { 'puppetnode1':
    listening_service => 'loadbalancer-01',
    server_names      => 'puppetnode1',
    ipaddresses       => '192.168.0.76',
    ports             => '8140',
    options           => 'check',
  }
  haproxy::balancermember { 'puppetnode2':
    listening_service => 'loadbalancer-01',
    server_names      => 'puppetnode2',
    ipaddresses       => '192.168.0.77',
    ports             => '8140',
    options           => 'check',
  }
}
