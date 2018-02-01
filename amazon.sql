drop database nbad;
create database nbad;
use nbad;
show tables;

#login details
create table login
 (
 custid int  not null primary key auto_increment,
 pswd varchar(20) not null,
 first_name varchar(20) not null,
 last_name varchar(20) not null,
 contact_no varchar(10),
 address varchar(50),
 card_no varchar(20)
 );




select * from login;

insert into login (custid,pswd, first_name, last_name, contact_no, address,  card_no)values(1001,"pass","likhith","chinnam","9803193433","Hyderabad","9802 3276 1258");
insert into login (pswd, first_name, last_name, contact_no, address,  card_no) values("pass","chinnam","likhith","9803193444","Hyderabad","9802 3256 1258");
insert into login (pswd, first_name, last_name, contact_no, address,  card_no) values("pass","yaswanth","Mulakala","9803193439","Banglore","9802 3452 1248 1245");
insert into login (pswd, first_name, last_name, contact_no, address,  card_no) values("pass","uday","kumar","9803193438","Chennai","9802 3259 1228 2548");
insert into login (pswd, first_name, last_name, contact_no, address,  card_no) values("pass","Teja","Yadagani","9803193438","Chennai","9802 3259 1228 6987");
insert into login (pswd, first_name, last_name, contact_no, address,  card_no) values("pass","Teja2","Yadagani2","9803193438","Chennai","9802 3259 1228 6987");

select pswd, first_name, last_name, contact_no, address, card_no from login where custid='1001';
select pswd, first_name, last_name, contact_no, address, card_no from login where custid='?';


#category
create table category(
cat_id int primary key not null auto_increment,
cat_name varchar(20),
cat_desc varchar(50)
);












insert into category (cat_name, cat_desc) values ('Dog','Food, Cannel, Toys, Clothes of Dog');
insert into category (cat_name, cat_desc) values ('Cat','Food, Toys, Clothes of Cat');
insert into category (cat_name, cat_desc) values ('Horse','Food, Horse Shoe, etc of Horse');
insert into category (cat_name, cat_desc) values ('Rabbit','Food, cage of Rabbit');
insert into category (cat_name, cat_desc) values ('Fish','Food, Toys, Aquarium of Fish');

select * from category;


#product
create table product(
prod_id int primary key not null auto_increment,
cat_id int not null,
prod_name varchar(20),
prod_desc varchar(50),
constraint fk_prodcat foreign key (cat_id) references category(cat_id)

);



insert into product (cat_id,prod_name,prod_desc) values (1,'pedigree','Highly Nutritious Food for the dogs');
insert into product (cat_id,prod_name,prod_desc) values (1,'cananel','A must have shelter for the dogs');
insert into product (cat_id,prod_name,prod_desc) values (1,'belt','High Quality and long belt for dogs');
insert into product (cat_id,prod_name,prod_desc) values (2,'Food','Highly Nutritious Food for the cats');
insert into product (cat_id,prod_name,prod_desc) values (2,'Food Combo','Combo for cats');
insert into product (cat_id,prod_name,prod_desc) values (2,'Cat Toy','Kitty Toy for cats');
insert into product (cat_id,prod_name,prod_desc) values (3,'Horse Food','Highly Nutritious Grass for the Horses');
insert into product (cat_id,prod_name,prod_desc) values (3,'Horse Sack','A must have Sack for the Horses');
insert into product (cat_id,prod_name,prod_desc) values (3,'belt','High Quality and long belt for Horses');
insert into product (cat_id,prod_name,prod_desc) values (4,'Carrots','Highly Nutritious Food for the Rabbits');
insert into product (cat_id,prod_name,prod_desc) values (4,'Cage','A must have shelter for the Rabbits');
insert into product (cat_id,prod_name,prod_desc) values (4,'Toys','Bunny Toys');
insert into product (cat_id,prod_name,prod_desc) values (5,'Grains','Highly Nutritious Food for the Fish');
insert into product (cat_id,prod_name,prod_desc) values (5,'Aquariums','A must have shelter for the Fish');
insert into product (cat_id,prod_name,prod_desc) values (5,'Aquarium Toys','toys for Fish');




