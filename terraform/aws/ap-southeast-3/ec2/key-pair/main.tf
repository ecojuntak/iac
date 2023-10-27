resource "aws_key_pair" "cappyhoding" {
  key_name   = "cappyhoding"
  public_key = file("~/.ssh/personal_rsa.pub")
}
