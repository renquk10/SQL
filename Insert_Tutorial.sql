INSERT INTO person (name, surname)
VALUES ('John', 'Doe');
INSERT INTO person (name, surname)
VALUES ('Jane', 'Doe');
INSERT INTO person (name, surname)
VALUES ('Christy', 'Brown');
INSERT INTO person (name, surname)
VALUES ('Shawn ', 'Fry');
INSERT INTO person (name, surname)
VALUES ('Dorothy ', 'Smith');

INSERT INTO student (student_id, matriculation_number)
VALUES (1, 1110111);
INSERT INTO student (student_id, matriculation_number)
VALUES (2, 2220222);
INSERT INTO student (student_id, matriculation_number)
VALUES (3, 3330333);

INSERT INTO professor (professor_id, salary)
VALUES (4, 5000);
INSERT INTO professor (professor_id, salary)
VALUES (5, 6500);

INSERT INTO course (course_number, name, heldby_id)
VALUES (111, 'Database Systems', 4);
INSERT INTO course (course_number, name, heldby_id)
VALUES (222, 'Analysis', 5);

Insert INTO attend (student_id, course_number)
VALUES (1, 111);
Insert INTO attend (student_id, course_number)
VALUES (2, 111);
Insert INTO attend (student_id, course_number)
VALUES (3, 111);
Insert INTO attend (student_id, course_number)
VALUES (3, 222);
commit;
