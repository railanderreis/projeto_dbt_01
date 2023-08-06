
    
    

with child as (
    select shipper_fk as from_field
    from "northwind"."dbt_dw"."fact_order_details"
    where shipper_fk is not null
),

parent as (
    select shipper_sk as to_field
    from "northwind"."dbt_dw"."dim_shippers"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


