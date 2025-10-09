{%  macro template_example() %}

    {% set query %}
        select true as boolean
    {% endset %}

    {%  if execute %}
    
        {% set results = run_query(query).columns[0].values()[0] %}

        {{ log("The query result is: " ~ results, info=True) }}

        select {{results}} as is_real
    {% endif %}

{% endmacro %}