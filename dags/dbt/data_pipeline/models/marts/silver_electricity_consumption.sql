{{ config(materialized='table') }}

select
    conso_energy.id,
    conso_energy.annee,
    conso_energy.filiere,
    conso_energy.categorie_consommation,
    conso_energy.grand_secteur,
    conso_energy.conso,
    conso_energy.pdl,
    conso_energy.code_region,
    conso_energy.conso_pdl,
    CURRENT_TIMESTAMP() AS updated_at
from {{ ref('stg_mds_conso_energy') }} as conso_energy
where grand_secteur != 'Secteur Inconnu'
