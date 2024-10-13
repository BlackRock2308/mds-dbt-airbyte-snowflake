select
    id ,
    pdl ,
    annee ,
    conso ,
    filiere ,
    code_region ,
    "CONSO / PDL" as conso_pdl,
    libelle_grand_secteur as grand_secteur,
    libelle_categorie_consommation as categorie_consommation
from
    {{ source('mds', 'CONSOMMATION_ENERGIE') }}
