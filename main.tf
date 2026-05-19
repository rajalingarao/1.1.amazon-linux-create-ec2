resource "aws_key_pair" "mykey" {
  key_name   = "amazon-linux-key"
  public_key = file("~/.ssh/Amazon-image-key.pub")
}

resource "aws_instance" "amazon_linux_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  vpc_security_group_ids = var.security_group
  root_block_device {
    encrypted             = false
    volume_type           = "gp3"
    volume_size           = 80
    iops                  = 3000
    throughput            = 80
    delete_on_termination = true
  }
  tags = {
    Name = "Amazon-Linux-Server"
  }
}



