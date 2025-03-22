plugin "google" {
    enabled = true
    version = "0.31.0"
    source  = "github.com/terraform-linters/tflint-ruleset-google"
}


# Enable additional rules here
rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
}

rule "terraform_naming_convention" {
  enabled = true
}
