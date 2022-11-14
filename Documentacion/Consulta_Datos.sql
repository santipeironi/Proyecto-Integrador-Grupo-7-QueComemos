USE quecomemos;
select m.descr_menu from menu as m
inner join categoria as c
on c.id_cate = m.id_cate
order by c.id_cate;