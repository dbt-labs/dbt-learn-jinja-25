{#  
    -- let's develop a macro that 
    1. queries the information schema of a database
    2. finds objects that are > 1 week old (no longer maintained)
    3. generates automated drop statements
    4. has the ability to execute those drop statements

#}

{% macro clean_stale_models(database=target.database, schema=target.schema, days=2) %}

    {% set get_drop_commands_query %}
        select 
            case when table_type = 'VIEW' then 'VIEW' else 'TABLE' end as object_type,
            'DROP ' || object_type || ' ' || '{{ database | upper }}' || '.' || table_schema || '.' || table_name || ';' as drop_statement
        from {{ database }}.information_schema.tables
        where table_schema = upper('{{ schema }}')
        and date(last_altered) <= date(dateadd('day', -1*{{ days }}, current_date))
    {% endset %}

    {{ log('\nGenerating cleanup queries...\n', info=True) }}
    {% set drop_queries = run_query(get_drop_commands_query).columns[1].values() %}

    {% for query in drop_queries %}
        {{ log('Executing: ' ~ query, info=True) }}
        {% do run_query(query) %}
    {% endfor %}

    {{ log('\nCleanup complete.\n', info=True) }}

    
{% endmacro %} 