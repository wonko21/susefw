# SuSEfirewall2 module for Puppet

This module manages SuSEfirewall2 configuration on SUSE sysetms.

## Usage

### susefw
Install and enabled SuSEfirewall2.

    class { "susefw": }

### susefw::services
Add or remove services, ports, and protocols

    susefw::services { "apache2": ensure => present, zone => "ext", type => "service" }
    susefw::services { "10080": ensure => present, zone => "ext", type => "tcpport" }
    susefs::services { "mysql": ensure => ebasent, zone => "dmz", type => "services" }

