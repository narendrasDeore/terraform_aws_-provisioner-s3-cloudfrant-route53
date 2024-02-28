resource "null_resource" "copy_to_s3" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     = <<-EOT
      aws s3 cp "C:\\Users\\91888\\OneDrive\\Desktop\\DevOps\\terraform\\static web hosting\\app" s3://${var.bucket_name}/ --recursive
    EOT
    interpreter = ["PowerShell", "-Command"]
  }
}
