# == Class: role::lb
#
class role::lb {
    # resources
    include profile::base
    include profile::haproxy::prod
}
