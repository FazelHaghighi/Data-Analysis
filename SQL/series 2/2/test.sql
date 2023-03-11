select f.id, f.name, f.recipe, sum(COALESCE(i.price_per_unit * amount, 0)) as total_price
from food_ingredients as fi
inner join ingredients as i
on i.id = fi.ingredient_id
right join foods as f
on f.id = fi.food_id
group by f.id;

SET SQL_SAFE_UPDATES = 0;

UPDATE foods
set recipe = replace(recipe, '@hamid_ashpazbashi2', '@hamid_ashpazbashi')
where recipe like '%@hamid_ashpazbashi2%';

select recipe from foods
where recipe = '@hamid_ashpazbashi';

select foods.id as id, foods.name, if(avg(COALESCE(rate, 0)) = 0, 0,avg(COALESCE(rate, 0))) as rating, count(ratings.rate) as rate_count
from ratings
right join foods
on ratings.food_id = foods.id
group by foods.id
order by rating desc, rate_count desc, foods.id desc
limit 10;


SELECT 
    *
FROM
    food_ingredients
        INNER JOIN
    user_ingredients ON food_ingredients.ingredient_id = user_ingredients.ingredient_id
        AND user_ingredients.user_id = 1
        AND food_ingredients.amount <= user_ingredients.amount
ORDER BY food_id DESC;

select id
from foods
where id = 4 or id = 1
order by id desc;

select food_ingredients.food_id
from food_ingredients 
inner join user_ingredients
on food_ingredients.ingredient_id = user_ingredients.ingredient_id
where user_ingredients.amount >= food_ingredients.amount and user_ingredients.user_id = 1
group by food_ingredients.food_id
order by food_ingredients.food_id desc;


INSERT INTO `food_ingredients` (`id`, `food_id`, `ingredient_id`, `amount`) VALUES
(1, 1, 5, '4.00'),
(2, 1, 1, '5.00'),
(3, 1, 2, '1.00'),
(4, 4, 1, '1.00'),
(5, 3, 1, '4.00'),
(6, 3, 2, '2.00');

INSERT INTO `user_ingredients` (`id`, `user_id`, `ingredient_id`, `amount`) VALUES
(1, 1, 1, '5.00'),
(2, 1, 2, '1.00'),
(3, 1, 5, '4.00'),
(4, 2, 1, '10.00');


select food_ingredients.food_id as id
from food_ingredients 
inner join user_ingredients 
on food_ingredients.ingredient_id = user_ingredients.ingredient_id
inner join users on 
user_ingredients.user_id = users.id
where food_ingredients.food_id not in
(select food_id
from food_ingredients
inner join user_ingredients
on food_ingredients.ingredient_id = user_ingredients.ingredient_id
where user_ingredients.amount < food_ingredients.amount)
and users.username = 'quera'
group by food_ingredients.food_id
order by food_ingredients.food_id desc;