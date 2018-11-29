CREATE PROCEDURE p_delete_person(
  p_person_id  IN  person.person_id%TYPE,
  p_error_code OUT NUMBER
)
AS
  BEGIN
    DELETE
    FROM person
    WHERE p_person_id = person.person_id;

    p_error_code := SQL%ROWCOUNT;
    IF (p_error_code = 1)
    THEN
      COMMIT;
    ELSE
      ROLLBACK;
    END IF;
    EXCEPTION
    WHEN OTHERS
    THEN
      p_error_code := SQLCODE;
  END p_delete_person;
/

CREATE OR REPLACE PROCEDURE p_add_person
  (
    p_name      IN  person.name%TYPE,
    p_surname   IN  person.surname%TYPE,
    p_person_id OUT person.person_id%TYPE
  )
AS
  BEGIN
    INSERT INTO person (name, surname) VALUES (p_name, p_surname)
    returning person_id into p_person_id;

    IF (SQL%ROWCOUNT = 1)
    THEN
      COMMIT;
    ELSE
      ROLLBACK;
    END IF;

  END p_add_person;
/