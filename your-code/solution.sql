select * from titles;
select * from publishers;
select * from titleauthor;

#Challenge 1

select ta.au_id as "AUTHOR ID",au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",a.title as "TITLE",b.pub_name as "PUBLISHER"
from authors au
right join
titleauthor ta on au.au_id = ta.au_id
left join titles a on a.title_id = ta.title_id
left join publishers b on b.pub_id = a.pub_id;

#Challenge 2
select ta.au_id as "AUTHOR ID",au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",b.pub_name as "PUBLISHER", count(a.title_id) as TITLE_COUNT
from authors au
right join
titleauthor ta on au.au_id = ta.au_id
left join titles a on a.title_id = ta.title_id
left join publishers b on b.pub_id = a.pub_id
group by ta.au_id, a.pub_id;

#Challenge 3
select ta.au_id as "AUTHOR ID",au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME", sum(sa.qty) as TOTAL
from authors au
right join
titleauthor ta on au.au_id = ta.au_id
left join titles a on a.title_id = ta.title_id
left join publishers b on b.pub_id = a.pub_id
left join sales sa on ta.title_id=sa.title_id
group by ta.au_id
order by TOTAL DESC
LIMIT 3;

select * from sales;

#Challenge 4
select ta.au_id as "AUTHOR ID",au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME", sum(sa.qty) as TOTAL
from authors au
right join
titleauthor ta on au.au_id = ta.au_id
left join titles a on a.title_id = ta.title_id
left join publishers b on b.pub_id = a.pub_id
left join sales sa on ta.title_id=sa.title_id
group by ta.au_id
order by TOTAL DESC
LIMIT 23;

