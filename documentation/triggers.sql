-- Beebank SQLite triggers, exported from backend/beebank.db
-- Recreate them on a fresh database after `python manage.py migrate`.

CREATE TRIGGER after_delete_prestamo
AFTER DELETE
ON Prestamo
FOR EACH ROW
BEGIN
    UPDATE Cuenta
    SET balance = balance - OLD.loan_total
    WHERE customer_id = OLD.customer_id;
END;

CREATE TRIGGER after_insert_auth_user_cliente
AFTER INSERT
ON auth_user
FOR EACH ROW
WHEN NEW.is_staff = 0
BEGIN
    INSERT INTO cliente (customer_id, branch_id) VALUES (NEW.id, "44");
END;

CREATE TRIGGER after_insert_auth_user_empleado
AFTER INSERT
ON auth_user
FOR EACH ROW
WHEN NEW.is_staff = 1
BEGIN
    INSERT INTO empleado (employee_id, branch_id, employee_hire_date_e) VALUES (NEW.id, "44", date('now'));
END;

CREATE TRIGGER after_insert_prestamo
AFTER INSERT
ON Prestamo
FOR EACH ROW
BEGIN
    UPDATE Cuenta
    SET balance = balance + NEW.loan_total
    WHERE customer_id = NEW.customer_id;
END;

CREATE TRIGGER after_insert_transfer AFTER INSERT ON transferencias
BEGIN
    UPDATE cuenta
    SET balance = balance - NEW.ammount
    WHERE account_id = NEW.from_account_id;

    UPDATE cuenta
    SET balance = balance + NEW.ammount
    WHERE account_id = NEW.to_account_id;
END;

