resource "aws_security_group" "worker_thornode" {
  name_prefix = "thornode-sg-"
  vpc_id      = module.vpc.vpc_id
  description = "THORNode security group to allow external access to services"

  ingress {
    description = "THORNode Testnet P2P"
    from_port = 26656
    to_port   = 26656
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "THORNode Testnet RPC"
    from_port = 26657
    to_port   = 26657
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "THORNode Mainnet P2P"
    from_port = 27146
    to_port   = 27146
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "THORNode Mainnet RPC"
    from_port = 27147
    to_port   = 27147
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "Bifrost P2P"
    from_port = 5040
    to_port   = 5040
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "Bifrost API"
    from_port = 6040
    to_port   = 6040
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "THORNode API"
    from_port = 1317
    to_port   = 1317
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "Midgard"
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "thornode-sg"
  }
}
