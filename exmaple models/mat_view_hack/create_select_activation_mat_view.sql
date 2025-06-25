create materialized view select_activation auto refresh yes AS

-- This is now the way we create this materialised view due to using dbt as the source of the actual materialised view. This just ensures we are always looking at one table. 

select * from prod.select_activation;