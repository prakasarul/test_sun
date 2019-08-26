resource "aws_eip" "moonshot-nat" {
vpc      = true
}

resource "aws_nat_gateway" "moonshot-nat-gw" {
allocation_id = "${aws_eip.moonshot-nat.id}"
subnet_id = "${aws_subnet.moonshot-public.id}"
depends_on = ["aws_internet_gateway.moonshot-gw"]
}

resource "aws_route_table" "moonshot-private" {
    vpc_id = "${aws_vpc.moonshot.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.moonshot-nat-gw.id}"
    }

    tags {
        Name = "moonshot-private"
    }
}
# Terraform Training private routes
resource "aws_route_table_association" "moonshot-private-web" {
    subnet_id = "${aws_subnet.moonshot-private-web.id}"
    route_table_id = "${aws_route_table.moonshot-private.id}"
}
resource "aws_route_table_association" "moonshot-private-app" {
    subnet_id = "${aws_subnet.moonshot-private-app.id}"
    route_table_id = "${aws_route_table.moonshot-private.id}"
}
resource "aws_route_table_association" "moonshot-private-dbmaster" {
    subnet_id = "${aws_subnet.moonshot-private-dbmaster.id}"
    route_table_id = "${aws_route_table.moonshot-private.id}"
}
resource "aws_route_table_association" "moonshot-private-dbslave" {
    subnet_id = "${aws_subnet.moonshot-private-dbslave.id}"
    route_table_id = "${aws_route_table.moonshot-private.id}"
}
