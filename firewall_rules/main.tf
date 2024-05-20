# module.firewall_rules.google_compute_firewall.rules_ingress_egress["egress-allow-outbound-https"]:
resource "google_compute_firewall" "rules_ingress_egressoutbound-https" {
    description        = "example rule"
    destination_ranges = [
        "1.1.1.1/32"
    ]
    direction          = "EGRESS"
    disabled           = false
    name               = "egress-allow-outbound-https"
    network            = var.vpc_name
    priority           = 50
    project            = var.project_id
    source_ranges      = [
        "10.0.0.0/8"
    ]

    allow {
        ports    = [
            "443"
        ]
        protocol = "tcp"
    }
}

#172.16.0.0/28

resource "google_compute_firewall" "rules_egress_k8control" {
    description        = "Allow GKE control plane to talk"
    destination_ranges = [
        "10.0.0.0/8",
        "172.16.0.0/27"
    ]
    direction          = "EGRESS"
    disabled           = false
    name               = "egress-allow-k8s-controlplane"
    network            = var.vpc_name
    priority           = 30
    project            = var.project_id
    source_ranges      = [
        "10.0.0.0/8",
        "172.16.0.0/28"
    ]

    allow {
        ports    = [ ]
        protocol = "all"
    }
}

resource "google_compute_firewall" "rules_ingress_k8control" {
    description        = "Allow GKE control plane to talk"
    destination_ranges = [
        "10.0.0.0/8",
        "172.16.0.0/27"
    ]
    direction          = "INGRESS"
    disabled           = false
    name               = "ingress-allow-k8s-controlplane"
    network            = var.vpc_name
    priority           = 30
    project            = var.project_id
    source_ranges      = [
        "10.0.0.0/8",
        "172.16.0.0/28"
    ]

    allow {
        ports    = [ ]
        protocol = "all"
    }
}

#35.235.240.0/20
resource "google_compute_firewall" "rules_ssh_rdp_via_cloudconsole" {
    description        = "Allow access to instances from Cloud console"
    destination_ranges = [
        "10.0.0.0/8",
        "172.16.0.0/27"
    ]
    direction          = "INGRESS"
    disabled           = false
    name               = "ingress-allow-cloud-console-ssh"
    network            = var.vpc_name
    priority           = 40
    project            = var.project_id
    source_ranges      = [
        "35.235.240.0/20"
    ]

    allow {
        ports    = [ ]
        protocol = "all"
    }
}


#172.16.0.0/28


# module.firewall_rules.google_compute_firewall.rules_ingress_egress["egress-within-subnets"]:
resource "google_compute_firewall" "egress-within-subnets" {
    description        = "example rule"
    destination_ranges = [
        "10.0.0.0/8"
    ]
    direction          = "EGRESS"
    disabled           = false
    name               = "egress-within-subnets"
    network            = var.vpc_name
    priority           = 100
    project            = var.project_id
    source_ranges      = [
        "10.0.0.0/8"
    ]

    allow {
        ports    = []
        protocol = "icmp"
    }
    allow {
        ports    = []
        protocol = "tcp"
    }
    allow {
        ports    = []
        protocol = "udp"
    }
}

# module.firewall_rules.google_compute_firewall.rules_ingress_egress["ingress-allow-sample-rule"]:
resource "google_compute_firewall" "ingress-allow-sample-rule" {
    description        = "just an example"
    destination_ranges = [
        "10.0.0.0/8"
    ]
    direction          = "INGRESS"
    disabled           = false
    name               = "ingress-allow-sample-rule"
    network            = var.vpc_name
    priority           = 50
    project            = var.project_id
    source_ranges      = [
        "127.0.0.1/32"
    ]

    allow {
        ports    = [
            "8080"
        ]
        protocol = "tcp"
    }
    allow {
        ports    = []
        protocol = "udp"
    }
}

# module.firewall_rules.google_compute_firewall.rules_ingress_egress["ingress-icmp"]:
resource "google_compute_firewall" "ingress-icmp" {
    description        = "just an example"
    destination_ranges = [
        "10.0.0.18/32"
    ]
    direction          = "INGRESS"
    disabled           = false
    name               = "ingress-icmp"
    network            = var.vpc_name
    priority           = 100
    project            = var.project_id
    source_ranges      = [
        "0.0.0.0/0"
    ]

    allow {
        ports    = []
        protocol = "icmp"
    }
}

# module.firewall_rules.google_compute_firewall.rules_ingress_egress["ingress-within-subnets"]:
resource "google_compute_firewall" "ingress-within-subnets" {
    description        = "example rule"
    destination_ranges = [
        "10.0.0.0/8"
    ]
    direction          = "INGRESS"
    disabled           = false
    name               = "ingress-within-subnets"
    network            = var.vpc_name
    priority           = 150
    project            = var.project_id
    source_ranges      = [
        "10.0.0.0/8"
    ]

    allow {
        ports    = []
        protocol = "icmp"
    }
    allow {
        ports    = []
        protocol = "tcp"
    }
    allow {
        ports    = []
        protocol = "udp"
    }
}

