data "aws_vpc" "peer_src_vpc" {
  provider = aws.src
  id       = var.peer_src_vpc_id
}

data "aws_vpc" "peer_dst_vpc" {
  provider = aws.dst
  id       = var.peer_dst_vpc_id
}

data "aws_region" "dst_vpc" {
  provider = aws.dst
}

