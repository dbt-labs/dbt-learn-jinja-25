--loop practice 
{% for j in range(26) %}
   select {{ j }} as number {% if not loop.last %} union all {% endif %}
{% endfor %}

-- practice setting basic variables!

{% set cool_string = 'Wow cool beans!' %}
{% set second_cool_string = 'this is jinja!' %}
{% set my_fav_num = 26 %}


-- practice printing basic variables!

{{ cool_string }} {{ second_cool_string }} I want to write jinja for {{ my_fav_num }} years!

-- practice setting list variable!

{% set animals = ['lemur', 'dingo', 'rhino', 'dog'] %}


-- practice accessing items of list!
-- items are accessed by the numeric index in the list

{{ my_animals[0] }}
{{ my_animals[1] }}
{{ my_animals[2] }}
{{ my_animals[3] }}

-- practice iterating over a list!

{% for animal in my_animals %}
  
  My favorite animal is the {{ animal }}

{%- endfor %}

-- practice with if statements!

{% set temperature = 80.0 %}

On a day like this, I especially like

{% if temperature > 70.0 %}

a refreshing lemon sorbet.

{% else %}

A decadent chocolate lava cake.

{% endif %}


-- practice with nesting if statements and for loops!

{% set foods = ['radish', 'cucumber', 'chicken nugget', 'avocado'] %}

{% for food in foods %}
	{% if food == 'chicken nugget' %}
		{% set food_type = 'snack' %}
	{% else %}
		{% set food_type = 'vegetable' %}
	{% endif %}
	The delicious {{ food }} is my favorite {{ food_type }}
{% endfor %}


-- practive with creating dictionaries!
-- items accessed by keys!

{% set jennas_dictionary = {
   'word' :'data',
   'part_of_speech' : 'noun',
   'definition' : 'the building block of life'
} %}

{{ jennas_dictionary['word'] }}


{{ jennas_dictionary['word'] }} ({{ jennas_dictionary['part_of_speech'] }}): defined as "{{ jennas_dictionary['definition'] }}"




