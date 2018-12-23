resource "aws_vpc_peering_connection" "default" {
  provider = "aws.src"
  peer_vpc_id   = "${data.aws_vpc.peer_dst_vpc.id}"
  vpc_id        = "${data.aws_vpc.peer_src_vpc.id}"

  peer_region = "${data.aws_region.dst_vpc.name}"

  auto_accept = "${var.auto_accept}"

  tags = {
    # A bit opinionated here, but this will fail without a Name tag. Seems like a good practice to have anyhow.
    Name    = "${data.aws_vpc.peer_src_vpc.tags["Name"]} to ${data.aws_vpc.peer_dst_vpc.tags["Name"]}"
    Comment = "Managed By Terraform"
  }
}
