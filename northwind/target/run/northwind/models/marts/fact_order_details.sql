
  
    

  create  table "northwind"."dbt_dw"."fact_order_details__dbt_tmp"
  
  
    as
  
  (
    with
    customers as (
        select *
        from "northwind"."dbt_dw"."dim_customers"
    ),
    employees as (
        select *
        from "northwind"."dbt_dw"."dim_employees"
    ),
    products as (
        select *
        from "northwind"."dbt_dw"."dim_products"
    ),
    shippers as (
        select *
        from "northwind"."dbt_dw"."dim_shippers"
    ),
    suppliers as (
        select *
        from "northwind"."dbt_dw"."dim_suppliers"
    ),
    orders_with_sk as (
        select
             orders.order_id
            ,customers.customer_sk as customer_fk
            ,employees.employee_sk as employee_fk
            ,shippers.shipper_sk as shipper_fk
            ,orders.order_date
            ,orders.required_date
            ,orders.shipped_date
            ,orders.freight
            ,orders.ship_name
            ,orders.ship_address
            ,orders.ship_city
            ,orders.ship_region
            ,orders.ship_postal_code
            ,orders.ship_country 
        from "northwind"."dbt_dw"."stg_orders" as orders
        left join employees on orders.employee_id = employees.employee_id
        left join customers on orders.customer_id = customers.customer_id
        left join shippers on orders.shipper_id = shippers.shipper_id
    )
    , order_detail_with_sk as (
        select
          order_detail.order_id
         ,products.product_sk as product_fk
         ,order_detail.unit_price
         ,order_detail.quantity
         ,order_detail.discount 
        from "northwind"."dbt_dw"."stg_order_details" as order_detail
        left join products on order_detail.product_id = products.product_id
    )
    , final as (
        select 
             order_detail_with_sk.order_id
            ,orders_with_sk.customer_fk
            ,orders_with_sk.employee_fk
            ,orders_with_sk.shipper_fk
            ,orders_with_sk.order_date
            ,orders_with_sk.required_date
            ,orders_with_sk.shipped_date
            ,orders_with_sk.freight
            ,orders_with_sk.ship_name
            ,orders_with_sk.ship_address
            ,orders_with_sk.ship_city
            ,orders_with_sk.ship_region
            ,orders_with_sk.ship_postal_code
            ,orders_with_sk.ship_country
            ,order_detail_with_sk.product_fk
            ,order_detail_with_sk.unit_price
            ,order_detail_with_sk.quantity
            ,order_detail_with_sk.discount
            from orders_with_sk
            left join order_detail_with_sk on orders_with_sk.order_id = order_detail_with_sk.order_id

    )

select * from final
  );
  