SET SQL_SAFE_UPDATES=0;


create table product_line_items(
item_id int  primary key auto_increment,
prod_id int not null,
cat_id int not null,
item_name varchar(20),
item_desc varchar(50),
price float,
constraint fk_itemprd foreign key (prod_id) references product(prod_id),
constraint fk_prdcat foreign key (cat_id) references category(cat_id)
);



insert into product_line_items (prod_id, cat_id, item_name, item_desc, price) values (1, 1, 'pedigree 1','Food for the dogs', 45.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (1, 1, 'pedigree 2','Food for the dogs', 55.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (1, 1,'pedigree 3','Food for the dogs', 65.87);
insert into product_line_items (prod_id, cat_id, item_name, item_desc, price) values (2, 1, 'cananel','shelter for the dogs', 85.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (3, 1, 'belt','belt for the dogs', 55.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (4, 2,'food','Food for the cats', 65.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (5, 2,'food combo','combo for cats', 85.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (6, 2,'cat toy','kitty toy for cats', 25.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (7, 3,'Horse Food','Highly Nutritious Grass for the Horses', 105.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (8, 3,'Horse Sack','A must have Sack for the Horses', 85.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (9, 3,'belt','High Quality and long belt for Horse', 225.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (10, 4,'Carrots','Highly Nutritious Food for the Rabbits', 25.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (11, 4,'Cage','A must have shelter for the Rabbits', 35.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (12, 4,'Toys','Bunny Toys', 45.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (13, 5,'Grains','Highly Nutritious Food for the Fish', 15.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (14, 5,'Aquariums','A must have shelter for the Fish', 65.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (15, 5,'Aquarium Toys','High Quality food for Fish', 25.87);


#set2
insert into product_line_items (prod_id, cat_id, item_name, item_desc, price) values (2, 1, 'cananel 2','shelter for the dogs', 85.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (3, 1, 'belt 2','belt for the dogs', 55.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (4, 2,'food 2','Food for the cats', 65.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (5, 2,'food combo 2','combo for cats', 85.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (6, 2,'cat toy 2','kitty toy for cats', 25.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (7, 3,'Horse Food 2','Highly Nutritious Grass for the Horses', 105.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (8, 3,'Horse Sack 2','A must have Sack for the Horses', 85.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (9, 3,'belt','High Quality and long belt for Horse type 2', 225.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (10, 4,'Carrots','Highly Nutritious Food for the Rabbits 2', 25.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (11, 4,'Cage','A must have shelter for the Rabbits 2', 35.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (12, 4,'Toys','Bunny Toys 2', 45.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (13, 5,'Grains','Highly Nutritious Food for the Fish 2', 15.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (14, 5,'Aquariums','A must have shelter for the Fish 2', 65.87);
insert into product_line_items (prod_id,cat_id, item_name, item_desc, price) values (15, 5,'Aquarium Toys','High Quality food for Fish 2', 25.87);






select * from product_line_items;


select * from cart;
select * from item;

drop table cart;
show databases;


/*create table orders(
custid varchar(20),
item_id int,
order_id int auto_increment primary key,
constraint fk_cartcustomer foreign key (custid) references login(custid),
constraint fk_cartitem foreign key (item_id) references item(item_id)

)
*/


create table purchase_detail(
#to be generated by me
orderid int primary key auto_increment,
itemid int,
prod_id int,
categid int,
quantity int,
#to be generated by me
custid int not null,
constraint fk_cartcus foreign key (custid) references login(custid),
constraint fk_itmprd foreign key (prod_id) references product(prod_id)
);
select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where item_id in (1,2);



select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where prod_id in (1,3);


select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where item_id in (2,5);

insert into purchase_detail(itemid,prod_id,categid,quantity,custid) values(6, 2, 1, 3, 1001);

select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where prod_id in (7,8,22,24);



select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where prod_id in "7,8,22,24"

select * from purchase_detail;

drop table purchase_detail;


show tables;

