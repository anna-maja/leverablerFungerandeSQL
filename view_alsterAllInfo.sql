CREATE VIEW `AlltOmAlster` AS

select
namn as 'Namn',
modellTyp as 'Föremål', 
nameManuf as 'Garn', 
colour as 'Färg' 

from 
`individualprojectstickalster`.`alster`

inner join
`individualprojectstickalster`.`item`

inner join
`individualprojectstickalster`.`mottagare`

inner join
`individualprojectstickalster`.`garn`

inner join
`individualprojectstickalster`.`colour`

;