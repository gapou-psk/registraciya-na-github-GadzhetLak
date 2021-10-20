# Marsim
Основы проектирования БД
1 задание

SELECT * FROM billing WHERE payer_email='vasya@mail.com'

2 задание

USE billing;

INSERT INTO billing(payer_email) VALUES ('pasha@mail.com');

INSERT INTO billing(recipient_email) VALUES ('katya@mail.com');

INSERT INTO billing(sum) VALUES ('300.00');

INSERT INTO billing(currency) VALUES ('EUR');

INSERT INTO billing(billing_date) VALUES ('14.02.2016');

INSERT INTO billing(comment) VALUES ('Valentines day present');

SELECT * FROM billing WHERE SUM=300;

3 задание

USE billing;

UPDATE billing

SET

payer_email='igor@mail.com'

WHERE payer_email='alex@mail.com';

4 задание

USE billing;

DELETE FROM billing

WHERE payer_email= '' or recipient_email='';
