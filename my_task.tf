provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_s3_bucket" "deep" {
  bucket = "s3-chernak"
  acl    = "private"
}

resource "aws_instance" "instance1" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  depends_on = ["aws_s3_bucket.deep"]


provisioner "local-exec" {
   command = "echo ${aws_instance.instance1.public_ip} >> ip_address.txt"
   on_failure = "continue"
   }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.instance1.id}"

provisioner "local-exec" {
   command = "echo ${aws_eip.ip.public_ip} >> ip_address.txt"
   on_failure = "continue"
   }

}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}

output "instance1" {
  value = "${aws_instance.instance1.public_ip}"
}

