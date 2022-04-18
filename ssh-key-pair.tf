resource "aws_key_pair" "terraform_course" {
  key_name   = "terraform-course-key"
  public_key = file("${path.module}/keys/terraform-course.pem.pub")
  tags = {
    Name = "terraform-course"
    type = "ed25519"
  }
}
