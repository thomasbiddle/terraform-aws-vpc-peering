aws\_vpc_peering terraform module
===========

A terraform module to provide a VPC peering from one VPC to another.

**Notes:**

- AWS does not support multi-region VPC peering; this will only work when both VPCs are within the same region.
- There must not be a CIDR block overlap between the two VPCs.


Module Input Variables
----------------------

- `peer_from_vpc_name` - name for the initiating VPC. This will be used in the Name tag.
- `peer_to_vpc_name` - name for the receiving VPC. This will be used in the Name tag.
- `peer_from_vpc_id` - the VPC ID of the initiating VPC.
- `peer_to_vpc_id` - the VPC ID of the receiving VPC.
- `peer_from_route_tables` - route tables of the initiating VPC to add routes to the receiving VPC for.
- `peer_to_route_tables` - route tables of the receiving VPC to add routes to the initiating VPC for.
- `peer_to_region` - The region of the VPC accepting the connection.
- `peer_to_profile` - The AWS profile credentials to use to accept the peer connection.
- `peer_to_credentials` - The location of the credentials file to use for accepting the connection.
- `auto_accept` - specify whether or not this connection should automatically be accepted


Usage
-----

```hcl
module "vpc_peering" {
  source = "github.com/thomasbiddle/tf_aws_vpc_peering"

  peer_from_vpc_name = "my-vpc"
  peer_to_vpc_name   = "my-other-vpc"
  
  peer_from_vpc_id = "vpc-abcd1234"
  peer_to_vpc_id   = "vpc-abcd5678"
  
  peer_from_route_tables   = ["rtb-xyz12345", "rtb-xyz54321", "rtb-xyz99999"]
  peer_to_route_tables     = ["rtb-abcd1234", "rtb-abcd5678"]

  peer_to_region            = "us-east-2"
  peer_to_credentials       = "~/.aws/creds"
  peer_to_profile           = "default"
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
