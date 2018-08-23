provider "aws" {
    alias   = "peer"
    region  = "${var.peer_to_region}"
    profile = "${var.peer_to_profile}"

    shared_credentials_file = "${var.peer_to_credentials}"
}

data "aws_region" "peer" {
  provider = "aws.peer"
}

data "aws_caller_identity" "peer" {
  provider = "aws.peer"
}
