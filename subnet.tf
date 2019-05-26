# Subnets
resource "aws_subnet" "moonshot-public" {
    vpc_id = "${aws_vpc.moonshot.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "moonshot-public"
    }
}
resource "aws_subnet" "moonshot-private-web" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "moonshot-private-web"
    }
}
resource "aws_subnet" "moonshot-private-slave" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-south-1b"

    tags = {
        Name = "moonshot-private-slave"
    }
}
