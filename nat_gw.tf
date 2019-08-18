resource "aws_nat_gateway" "nat" {
    subnet_id = "${aws_subnet.moonshot-private-web.id}"
    depends_on = ["aws_internet_gateway.moonshot-gw"]
}
