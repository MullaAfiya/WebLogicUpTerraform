
variable "user" {
  default = "ec2-user"  
}



#Master
resource "aws_instance" "WebLogicServer" { 
  ami           = "ami-09298640a92b2d12c"
  instance_type = "t2.micro"
  key_name = "Masterpem" 
 root_block_device {
    volume_size = 100  # Set the root volume size in GB
  }

  tags = {
    Name = "WebLogicServer"
  }  


  # File provisioners to copy files to the remote machine
  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/wls.loc"
    destination = "/tmp/wls.loc"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
    }
  
  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/wls.rsp"
    destination = "/tmp/wls.rsp"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
    }

#dynamic block - do rnd
  
  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/swap-file.sh"
    destination = "/tmp/swap-file.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }


  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/wget.sh"
    destination = "/tmp/wget.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/runweblogic.sh"
    destination = "/tmp/runweblogic.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/weblogicstart.sh"
    destination = "/tmp/weblogicstart.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/create-domain.py"
    destination = "/tmp/create-domain.py"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "/home/ec2-user/Project/WebLogicUpTerraform/install.sh"
    destination = "/tmp/install.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }


  # Remote-exec provisioner to execute a script on the remote machine
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "chmod +x /tmp/swap-file.sh",
      "chmod +x /tmp/wget.sh",
      "chmod +x /tmp/runweblogic.sh",
      "chmod +x /tmp/weblogicstart.sh",
      "/tmp/swap-file.sh",
      "sed -i 's/\r$//' /tmp/install.sh",
      "/tmp/install.sh",
      "/tmp/weblogicstart.sh"
    ]

    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Users/Afiya/Downloads/Masterpem.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  # Additional configuration for your instance goes here
}

