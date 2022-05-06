resource "aws_subnet" "task-subnet-public-1" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "task-subnet-public-1"
    }
}
resource "aws_subnet" "task-subnet-public-2" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "task-subnet-public-1"
    }
}
resource "aws_subnet" "task-subnet-app-1" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "task-subnet-app-1"
    }
}
resource "aws_subnet" "task-subnet-app-2" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "task-subnet-app-2"
    }
}
resource "aws_subnet" "task-subnet-data-1" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "task-subnet-data-1"
    }
}
resource "aws_subnet" "task-subnet-data-2" {
    vpc_id = "${aws_vpc.task-vpc.id}"
    cidr_block = "10.0.6.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "task-subnet-data-2"
    }
}
