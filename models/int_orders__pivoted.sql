{%- set payment_methods=['bank_transfer','coupon','credit_card','gift_card','bitcoin'] -%}

with payments as 
(
    select * from {{ ref('stg_payments') }}
    where status = 'success'
)
, pivoted as (
    select 
        order_id, 

        
        
        {% for method in payment_methods %}
            
            sum(case when payment_method = '{{ method }}' then amount else 0 end) as {{ method }}_amount
            {%- if not loop.last -%}
                ,
            {%- endif -%}
        
        {% endfor %}
    from payments
    group by 1
)
select * from pivoted