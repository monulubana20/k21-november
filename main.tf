  resource "aws_eip" "name" {
  tags = {
    name = "akhil-eip"
  }
}

resource "aws_s3_bucket" "myname" {
  bucket = "${var.buck-name}-buck-21"
  depends_on = [ aws_instance.myname ]
}

output "s3id" {
  value = aws_s3_bucket.myname.id
}

variable "buck-name" {
  default = "buck-var-k21"
  #description = "Please enter S3 bucket name"
}

resource "aws_instance" "myname" {
    depends_on = [ aws_eip.name ]
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"

  tags = {

    Name = "mandeep-instance"
  }
}
