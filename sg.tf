# Security group

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow SG inbound traffic"
  vpc_id      = aws_vpc.myVpc.id

  dynamic "ingress" {
    for_each = [22,80,443,27017]
    iterator = port
    content {
    description      = "TLS from VPC"
    from_port        = port.value
    to_port          = port.value 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  }
  
    egress {
    description      = "TLS from VPC"
    from_port        = 0 # all ports 
    to_port          = 0 # all ports
    protocol         = "-1"  # all traffic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = [ "::/0" ]

    }
  
}