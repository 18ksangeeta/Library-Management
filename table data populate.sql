insert into book_authors (author_id, isbn) select a.author_id , bt.isbn from authors a, book_temp bt where a.author_id = bt.author_id;

insert into borrower (card_id,ssn,fname,lname,address, phone) select card_id,ssn,fname,lname,address_id, phone from borrower_temp;

insert into address (address_id, address,city,state) select address_id , address, city, state from borrower_temp;