/*locals {
  connection = {
    type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)

  }

}

*/


variable "user" {
  default = "ec2-user"  
}



#Master
resource "aws_instance" "Master1" { 
  ami           = "ami-09298640a92b2d12c"
  instance_type = "t3.medium"
  key_name = "oracleweblogickey" 
 root_block_device {
    volume_size = 100  # Set the root volume size in GB
  }

  tags = {
    Name = "Master1"
  }  


  # File provisioners to copy files to the remote machine
  provisioner "file" {
    source      = "C:/Terraform/create-domain/wls.loc"
    destination = "/tmp/wls.loc"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
    }
  
  provisioner "file" {
    source      = "C:/Terraform/create-domain/wls.rsp"
    destination = "/tmp/wls.rsp"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
    }

#dynamic block - do rnd
  
  provisioner "file" {
    source      = "C:/Terraform/create-domain/swap-file.sh"
    destination = "/tmp/swap-file.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }


  provisioner "file" {
    source      = "C:/Terraform/create-domain/wget.sh"
    destination = "/tmp/wget.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "C:/Terraform/create-domain/runweblogic.sh"
    destination = "/tmp/runweblogic.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "C:/Terraform/create-domain/weblogicstart.sh"
    destination = "/tmp/weblogicstart.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "C:/Terraform/create-domain/create-domain.py"
    destination = "/tmp/create-domain.py"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  provisioner "file" {
    source      = "C:/Terraform/create-domain/install.sh"
    destination = "/tmp/install.sh"
    connection {
      type        = "ssh"
      user        = var.user  # Update for your AMI's default user
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
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
      private_key = file("C:/Terraform/create-domain/oracleweblogickey.pem")
      host        = self.public_ip  # 'self' refers to the current resource (aws_instance.weblogic_instance)
    }
  }

  # Additional configuration for your instance goes here
}

