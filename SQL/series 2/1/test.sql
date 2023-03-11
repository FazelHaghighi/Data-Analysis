select p.title as p_title, c.title as c_title
from submissions as s
inner join problems as p
on s.problem_id = p.id
inner join contests as c
on p.contest_id = c.id
group by s.problem_id
order by count(s.problem_id) desc, p_title, c_title;

--------------------------------------------------------

select contests.title as title, count(submissions.user_id) as amount
from submissions
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
group by contests.title
order by amount desc, title;


select u.name as name, s.score as score
from submissions as s
inner join users as u
on s.user_id = u.id
inner join problems as p
on s.problem_id = p.id
inner join contests as c
on p.contest_id = c.id
where c.name = 'mahale'
group by c.title
order by score desc, name;


select users.name as name, max(submissions.score) 
from submissions, users
inner join problems
on submissions.problem_id = problems.id
group by contest_id, name
order by name;

select contests.title as title, count(distinct user_id) as amount
from submissions
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
group by contests.id
order by amount desc, title;

-----------------------------------------------
select users.name as name, sum(distinct submissions.score) as score
from submissions
inner join users
on submissions.user_id = users.id
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
where contests.title = 'mahale'
group by users.id
order by score desc, name;

-------------------------------------------

select users.name as name, sum(submissions.score) as score
from submissions
inner join users
on submissions.user_id = users.id
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
group by users.id
order by score desc, name;

----------------------------------------
select contests.id 
from contests
where contests.id not in
(select contests.id
from submissions
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
group by contests.id);

--------------------------------------------

select max(submissions.score) as score, submissions.problem_id as problems, users.name
from submissions
inner join users
on submissions.user_id = users.id
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
where contests.title = 'mahale'
group by users.id, submissions.problem_id;

------------------------------------------------

select users.name, submissions.problem_id, max(submissions.score) as scores
from submissions
inner join users
on submissions.user_id = users.id
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
group by users.id;


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

-----------------------------------------------

select scores.name as name, if(sum(scores.scores) is null, 0, sum(scores.scores)) as score
from
(select users.id as id, users.name as name, submissions.problem_id as problems, max(submissions.score) as scores
from users
left join submissions
on submissions.user_id = users.id
group by users.id, submissions.problem_id) as scores
group by scores.id
order by score desc, name;


DELETE FROM contests
WHERE contests.id not in
(select contests.id
from submissions
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id
group by contests.id);


select * FROM contests
where contests.id not in
(select cid from
(select distinct contests.id as cid
from submissions
inner join problems
on submissions.problem_id = problems.id
inner join contests
on problems.contest_id = contests.id) as cid);



