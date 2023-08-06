with suppliers as (

    select  *
    from "northwind"."dbt_dw"."stg_suppliers"
)
, divisions as (
    select * 
    from "northwind"."dbt_dw"."seed_supplier_divisions"
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
        ,divisions.division
    from suppliers
    left join divisions on suppliers.country = divisions.country    
)

select *
from transformed