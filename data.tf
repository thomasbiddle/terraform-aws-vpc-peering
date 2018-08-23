data "aws_vpc" "peer_from_vpc" {
  id = "${var.peer_from_vpc_id}"
}

data "aws_vpc" "peer_to_vpc" {
  provider = "aws.peer"
  id       = "${var.peer_to_vpc_id}"
}
