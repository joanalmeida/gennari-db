CREATE DATABASE Gennari;
GO
USE Gennari;
GO
CREATE TABLE Image
(
	id int identity
		primary key,
	image varbinary(max)
)
GO
CREATE TABLE Category
(
	code varchar(30) not null
		primary key,
	name varchar(30),
	image int
		constraint FK_CATEGORY_IMAGE
			references Image
)
GO
CREATE TABLE Product
(
	id int identity
		primary key,
	name varchar(50),
	description varchar(100),
	price money,
	quantity int,
	image int
		constraint FK_PRODUCT_IMAGE
			references Image,
	size varchar(10),
	category varchar(30)
		constraint FK_PRODUCT_CATEGORY
			references Category,
	highlight bit
)
GO
CREATE TABLE Address
(
    id int identity
		primary key,
	city varchar(50),
	street varchar(50),
	street_number varchar(10),
	floor varchar(20),
	postal_code varchar(10)
)
GO
CREATE TABLE PurchaseOrder
(
    id varchar(36) primary key,
	payment_id varchar(46),
	status varchar(20),
	address int
		constraint FK_ORDER_ADDRESS
			references Address,
	phone varchar(15),
	email varchar(50),
	created_at smalldatetime
)
GO
CREATE TABLE OrderItem
(
    id int identity
        primary key,
    purchase_order varchar(36)
        constraint FK_PURCHASE_ORDER
            references PurchaseOrder,
    product int
        constraint FK_PRODUCT
            references Product,
    quantity int,
    price money
)
GO

