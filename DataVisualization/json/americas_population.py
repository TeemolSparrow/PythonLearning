import pygal_maps_world.maps


world_map = pygal_maps_world.maps.World()
world_map.title = 'Americas population'
world_map.add('North America', {'ca': 3412600, 'mx': 309349000, 'us': 113423000})
world_map.add('Center America', ['bz', 'cr', 'gt', 'hn', 'ni', 'pa', 'sv'])
world_map.add('South American', ['ar', 'bo', 'br', 'cl', 'co', 'ec', 'gf', 'gy', 'pe', 'py', 'sr', 'uy', 've'])
world_map.render_to_file('Americas_population.svg')
