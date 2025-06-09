````markdown
# AWS EC2 Deployment with Terraform

This project uses **Terraform** to provision an **Amazon EC2 instance** along with a **Security Group** that allows SSH and HTTP access. It also installs Java, clones a GitHub repository, builds a Spring Boot application, and runs it on startup.

## 📁 Project Structure

- **Provider Configuration**: Specifies the AWS region.
- **Security Group**: Allows inbound traffic on ports 22 (SSH) and 80 (HTTP).
- **EC2 Instance**:
  - Uses an Ubuntu-based AMI.
  - Installs OpenJDK 21 and Git.
  - Clones the `techeazy-devops` repository.
  - Builds and runs the Spring Boot application.

---

## 🚀 Resources Created

1. **Security Group**:
   - Name: `allow_web_ssh`
   - Ingress Rules:
     - Port 22 (SSH): Open to all (⚠️ For production, limit access)
     - Port 80 (HTTP): Open to all

2. **EC2 Instance**:
   - Type: `t2.micro`
   - AMI: `ami-0731becbf832f281e` (Ubuntu-based)
   - Key Pair: `Terraform` (You must have this key created in AWS)
   - VPC and Subnet must exist beforehand
   - Starts Spring Boot app on launch

---

## 🔧 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate permissions
- An existing VPC and Subnet in `us-east-1`
- A valid EC2 key pair named `Terraform`

---

## 🛠️ How to Use

1. Clone this repository or copy the Terraform files.
2. Initialize Terraform:

   ```bash
   terraform init
````

3. Review the execution plan:

   ```bash
   terraform plan
   ```

4. Apply the configuration:

   ```bash
   terraform apply
   ```

5. After deployment, Terraform will output the **public IP address** of the instance.

---

## 📎 Notes

* **AMI**: Ensure the AMI ID (`ami-0731becbf832f281e`) is valid in the selected region.
* **Security**: Opening SSH to `0.0.0.0/0` is insecure for production. Limit access to known IPs.
* **Project Source**: The Spring Boot application is cloned from [techeazy-devops GitHub repo](https://github.com/techeazy-consulting/techeazy-devops).

---

## 📤 Outputs

* `public_ip`: The public IP of the EC2 instance where the app is accessible.

---

## 👨‍💻 Author

* **Swaraj**
* Internship Project for **TechEazy Consulting**

---

## 📜 License

This project is for educational and internal use. Please consult the original GitHub repository license if reusing application code.

```

---

Let me know if you'd like this saved as a file or tailored further for a specific audience like team members or recruiters.
```
