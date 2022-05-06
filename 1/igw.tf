resource "aws_internet_gateway" "task-igw" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    tags = {
        Name = "task-igw"
    }
}	

resource "aws_route_table" "task-public-route" {
    vpc_id = "${aws_vpc.task-vpc.id}"   
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.task-igw.id}" 
    }
    tags = {
        Name = "task-public-route"
    }
}

resource "aws_route_table_association" "task-route-public-subnet-1"{
    depends_on = [aws_subnet.task-subnet-public-1]
    subnet_id = "${aws_subnet.task-subnet-public-1.id}"
    route_table_id = "${aws_route_table.task-public-route.id}"
}

resource "aws_route_table_association" "task-route-public-subnet-2"{
    depends_on = [aws_subnet.task-subnet-public-2]
    subnet_id = "${aws_subnet.task-subnet-public-2.id}"
    route_table_id = "${aws_route_table.task-public-route.id}"
}
