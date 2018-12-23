# It would be awesome if we could get the route tables dynamically rather than have to be passed
# them (Which we can!) But unforunately we can't iterate over computed values - so we're
# stuck with this for now. It's being worked on.
resource "aws_route" "peer_src_to_peer_dst" {
  provider = "aws.src"
  count = "${length(var.peer_src_route_tables)}"

  route_table_id            = "${element(var.peer_src_route_tables, count.index)}"
  destination_cidr_block    = "${data.aws_vpc.peer_dst_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.default.id}"
}
resource "aws_route" "peer_dst_to_peer_src" {
  provider = "aws.dst"
  count = "${length(var.peer_dst_route_tables)}"

  route_table_id            = "${element(var.peer_dst_route_tables, count.index)}"
  destination_cidr_block    = "${data.aws_vpc.peer_src_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.default.id}"
}
