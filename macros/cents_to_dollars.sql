{%  macro cents_to_dollars(column_name, decimals=4) %}
    ({{ column_name }} * 1.0 / 100)::decimal(10, {{ decimals }})
{%- endmacro %}

