import json
import pygal_maps_world.maps

from pygal_maps_world.i18n import COUNTRIES
from pygal.style import RotateStyle
from pygal.style import LightColorizedStyle


def get_country_code(country_name):
    """根据国家名称返回国别码"""
    for code, name in COUNTRIES.items():
        if name == country_name:
            return code
    return None


def load_population_data(year='2010'):
    # 加载数据文件
    with open('world_population_data.json') as file:
        population_data = json.load(file)

    population = {}
    for population_dict in population_data:
        if population_dict['Year'] == str(year):
            country_name = population_dict['Country Name']
            country_population = int(float(population_dict['Value']))
            country_code = get_country_code(country_name)
            if country_code:
                population[country_code] = country_population

    return population


def show_world_population(year='2010'):
    population = load_population_data(year)

    world_map = pygal_maps_world.maps.World()
    world_map.title = 'World population in ' + str(year)
    world_map.add(str(year), population)
    world_map.render_to_file('World_population.svg')


def show_world_population_by_group(year='2010'):
    population = load_population_data(year)

    population_group_1, population_group_2, population_group_3 = {}, {}, {}
    for country_name, country_population in population.items():
        if country_population < 10000000:
            population_group_1[country_name] = country_population
        elif country_population < 1000000000:
            population_group_2[country_name] = country_population
        else:
            population_group_3[country_name] = country_population

    # world_map_style = RotateStyle('#336699')
    world_map_style = RotateStyle('#336699', base_style=LightColorizedStyle)
    world_map = pygal_maps_world.maps.World(style=world_map_style)
    world_map.title = 'World population in ' + str(year)
    world_map.add('0-10m', population_group_1)
    world_map.add('10m - 1bn', population_group_2)
    world_map.add('>1bn', population_group_3)
    world_map.render_to_file('World_population.svg')


# show_world_population(2010)
show_world_population_by_group(2010)
