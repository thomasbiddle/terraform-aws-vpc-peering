resource "aws_vpc_peering_connection" "default" {
  peer_vpc_id   = "${data.aws_vpc.peer_dst_vpc.id}"
  vpc_id        = "${data.aws_vpc.peer_src_vpc.id}"

  auto_accept = "${var.auto_accept}"

  tags = {
    Name    = "${var.peer_src_vpc_name} to ${var.peer_dst_vpc_name}"
    Comment = "Managed By Terraform"
  }
}
