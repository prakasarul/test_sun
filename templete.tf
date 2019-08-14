resource "template_file" "user_data" {
  template = "efs_mount.tpl"
  lifecycle {
    create_before_destroy = true
  }
}
