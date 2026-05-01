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


