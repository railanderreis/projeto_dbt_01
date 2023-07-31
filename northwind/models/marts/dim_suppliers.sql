
with suppliers as (

    select  *
    from {{ref('stg_suppliers')}}
)
, transformed as (
    select
        row_number() over (order by suppliers.supplier_id) as supplier_sk
        ,suppliers.supplier_id
        ,suppliers.company_name
        ,suppliers.contact_name
        ,suppliers.contact_title
        ,suppliers.address
        ,suppliers.city
        ,suppliers.region
        ,suppliers.postal_code
        ,suppliers.country
        ,suppliers.phone
        ,suppliers.fax
        ,suppliers.homepage
    from suppliers    
)

select *
from transformed