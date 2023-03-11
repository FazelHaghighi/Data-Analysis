-- Section1
    select p.title as p_title, c.title as c_title
	from submissions as s
	inner join problems as p
	on s.problem_id = p.id
	inner join contests as c
	on p.contest_id = c.id
	group by s.problem_id
	order by count(s.problem_id) desc, p_title, c_title;
-- Section2
	select contests.title as title, count(distinct user_id) as amount
	from submissions
	inner join problems
	on submissions.problem_id = problems.id
	inner join contests
	on problems.contest_id = contests.id
	group by contests.id
	order by amount desc, title;
-- Section3
    select scores.name, sum(scores.scores) as score
	from
	(select users.id as id, users.name as name, submissions.problem_id as problems, max(submissions.score) as scores
	from submissions
	inner join users
	on submissions.user_id = users.id
	inner join problems
	on submissions.problem_id = problems.id
	inner join contests
	on problems.contest_id = contests.id
	where contests.title = 'mahale'
	group by users.id, submissions.problem_id) as scores
	group by scores.id
	order by score desc, name;
-- Section4
    select scores.name as name, if(sum(scores.scores) is null, 0, sum(scores.scores)) as score
	from
	(select users.id as id, users.name as name, submissions.problem_id as problems, max(submissions.score) as scores
	from users
	left join submissions
	on submissions.user_id = users.id
	group by users.id, submissions.problem_id) as scores
	group by scores.id
	order by score desc, name;
-- Section5
    UPDATE contests
	set title = replace(title, 'mahale', 'Mosabeghe Mahale')
	where title like '%mahale%';
-- Section6
	delete FROM contests
	where contests.id not in
	(select cid from
	(select contests.id as cid
	from submissions
	inner join problems
	on submissions.problem_id = problems.id
	inner join contests
	on problems.contest_id = contests.id
	group by contests.id) as cid);