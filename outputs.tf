output "peering_connection_id" {
  value = "${aws_vpc_peering_connection.peer_from_vpc.id}"
}

output "peering_acceptor_id" {
  value = "${aws_vpc_peering_connection_accepter.peer_to_vpc.id}"
}
