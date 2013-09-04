#
# Definition: susefw::broadcast
#
# Broadcast packet settings
#
define susefw::broadcast (
    $ensure,    # present|absent
    $zone,      # DMZ|EXT|INT
    $type       = "broadcast"
    ) {
    include susefw
    include susefw::params

    $fwcfg      = $susefw::params::firewall_config
    $fw_zone    = upcase("$zone")

    $fw_type    = "port="
    $fw_rule    = "${fw_type}${name}"

    case $ensure {
        present: {
            exec { "susefw_add_${fw_rule}_${fw_zone}":
                command => "yast firewall broadcast add $fw_rule zone=$fw_zone",
                unless  => "$helper $fw_zone $type $name",
            }
        }
        absent: {
            exec { "susefw_rm_${fw_rule}_${fw_zone}":
                command => "yast firewall broadcast remove $fw_rule zone=$fw_zone",
                onlyif  => "$helper $fw_zone $type $name",

            }
        }
        default: {
            fail "Invalid 'ensure' value '$ensure' for susefw::services"
        }
    }
}
