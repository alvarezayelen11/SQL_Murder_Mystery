/* 
Solución al "SQL Murder Mystery". Disponible en: https://mystery.knightlab.com/#experienced
Los comentarios de varias líneas contienen los enunciados y pistas del desafío. 
Mientras que los comentarios de una línea indican el código utilizado para resolver cada tramo del problema.
*/ 

/* 
The crime was a murder that occurred sometime on Jan.15, 2018 and that it took place in SQL City. Start by retrieving the corresponding crime scene report from the police department’s database 
*/

-- SELECT * FROM crime_scene_report
-- WHERE date = 20180115 AND type = "murder" AND city = "SQL City";

/*
Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".
*/

-- SELECT * FROM person 
-- WHERE address_street_name = "Northwestern Dr"
-- ORDER BY address_number DESC
-- LIMIT 1;

/*
ID = 14887
NAME = Morty Schapiro
*/

-- SELECT * FROM person
-- WHERE name LIKE "%Annabel%" AND address_street_name = "Franklin Ave"; 

/*
ID = 16371
NAME = Annabel Miller
*/

-- SELECT * FROM interview 
-- WHERE person_id = 14887 OR person_id = 16371;

/*
Person_id = 14887
Transcript = I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

Person_id = 16371
Transcript = I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.
*/

-- SELECT * FROM get_fit_now_member AS g
-- INNER JOIN get_fit_now_check_in AS c ON g.id = c.membership_id
-- INNER JOIN person As p ON p.id = g.person_id
-- INNER JOIN drivers_license AS d ON d.id = p.license_id
-- WHERE g.membership_status = "gold" 
-- AND c.membership_id LIKE "48Z%"
-- AND d.plate_number LIKE "%H42W%"
-- AND c.check_in_date = 20180109

/*
id = 48Z55
person_id = 67318
name = Jeremy Bowers
*/

-- SELECT * FROM interview 
-- WHERE person_id = 67318

/*
I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/

-- SELECT DISTINCT p.id, p.name FROM person AS p
-- INNER JOIN drivers_license AS d ON d.id = p.license_id
-- INNER JOIN facebook_event_checkin AS f ON f.person_id = p.id
-- WHERE d.hair_color = "red"
-- AND d.gender = "female"
-- AND d.car_make = "Tesla"
-- AND d.car_model = "Model S"
-- AND d.height BETWEEN 65 AND 67
-- AND f.event_name = "SQL Symphony Concert"

/* 
id = 99716
name = Miranda Priestly

***Congrats, you found the brains behind the murder!***
*/


