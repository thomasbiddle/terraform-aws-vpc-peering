# It would be awesome if we could get the route tables dynamically rather than have to be passed
# them (Which we can!) But unforunately we can't iterate over computed values - so we're
# stuck with this for now. It's being worked on.
resource "aws_route" "peer_from_to_peer_to" {
  count = "${length(var.peer_from_route_tables)}"

  route_table_id            = "${element(var.peer_from_route_tables, count.index)}"
  destination_cidr_block    = "${data.aws_vpc.peer_to_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peer_from_vpc.id}"
}
resource "aws_route" "peer_to_to_peer_from" {
  count = "${length(var.peer_to_route_tables)}"

  provider                  = "aws.peer"
  route_table_id            = "${element(var.peer_to_route_tables, count.index)}"
  destination_cidr_block    = "${data.aws_vpc.peer_from_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection_accepter.peer_to_vpc.id}"
}
