resource "aws_efs_file_system" "webdata_efs" {
  tags {
    Name            = "Web_Data_EFS"
  }
}

resource "aws_efs_file_system" "appdata_efs" {
  tags {
    Name            = "App_Data_EFS"
  }
}
