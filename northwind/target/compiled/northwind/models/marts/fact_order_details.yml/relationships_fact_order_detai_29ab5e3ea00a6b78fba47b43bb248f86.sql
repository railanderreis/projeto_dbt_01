
    
    

with child as (
    select product_fk as from_field
    from "northwind"."dbt_dw"."fact_order_details"
    where product_fk is not null
),

parent as (
    select product_sk as to_field
    from "northwind"."dbt_dw"."dim_products"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


