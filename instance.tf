resource "aws_instance" "web" {
  ami             = "ami-0149b2da6ceec4bb0"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.key-tf.key_name
  security_groups = ["${aws_security_group.sg.id}"]
  subnet_id       = aws_subnet.mySubnet.id

  tags = {
    Name = "first-tf-instance"
  }
}