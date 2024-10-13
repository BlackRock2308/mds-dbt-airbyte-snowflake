{{ config(materialized='table') }}

with silver_data as (
    select *
    from {{ ref('silver_electricity_consumption') }}  -- Reference the SILVER model
)

select
    annee,
    grand_secteur,
    categorie_consommation,
    code_region,
    count(distinct id) as total_records,
    sum(conso) as total_consumption,
    AVG(conso_pdl) AS avg_conso_pdl,
    MAX(conso_pdl) AS max_conso_pdl,
    MIN(conso_pdl) AS min_conso_pdl
    
from silver_data
GROUP BY 1, 2, 3, 4
