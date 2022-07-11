provider "aws" {
        region     = "us-west-1"
}

resource "aws_instance" "website01-dev" {
        ami = "ami-053ac55bdcfe96e85"
        instance_type = "t2.medium"
        key_name = "jai-wsl2-key"
        security_groups = ["launch-wizard-174"]
         
        user_data = <<EOF
#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo apt-get install -y git
sudo rm -vrf /var/www/html
sudo git clone https://github.com/Jaibw/FrozenYogurtShop.git /var/www/html
sudo systemctl start nginx
sudo systemctl enable nginx
        EOF
        tags = {
                Name = "Website01-DEV"
        }
}

output "testserver" {
  value = "${aws_instance.website01-dev.public_ip}"
}
