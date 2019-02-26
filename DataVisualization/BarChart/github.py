import requests
import pygal

from pygal.style import LightenStyle
from pygal.style import LightColorizedStyle


def get(url):
    response = requests.get(url)
    response_dict = response.json()
    return response_dict


def init_config():
    my_config = pygal.Config()
    my_config.x_label_rotation = 45       # 横坐标标签与横坐标的夹角
    my_config.show_legend = False         # 是否显示图例
    my_config.truncate_label = 20         # 限定坐标标签长度
    my_config.show_y_guides = False       # 是否显示水平线
    my_config.width = 1000                # 自定义宽度
    return my_config


def most_stars_python_project():
    url = 'https://api.github.com/search/repositories?q=language:python&sort=starts'
    response_json = get(url)
    repo_dicts = response_json['items']

    names, plot_dicts = [], []
    for repo_dict in repo_dicts:
        names.append(repo_dict['name'])
        plot_dict = {
            'value': repo_dict['stargazers_count'],
            'label': str(repo_dict['description']),
            'xlink': repo_dict['html_url']
        }
        plot_dicts.append(plot_dict)

    my_style = LightenStyle('#339966', base_style=LightColorizedStyle)
    chart = pygal.Bar(init_config(), style=my_style)
    chart.title = 'Most starred python project on github'
    chart.x_labels = names
    chart.add(None, plot_dicts)
    chart.render_to_file('Most_starred_python_project.svg')


most_stars_python_project()
