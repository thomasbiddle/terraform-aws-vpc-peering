resource "aws_vpc_peering_connection" "peer_from_to_peer_to_vpc" {
  peer_vpc_id   = "${data.aws_vpc.peer_to_vpc.id}"
  vpc_id        = "${data.aws_vpc.peer_from_vpc.id}"

  auto_accept = true

  tags = {
    Name    = "${var.peer_from_vpc_name} to ${var.peer_to_vpc_name}"
    Comment = "Managed By Terraform"
  }
}
