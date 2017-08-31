variable "peer_from_vpc_name" {
  type = "string"

  description = "Name for the peer_from VPC."
}

variable "peer_from_vpc_id" {
  type = "string"

  description = "The VPC to peer from."
}

variable "peer_from_route_tables" {
  type = "list"

  description = "List of route tables from the peer_from VPC"
}

variable "peer_to_vpc_name" {
  type = "string"

  description = "Name for the peer_to VPC."
}

variable "peer_to_vpc_id" {
  type = "string"

  description = "The VPC ID to peer to."
}

variable "peer_to_route_tables" {
  type = "list"

  description = "List of route tables from the peer to VPC."
}
