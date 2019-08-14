resource "template_file" "user_data_web" {
  template = "efs_web_mount.tpl"
  lifecycle {
    create_before_destroy = true
  }
}

resource "template_file" "user_data_app" {
  template = "efs_app_mount.tpl"
  lifecycle {
    create_before_destroy = true
  }
}
