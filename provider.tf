# creating ssh key

resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
    value = "${aws_key_pair.key-tf.key_name}"
}




provider aws {
region = "us-east-1"
access_key = "AKIAVKAJ6GZQLBJWMX6V"
secret_key = "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"
 }