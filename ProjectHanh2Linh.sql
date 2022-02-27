CREATE DATABASE doan;
USE doan;

create table Employee(
employee_id varchar(10) primary key not null,
employee_name varchar(50),
dayofbirth date,
employee_address varchar(50),
employee_phone varchar(20),
hired_date date,
check(hired_date < now()),
Salary_ID varchar(10),
job_id varchar(10));

insert into Employee
values ('GD1','Nguyễn Anh Tuấn','1991-4-4','Đà Nẵng','0912873549','2013-2-10','001','GĐ'),
('BH1','Nguyễn Thị Mỹ Hằng','2000-3-12','Quảng Trị','0978924684','2020-3-15','002','BH'),
('BH2','Nguyễn Minh Khang','1999-11-20','Đà Nẵng','0984531280','2019-6-20','002','BH'),
('VS1','Lê Thị Hoa','1885-7-26','Quảng Nam','0846202579','2000-6-17','003','VS'),
('VS2','Hoàng Văn Toàn','1889-2-18','KonTum','0964252158','2001-2-16','003','VS'),
('BV1','Lê Văn Chiến','1886-6-22','Đăk Lăk','0872649213','2003-6-5','004','BV');

create table Job(
job_id varchar(10) primary key not null,
job_name varchar(50));

insert into Job
values ('GĐ','Giám đốc'),
('BH','Bán hàng'),
('VS','Vệ sinh'),
('BV','Bảo vệ');

create table Salary(
salary_id varchar(10) primary key not null,
job_id varchar(10),
foreign key(job_id) references Job(job_id),
salary decimal(10,2));

insert into Salary
values('001','GĐ','2000'),
('002','BH','1000'),
('003','VS','1500'),
('004','BV','1000');
-- -----------------------------------------------------------------------------------------------

create table Orders(
orders_id varchar(10) primary key not null,
orders_date date,
customer_id varchar(10),
employee_id varchar(10),
foreign key (employee_id) references Employee(employee_id));

Insert into Orders
values ('O1','2019-2-10','C1','BH1'),
('O2','2020-3-20','C2','BH2'),
('O3','2019-2-10','C3','BH2'),
('O4','2021-4-27','C4','BH1'),
('O5','2019-4-1','C5','BH1');

create table Customer(
customer_id varchar(10) primary key not null,
customer_name varchar(50),
customer_address varchar(50),
customer_phone varchar(20),
orders_id varchar(10),
foreign key (orders_id) references Orders(orders_id));

insert into Customer
values('C1','Nguyễn Thiện Ân','Hà Nội','0397531689','O1'),
('C2','Đoàn Ngọc Anh','Hải Phòng','0972159713','O2'),
('C3','Nguyễn Thái Linh','Quảng Bình','0753186214','O3'),
('C4','Hoàng Tuệ Nga','Nghệ An','0975213641','O4'),
('C5','Hoàng Mai Hoa','Kon Tum','0759234562','O5');


create table Author(
author_id varchar(10) primary key not null,
author_name varchar(50));

Insert into Author
values('A1','Fujiko Fujio'),
('A2','Nguyễn Văn A'),
('A3','Nguyễn Nhật Ánh'),
('A4','Nguyễn Văn B'),
('A5','Antoine');

create table Category(
category_id varchar(10) primary key not null,
category_name varchar(50));

insert into Category
values ('C1','Truyện tranh'),
('C2','Tham khảo'),
('C3','Tiểu thuyết'),
('C4','Giáo khoa');

create table Supplier(
supplier_id varchar(10) primary key not null,
supplier_name varchar(50),
supplier_address varchar(50),
supplier_phone varchar(20));

insert into Supplier
values('S1','Hoàng Anh','Kon Tum','0875621423'),
('S2','ABC Books','Đăk Lăk','0722314796'),
('S3','Sách Ánh','Quảng Nam','0954230147'),
('S4','Nam Long','Đà Nẵng','0921247830');


-- -----------------------------------------------------------------------------------------------


create table Publishing_Company(
pc_id varchar(10) primary key not null,
pc_name varchar(50),
pc_address varchar(50),
pc_email varchar(50));

insert into Publishing_Company
values ('KĐ1','Kim Đồng','Hà Nội','kimdong@gmail.com'),
('T2','Trẻ','Đà Nẵng','nxbtre@gmail.com'),
('PN3','Phương Nam','Hồ Chí Minh','phuongnam@gmail.com');


create table Book(
book_id varchar(10)primary key not null,
book_name varchar(50),
author_id varchar(10),
foreign key (author_id) references Author(author_id),
category_id varchar(10),
foreign key (category_id) references Category(category_id),
pc_id varchar(10),
foreign key (pc_id) references Publishing_Company(pc_id),
publishing_date date);

insert into Book
values('TT1','Doremon','A1','C1','KĐ1','1973-9-30'),
('TK2','Giải toán lớp 6','A2','C2','KĐ1','1990-5-20'),
('T3','Tôi thấy hoa vàng trên cỏ xanh','A3','C3','T2','2010-12-9'),
('GK4','Toán 6','A4','C4','PN3','2005-6-15'),
('T5','Hoàng Tử Bé','A5','C3','PN3','1943-3-17');

create table CT_Order(
orders_id varchar(10) ,
foreign key (orders_id) references Orders(orders_id),
book_id varchar(10),
foreign key (book_id) references Book(book_id),
orders_amount int,
orders_price decimal(10,2));

insert into CT_Order
values('O1','TT1','2','10'),
('O2','TT1','1','20'),
('O3','T3','3','15'),
('O4','GK4','1','20'),
('O5','T5','4','17');
-- -----------------------------------------------------------------------------------------------










create table Goods_Receipt(
gr_id varchar(10) primary key not null,
employee_id varchar(10),
foreign key (employee_id) references Employee(employee_id),
supplier_id varchar(10),
foreign key (supplier_id) references Supplier(supplier_id),
gr_date date);

insert into Goods_Receipt
values ('GR1','BH2','S1','2021-2-10'),
('GR2','BH2','S1','2020-6-3'),
('GR3','BH2','S1','2016-3-10'),
('GR4','GD1','S4','2019-5-12'),
('GR5','BH1','S1','2019-5-13');

-- -----------------------------------------------------------------------------------------------


create table CT_Goods_Receipt(
gr_id varchar(10),
foreign key (gr_id) references goods_receipt(gr_id),
book_id varchar(10) not null,
foreign key(book_id) references Book(book_id),
gr_amount int,
gr_price decimal(10,2));

insert into CT_Goods_Receipt
values ('GR1','TT1','2','100'),
('GR2','TK2','4','150'),
('GR3','T3','6','200'),
('GR4','GK4','3','150'),
('GR5','T5','5','160');
-- -----------------------------------------------------------------------------------------------
