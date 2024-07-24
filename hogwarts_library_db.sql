/* Create the STAFF table */
CREATE TABLE STAFF (
    staff_id CHAR(5) NOT NULL,
    staff_name VARCHAR(100) NOT NULL,
    staff_address VARCHAR(150) NULL,
    staff_email VARCHAR(50) NOT NULL,
    CONSTRAINT staff_pk PRIMARY KEY (staff_id)
);

/* Insert records into STAFF */
INSERT INTO STAFF(staff_id, staff_name, staff_address, staff_email) VALUES 
('001', 'Albus Dumbledore', 'Hogwarts Castle', 'albus.d@hogwarts.edu'),
('002', 'Minerva McGonagall', 'Hogwarts Castle', 'minerva.m@hogwarts.edu'),
('003', 'Severus Snape', 'Spinner\'s End', 'severus.s@hogwarts.edu'),
('004', 'Rubeus Hagrid', 'Hagrid\'s Hut', 'rubeus.h@hogwarts.edu'),
('005', 'Filius Flitwick', 'Hogwarts Castle', 'filius.f@hogwarts.edu');

/* Create the STUDENT table */
CREATE TABLE STUDENT (
    student_id CHAR(5) NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    student_address VARCHAR(150) NULL,
    student_email VARCHAR(50) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (student_id)
);

/* Insert records into STUDENT */
INSERT INTO STUDENT(student_id, student_name, student_address, student_email) VALUES 
('1001', 'Harry Potter', '4 Privet Drive', 'harry.p@hogwarts.edu'),
('1002', 'Hermione Granger', 'Hampstead Garden Suburb', 'hermione.g@hogwarts.edu'),
('1003', 'Ron Weasley', 'The Burrow', 'ron.w@hogwarts.edu'),
('1004', 'Draco Malfoy', 'Malfoy Manor', 'draco.m@hogwarts.edu'),
('1005', 'Luna Lovegood', 'Ottery St Catchpole', 'luna.l@hogwarts.edu');

/* Create the PUBLISHER table */
CREATE TABLE PUBLISHER (
    publisher_id CHAR(5) NOT NULL,
    publisher_name VARCHAR(100) NOT NULL,
    publisher_address VARCHAR(150) NULL,
    publisher_email VARCHAR(50) NOT NULL,
    CONSTRAINT publisher_pk PRIMARY KEY (publisher_id)
);

/* Insert records into PUBLISHER */
INSERT INTO PUBLISHER(publisher_id, publisher_name, publisher_address, publisher_email) VALUES 
('2001', 'The Daily Prophet', 'Diagon Alley', 'info@dailyprophet.com'),
('2002', 'Obscurus Books', 'Diagon Alley', 'contact@obscurusbooks.com'),
('2003', 'WhizzHard Books', 'Diagon Alley', 'support@whizzhard.com'),
('2004', 'Flourish and Blotts', 'Diagon Alley', 'sales@flourishblotts.com'),
('2005', 'Transfiguration Today', 'Diagon Alley', 'editor@transfigurationtoday.com');

/* Create the WRITER table */
CREATE TABLE WRITER (
    writer_id CHAR(5) NOT NULL,
    writer_name VARCHAR(100) NOT NULL,
    writer_address VARCHAR(150) NULL,
    writer_email VARCHAR(50) NOT NULL,
    CONSTRAINT writer_pk PRIMARY KEY (writer_id)
);

/* Insert records into WRITER */
INSERT INTO WRITER(writer_id, writer_name, writer_address, writer_email) VALUES 
('3001', 'Gilderoy Lockhart', 'Unknown', 'gilderoy.l@hogwarts.edu'),
('3002', 'Bathilda Bagshot', 'Godric\'s Hollow', 'bathilda.b@wizardingworld.com'),
('3003', 'Newt Scamander', 'New York City', 'newt.s@wizardingworld.com'),
('3004', 'Rita Skeeter', 'London', 'rita.s@dailyprophet.com'),
('3005', 'Kenilworthy Whisp', 'Montrose', 'kenilworthy.w@quidditch.com');

/* Create the BOOK table */
CREATE TABLE BOOK (
    book_id CHAR(5) NOT NULL,
    book_title VARCHAR(100) NOT NULL,
    book_pages INT NOT NULL,
    isbn VARCHAR(50) NOT NULL,
    student_id CHAR(5) NULL,
    staff_id CHAR(5) NULL,
    publisher_id CHAR(5) NOT NULL,
    CONSTRAINT book_pk PRIMARY KEY (book_id),
    CONSTRAINT book_fk_student FOREIGN KEY (student_id) REFERENCES STUDENT (student_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT book_fk_staff FOREIGN KEY (staff_id) REFERENCES STAFF (staff_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT book_fk_publisher FOREIGN KEY (publisher_id) REFERENCES PUBLISHER (publisher_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

/* Insert records into BOOK */
INSERT INTO BOOK(book_id, book_title, book_pages, isbn, student_id, staff_id, publisher_id) VALUES 
('4001', 'Magical Me', 250, '978-0747532743', '1001', '001', '2001'),
('4002', 'A History of Magic', 450, '978-0747538486', '1002', '002', '2002'),
('4003', 'Fantastic Beasts', 320, '978-0439064873', '1003', '003', '2003'),
('4004', 'The Life and Lies of Albus Dumbledore', 300, '978-0439136365', '1004', '004', '2004'),
('4005', 'Quidditch Through the Ages', 200, '978-1408855928', '1005', '005', '2005');

/* Create the BOOK_WRITER table */
CREATE TABLE BOOK_WRITER (
    book_writer_id CHAR(5) NOT NULL,
    book_id CHAR(5) NOT NULL,
    writer_id CHAR(5) NOT NULL,
    CONSTRAINT book_writer_pk PRIMARY KEY (book_writer_id),
    CONSTRAINT book_writer_fk_book FOREIGN KEY (book_id) REFERENCES BOOK (book_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT book_writer_fk_writer FOREIGN KEY (writer_id) REFERENCES WRITER (writer_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

/* Insert records into BOOK_WRITER */
INSERT INTO BOOK_WRITER(book_writer_id, book_id, writer_id) VALUES 
('5001', '4001', '3001'),
('5002', '4002', '3002'),
('5003', '4003', '3003'),
('5004', '4004', '3004'),
('5005', '4005', '3005');
