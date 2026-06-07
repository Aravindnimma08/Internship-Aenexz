show databases;
use task7_db;

create table Customers (
    CustomerID int primary key,
    CustomerName varchar(100) not null,
    Email varchar(100),
    Phone varchar(15),
    City varchar(50)
);
 
create table Orders (
    OrderID int primary key,
    CustomerID int,
    OrderDate date,
    Amount decimal(10, 2),
    foreign key (CustomerID) references Customers(CustomerID));
    
    desc Customers;
    desc Orders;
    
insert into Customers (CustomerID, CustomerName, Email, Phone, City) values
(5, 'John Doe', 'john@email.com', '1234567890', 'Hyderabad'),
(6, 'Jane Smith', 'jane@email.com', '0987654321', 'Mumbai'),
(7, 'Rahul Kumar', 'rahul@email.com', '1122334455', 'Delhi'),
(9, 'Priya Reddy', 'priya@email.com', '6677889900', 'Bangalore');

insert into Orders (OrderID, CustomerID, OrderDate, Amount) values
(105, 5, '2026-01-15', 500.00),
(106, 5, '2026-02-20', 750.00),
(107, 6, '2026-03-10', 300.00),
(108, 7, '2026-04-05', 1200.00);

select * from Customers;
select * from Orders;

select c.CustomerID, c.CustomerName, o.OrderID from Customers c inner join Orders o on c.CustomerID = o.CustomerID;
select c.CustomerID, c.CustomerName, o.OrderID from Customers c left join Orders o on c.CustomerID = o.CustomerID;

insert into Orders (OrderID, CustomerID) values (103, 4);

insert into Customers (CustomerID, CustomerName, Email, Phone, City) 
values (4, 'aravind', 'aravind@email.com', '1234567890', 'Hyderabad');

insert into Orders (OrderID, CustomerID) values (103, 4);

select * from Orders;

select o.OrderID, o.CustomerID from Orders o left join Customers c on o.CustomerID = c.CustomerID where c.CustomerID is null;

select c.CustomerID, c.CustomerName, o.OrderID from Customers c left join Orders o on c.CustomerID = o.CustomerID union select c.CustomerID, c.CustomerName, o.OrderID from Customers c
right join Orders o on c.CustomerID = o.CustomerID;

insert into Orders (OrderID, CustomerID) values (104, 1);

select * from Customers;

insert into Customers (CustomerID, CustomerName, Email, Phone, City) 
values (1, 'kane', 'kane@email.com', '8234567890', 'Tripura');

select * from Customers;

insert into Orders (OrderID, CustomerID) values (104, 1);
select * from Orders;

select c.CustomerID, c.CustomerName, COUNT(o.OrderID) as TotalOrders from Customers c left join Orders o on c.CustomerID = o.CustomerID group by c.CustomerID, c.CustomerName
order by c.CustomerID;

select * from Customers;
select * from Orders;
