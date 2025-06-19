{% macro grant_select (schema=target.schema, role=target.role) %}
    
    {% set sql %}
        grant usage on schema {{ schema }} to role {{ role }} ;
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant select on all views in schema {{ schema }} to role {{ role }};
    {% endset %}

    {{ log('Granting select on all tables and views in schema ' ~ target.schema ~ ' to role ' ~ role, info=true)}}
    {% do run_query(sql) %}
    {{ log('Privs granted', info=true)}}


{% endmacro %}