class susefw::params {
    if $::osfamily == "suse" {
        if $::operatingsystemrelease >= 12.3 {
            $susefirewall_setup  = "SuSEfirewall2"
        } else {
            $susefirewall_setup  = "SuSEfirewall2_setup"
        }
    }
}
