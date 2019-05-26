# route tables
resource "aws_route_table" "moonshot-public" {
    vpc_id = "${aws_vpc.moonshot.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.moonshot-gw.id}"
    }

    tags {
        Name = "moonshot-public"
    }
}

# route associations public
resource "aws_route_table_association" "moonshot-public" {
    subnet_id = "${aws_subnet.moonshot-public.id}"
    route_table_id = "${aws_route_table.moonshot-public.id}"
}
