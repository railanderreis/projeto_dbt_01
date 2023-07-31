
with selected as (

    select *
    from {{ref('stg_shippers')}}
)
, transformed as (
    select
        row_number() over (order by shipper_id) as shipper_sk
        ,shipper_id
        ,company_name
        ,phone
    from selected    
)

select *
from transformed