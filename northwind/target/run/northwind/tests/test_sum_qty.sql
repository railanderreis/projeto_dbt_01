select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with
    validation as (
        select sum(quantity) as sum_val
        from "northwind"."dbt_dw"."fact_order_details"
        where order_date between '1998-03-01' and '1998-03-31'
    )

select * from validation where sum_val != 4065
      
    ) dbt_internal_test