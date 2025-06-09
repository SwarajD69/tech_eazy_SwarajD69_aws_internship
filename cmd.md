terraform init
terraform plan
terraform apply

# for delete

terraform destroy


# AWS info


us-east-1


AMI ID : ami-0731becbf832f281e

t2.micro

vpc-0f174e7abf4e163f4


# java program run 

  user_data = <<-EOF
              #!/bin/bash
              cd /home/ubuntu
              sudo apt-get update -y
              sudo apt install -y openjdk-21-jdk git
              git clone https://github.com/techeazy-consulting/techeazy-devops.git
              cd techeazy-devops/
              sudo chmod +x mvnw
              sudo ./mvnw clean install
              sudo nohup ./mvnw spring-boot:run > output.log 2>&1 &
              EOF

# to delete java application processe 
ps aux | grep spring-boot:run
swaraj     17321  0.0  1.9 5446084 141892 ? 
kill 17321
