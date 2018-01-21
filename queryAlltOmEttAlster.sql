SELECT 
-- namn, föremål, garn, färg
mottagare.namn as 'Mottagare', 
item.modellTyp as 'Modell',
garn.nameManuf as 'Garn', 
colour.colour as 'Färg', 
alster.feature as 'Speciellt',
alster.id as 'Alster nr'

FROM individualprojectstickalster.alster

inner join mottagare
on
alster.Mottagare_ID = mottagare.ID

inner join garn
on 
alster_has_garn.Garn_ID = garn.ID

inner join item
on 
alster_has_item.Item_ID = item.ID

inner join colour
on garn_has_colour.Colour_ID = colour.ID

inner join alster_has_garn
on 
alster_has_garn.Alster_ID = alster.ID

inner join alster_has_item
on 
alster_has_item.Item_ID = item.ID

inner join garn_has_colour
on
garn_has_colour.colour_ID = colour.ID





;