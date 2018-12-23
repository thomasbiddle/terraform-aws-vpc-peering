data "aws_vpc" "peer_src_vpc" {
  id = "${var.peer_src_vpc_id}"
}

data "aws_vpc" "peer_dst_vpc" {
  id = "${var.peer_dst_vpc_id}"
}
