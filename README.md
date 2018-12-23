aws\_vpc_peering terraform module
===========

A terraform module to provide a VPC peering from one VPC to another.

**Notes:**

- AWS does not support multi-region VPC peering; this will only work when both VPCs are within the same region.
- There must not be a CIDR block overlap between the two VPCs.
- Ensure that your VPCs have an appropriate "Name" tag


Module Input Variables
----------------------

- `peer_src_vpc_id`           - the VPC ID of the initiating VPC.
- `peer_dst_vpc_id`           - the VPC ID of the receiving VPC.
- `peer_src_route_tables`     - route tables of the initiating VPC to add routes to the receiving VPC for.
- `peer_dst_vpc_route_tables` - route tables of the receiving VPC to add routes to the initiating VPC for.
- `auto_accept`               - specify whether or not this connection should automatically be accepted


Usage
-----

```hcl
module "vpc_peering" {
  source = "github.com/thomasbiddle/tf_aws_vpc_peering"

  peer_src_vpc_id = "vpc-abcd1234"
  peer_dst_vpc_id = "vpc-abcd5678"
  
  peer_src_route_tables = ["rtb-xyz12345", "rtb-xyz54321", "rtb-xyz99999"]
  peer_dst_route_tables = ["rtb-abcd1234", "rtb-abcd5678"]
  
  auto_accept = true
}
```

Outputs
=======

 - `peering_connection_id` - the ID of the VPC Peering Connection.

Authors
=======

Originally created and maintained by [TJ Biddle](https://github.com/thomasbiddle)


License
=======

MIT Licensed. See LICENSE for full details.