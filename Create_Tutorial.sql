--------------------------------------------- create tables
CREATE TABLE person (
  person_id INTEGER     NOT NULL,
  name      VARCHAR(20) NOT NULL,
  surname   VARCHAR(20) NOT NULL,
  CONSTRAINT pk_per_pid PRIMARY KEY (person_id)
);

CREATE TABLE student (
  student_id           INTEGER NOT NULL,
  matriculation_number INTEGER NOT NULL UNIQUE,
  CONSTRAINT pk_stu_sid PRIMARY KEY (student_id),
  CONSTRAINT fk_stu_sid FOREIGN KEY (student_id) REFERENCES person (person_id) ON DELETE CASCADE
);

CREATE TABLE professor (
  professor_id INTEGER NOT NULL,
  salary       DOUBLE PRECISION NOT NULL CHECK (salary >= 0),
  CONSTRAINT pk_pro_pid PRIMARY KEY (professor_id),
  CONSTRAINT fk_pro_pid FOREIGN KEY (professor_id) REFERENCES person (person_id) ON DELETE CASCADE
);

CREATE TABLE course (
  course_number INTEGER     NOT NULL,
  name          VARCHAR(200) NOT NULL,
  heldby_id     INTEGER,
  CONSTRAINT pk_cou_cnu PRIMARY KEY (course_number),
  CONSTRAINT fk_cou_nme FOREIGN KEY (heldby_id) REFERENCES professor (professor_id) ON DELETE SET NULL
);

CREATE TABLE attend (
  student_id    INTEGER NOT NULL,
  course_number INTEGER NOT NULL,
  CONSTRAINT pk_att_sid PRIMARY KEY (student_id, course_number),
  CONSTRAINT fk_att_sid FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE,
  CONSTRAINT fk_cou_cnu FOREIGN KEY (course_number) REFERENCES course (course_number) ON DELETE CASCADE
);

--------------------------------------------- auto incrementation of person_id

CREATE SEQUENCE seq_person_pid
  START WITH 1
  MINVALUE 1
  INCREMENT BY 1
  CACHE 100;

CREATE OR REPLACE TRIGGER tri_person_pid
  BEFORE INSERT
  ON person
  FOR EACH ROW
  BEGIN
    SELECT seq_person_pid.nextval
    INTO :new.person_id
    FROM dual;
  END;