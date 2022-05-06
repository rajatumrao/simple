resource "aws_eip" "task-eip" {
    vpc = true
    depends_on = [aws_internet_gateway.task-igw]
}

resource "aws_nat_gateway" "task-nat" {
    allocation_id = "${aws_eip.task-eip.id}"
    subnet_id = "${aws_subnet.task-subnet-public-1.id}"
    depends_on = [aws_internet_gateway.task-igw]
}

resource "aws_route_table" "task-private-route" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.task-nat.id}"
    }
    tags = {
        Name = "task-private-route"
    }
}

resource "aws_route_table_association" "task-route-app-subnet-1"{
    depends_on = [aws_subnet.task-subnet-app-1]
    subnet_id = "${aws_subnet.task-subnet-app-1.id}"
    route_table_id = "${aws_route_table.task-private-route.id}"
}

resource "aws_route_table_association" "task-route-app-subnet-2"{
    depends_on = [aws_subnet.task-subnet-app-2]
    subnet_id = "${aws_subnet.task-subnet-app-2.id}"
    route_table_id = "${aws_route_table.task-private-route.id}"
}

resource "aws_route_table_association" "task-route-data-subnet-1"{
    depends_on = [aws_subnet.task-subnet-data-1]
    subnet_id = "${aws_subnet.task-subnet-data-1.id}"
    route_table_id = "${aws_route_table.task-private-route.id}"
}

resource "aws_route_table_association" "task-route-data-subnet-2"{
    depends_on = [aws_subnet.task-subnet-data-2]
    subnet_id = "${aws_subnet.task-subnet-data-2.id}"
    route_table_id = "${aws_route_table.task-private-route.id}"
}

