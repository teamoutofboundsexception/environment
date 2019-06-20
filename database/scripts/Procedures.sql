delimiter //
create or replace procedure GetPlacesList (
	in x decimal(9,6),
	in y decimal(9,6),
	in cId int,
	in availableTime time,
	in coordR decimal(9,6)
) begin
	select * from (select * from Places where cityId = @cId) p
		where p.mapX between @x - @coordR and @x + @coordR
			and p.mapY between @y - @coordR and @y + @coordR
			and current_time between p.openingTime and p.closingTime
		order by p.mapX, p.mapY;
end; //
delimiter ;

delimiter //
create or replace procedure GetPlacesList1 (
	in x decimal(9,6),
	in y decimal(9,6),
	in cId int,
	in availableTime time,
	in coordR decimal(9,6)
) begin
	select * from (select * from Places where cityId = @cId) p order by p.mapX, p.mapY;
end; //
delimiter ;

delimiter //
create or replace procedure GetPlacesList2 (
	in x decimal(9,6),
	in y decimal(9,6),
	in cId int,
	in availableTime time,
	in coordR decimal(9,6)
) begin
	select * from (select * from Places where cityId = @cId) p
		where p.mapX between @x - @coordR and @x + @coordR
			and p.mapY between @y - @coordR and @y + @coordR
		order by p.mapX, p.mapY;
end; //
delimiter ;

delimiter //
create or replace procedure GetPlacesList3 (
	in x decimal(9,6),
	in y decimal(9,6),
	in cId int,
	in availableTime time,
	in coordR decimal(9,6)
) begin
	select * from (select * from Places where cityId = @cId) p
			and current_time between p.openingTime and p.closingTime
		order by p.mapX, p.mapY;
end; //
delimiter ;


