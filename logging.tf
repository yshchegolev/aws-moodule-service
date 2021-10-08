resource "aws_cloudwatch_log_group" "main" {
  name = var.project_name
  tags = var.aws_tags
}

data "aws_elb_service_account" "main" {}

resource "aws_s3_bucket" "project_lb_logs" {
  bucket = "${var.project_name}-lb-logs"
  versioning {
    enabled = false
  }
}
resource "aws_s3_bucket_policy" "project_lb_logs_policy" {
  bucket = aws_s3_bucket.project_lb_logs.id

  policy = jsonencode({
    "Id" : "${var.project_name}-s3-policy-id",
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "${var.project_name}-s3p-stmt",
        "Action" : ["s3:PutObject"],
        "Effect" : "Allow",
        "Resource" : "arn:aws:s3:::${aws_s3_bucket.project_lb_logs.bucket}/*",
        "Principal" : {
          "AWS" : [data.aws_elb_service_account.main.arn]
        }
      }
    ]
  })
}