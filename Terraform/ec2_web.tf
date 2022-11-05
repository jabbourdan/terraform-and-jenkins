// ec2 for web app
resource "aws_instance" "jaboor2" {
  ami                         = "ami-0d593311db5abb72b"
  instance_type               = "t2.micro"
  availability_zone           = "us-west-2a"
  key_name                    = "newkey"
  vpc_security_group_ids      = [aws_security_group.sg_web.id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  user_data = "${file("user_data.sh")}"

  tags = {
    "Name" = "web"
  }
}