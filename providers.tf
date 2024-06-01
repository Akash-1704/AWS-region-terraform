terraform {
  required_providers = {
    aws = {
      source = "hashicorp/aws"
    }
  }

  # (if you had a backend configuration in your
  # old root module then move that into here too)
}
