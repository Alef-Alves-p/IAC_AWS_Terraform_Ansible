terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

#Create an Instance
resource "aws_instance" "app_server" {
  ami           = "ami-0e001c9271cf7f3b9"
  instance_type = "t2.micro"
  key_name      = "iac_terraform_ansible"
  # Aqui foi feito a adição do comando #cloud-config pois apenas com essa alteração
  #foi possivel a sobrescrição do arquivo html dentro da instância
  #user_data = <<-EOF
  ##cloud-config 
  #runcmd:
  #  - cd /home/ubuntu
  #  - echo "<h1>Testando Terraform no WSL ubuntu</h1>" > index.html
  #  - nohup busybox httpd -f -p 8080 &
  #EOF

  tags = {
    Name = "AWS Ansible Python"
  }
}
