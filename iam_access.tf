resource "aws_iam_group" "readers" {
  name = "terraform-course-readers"
}

resource "aws_iam_policy_attachment" "readers_att" {
  # Policy for read only EC2
  name       = "terraform-course-readers-att"
  groups     = [aws_iam_group.readers.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_user" "user_reader_1" {
  name = "reader-1"
  tags = {
    Name = "terraform-course"
  }
}

resource "aws_iam_user" "user_reader_2" {
  name = "reader-2"
  tags = {
    Name = "terraform-course"
  }
}

resource "aws_iam_group_membership" "readers_users" {
  name = "readers-users"
  users = [
    aws_iam_user.user_reader_1.name,
    aws_iam_user.user_reader_2.name
  ]
  group = aws_iam_group.readers.name
}
