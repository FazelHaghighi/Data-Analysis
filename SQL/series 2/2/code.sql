-- Section1
    UPDATE foods
	set recipe = replace(recipe, '@hamid_ashpazbashi2', '@hamid_ashpazbashi')
	where recipe like '%@hamid_ashpazbashi2%';
-- Section2
    select foods.id as id, foods.name, if(avg(COALESCE(rate, 0)) = 0, 0,avg(COALESCE(rate, 0))) as rating, count(ratings.rate) as rate_count
	from ratings
	right join foods
	on ratings.food_id = foods.id
	group by foods.id
	order by rating desc, rate_count desc, foods.id desc
	limit 10;
-- Section3
    select f.id, f.name, f.recipe, sum(COALESCE(i.price_per_unit * amount, 0)) as total_price
	from food_ingredients as fi
	inner join ingredients as i
	on i.id = fi.ingredient_id
	right join foods as f
	on f.id = fi.food_id
	group by f.id;
-- Section4
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