use superheroe
go

select s.id, s.superheroe_name, sp.power_name from superheroe s
inner join hero_power hp on s.id=hp.hero_id
inner join superpower sp on hp.power_id=sp.id

select s.superheroe_name, count(sp.power_name) #power from superheroe s
inner join hero_power hp on s.id=hp.hero_id
inner join superpower sp on hp.power_id=sp.id
group by s.superheroe_name
having count(sp.power_name)>10
order by s.superheroe_name asc 


select s.id, s.superheroe_name, p.publisher_name,g.gender from superheroe s
inner join publisher p on s.publisher_id=p.id
inner join gender g on s.gender_id=g.id

select *from(
	select p.publisher_name,g.gender, count(p.id) cantidad from superheroe s
	inner join publisher p on s.publisher_id=p.id
	inner join gender g on s.gender_id=g.id
	group by p.publisher_name, g.gender
) as datos
PIVOT(
SUM (cantidad)
FOR gender in ([Male],[Female])
) pivot_table

select s.id, s.superheroe_name, s.eye_colour_id, s.hair_colour_id, 
s.skin_colour_id, c.colour from superheroe s
inner join colour c on s.id=c.id

select s.id, s.superheroe_name, a.attribute_name from superheroe s
inner join hero_attribute ha on s.id=ha.hero_id
inner join attribute a on ha.attribute_id=a.id
order by s.superheroe_name asc 

select s.id, s.superheroe_name, ha.attribute_value, al.alignment from superheroe s
inner join hero_attribute ha on s.id=ha.hero_id
inner join attribute a on ha.attribute_id=a.id
inner join alignment al on s.alignment_id=al.id