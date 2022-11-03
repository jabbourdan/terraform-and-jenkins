##private key
resource "tls_private_key" "newkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
  
  provisioner "local-exec" {
    command = " echo '{tls_private_key.newkey.private_key_pem}' > newkey.pem "
  }
##new key
}
resource "aws_key_pair" "newkey" {
  key_name   = "newkey"
  public_key = file("~/.ssh/id_rsa.pub")
}
