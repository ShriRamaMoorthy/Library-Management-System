create database Library;

Use library;

create table author(authorid int primary key,
					firstname varchar(30),
					lastname varchar(30));

create table category(categoryid int primary key,
					  categoryname varchar(50));

create table publisher(publisherid int primary key,
					   publishername varchar(50),
					   publicationLanguage varchar(30),
					   publicationtype varchar(20));

create table location(locationid int primary key,
					  shelfno int,
					  shelfname varchar(20),
					  floorno int);

create table book(bookid int primary key,
				  ISBNcode bigint,
				  booktitle varchar(50),
				  categoryid int foreign key references category(categoryid),
				  publisherid int foreign key references publisher(publisherid),
				  publicationyear int,
				  bookedition int,
				  copiestotal int,
				  copiesavailable int,
				  locationid int foreign key references location(locationid));


create table bookauthor(bookid int foreign key references book(bookid),
						authorid int foreign key references author(authorid));


create table librarystaff(issuedbyid int primary key,
						  staffname varchar(50),
						  staffdesignation varchar(30));

create table memberstatus(activestatusid int primary key,
						  accountype varchar(20),
						  accountstatus varchar(20),
						  membershipstartdate date,
						  membershipenddate date);

create table bookrequestatus(availablestatusid int primary key,
							 availablestatus varchar(20),
							 nearestavailable date,
							 publicationtype varchar(20));

create table member(memberid int primary key,
					firstname varchar(50),
					lastname varchar(50),
					city varchar(30),
					mobileno bigint,
					emailid varchar(30),
					dateofbirth date,
					activestatusid int foreign key references memberstatus(activestatusid));


create table bookissue(issueid int primary key,
					   bookid int foreign key references book(bookid),
					   memberid int foreign key references member(memberid),
					   issuedate date,
					   returndate date,
					   issuestatus varchar(20),
					   issuedbyid int foreign key references librarystaff(issuedbyid));

create table finedue(fineid int primary key,
					 memberid int foreign key references member(memberid),
					 issueid int foreign key references bookissue(issueid));



alter table librarystaff add paymentdate date, paymentamount float;



-----VALUE INSTERION
insert into author values
(1, 'R.K.', 'Narayan'),
(2, 'Chetan', 'Bhagat'),
(3, 'J.K.', 'Rowling'),
(4, 'George', 'Orwell'),
(5, 'Dan', 'Brown');

insert into category values
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science'),
(4, 'History'),
(5, 'Technology');

insert into publisher values
(1, 'Penguin', 'English', 'Print'),
(2, 'HarperCollins', 'English', 'Print'),
(3, 'Oxford Press', 'English', 'Academic'),
(4, 'McGraw Hill', 'English', 'Educational'),
(5, 'Scholastic', 'English', 'Print');

insert into location values
(1, 101, 'Shelf-A', 1),
(2, 102, 'Shelf-B', 1),
(3, 201, 'Shelf-C', 2),
(4, 202, 'Shelf-D', 2),
(5, 301, 'Shelf-E', 3);

insert into book values
(1, 1111111111, 'Malgudi Days', 1, 1, 2000, 1, 10, 7, 1),
(2, 2222222222, 'Half Girlfriend', 1, 2, 2014, 1, 15, 10, 2),
(3, 3333333333, 'Harry Potter', 1, 5, 2005, 2, 20, 5, 3),
(4, 4444444444, '1984', 1, 1, 1949, 1, 12, 4, 4),
(5, 5555555555, 'Da Vinci Code', 1, 2, 2003, 1, 18, 9, 5);

insert into bookauthor values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into librarystaff values
(1, 'Amit Sharma', 'Librarian', '2024-01-10', 30000),
(2, 'Neha Singh', 'Assistant', '2024-02-15', 20000),
(3, 'Raj Verma', 'Clerk', '2024-03-01', 18000);

insert into memberstatus values
(1, 'Premium', 'Active', '2023-01-01', '2025-01-01'),
(2, 'Basic', 'Active', '2023-06-01', '2024-06-01'),
(3, 'Premium', 'Expired', '2022-01-01', '2023-01-01');

insert into bookrequestatus values
(1, 'Available', NULL, 'Print'),
(2, 'Not Available', '2026-06-01', 'Print'),
(3, 'Available', NULL, 'Digital');

insert into member values
(1, 'Rahul', 'Tripathi', 'Chennai', 9876543210, 'rahul@gmail.com', '1995-05-10', 1),
(2, 'Deepak', 'Hooda', 'Delhi', 8765432109, 'dehooda@gmail.com', '1998-07-15', 2),
(3, 'Vijay', 'Sankar', 'Hyderabad', 7654321098, 'vjsankar@gmail.com', '1993-03-20', 1),
(4, 'Matt', 'Short', 'Chennai', 6543210987, 'matty@gmail.com', '1996-11-25', 3);

insert into bookissue values
(1, 1, 1, '2026-01-01', '2026-01-10', 'Returned', 1),
(2, 2, 2, '2026-02-01', '2026-02-15', 'Returned', 2),
(3, 3, 3, '2026-03-01', NULL, 'Issued', 1),
(4, 4, 1, '2026-03-05', NULL, 'Issued', 3);

insert into finedue values
(1, 1, 1),
(2, 2, 2);