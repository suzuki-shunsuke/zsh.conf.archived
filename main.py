import os

from jinja2 import Environment, FileSystemLoader
import yaml


with open(os.path.join(os.path.dirname(__file__), "zrc-builder.yml")) as r:
    cfg = yaml.load(r)

loader = FileSystemLoader(os.path.dirname(__file__))
env = Environment(loader=loader)

for src, item in cfg["entry"].items():
    template = env.get_template(src)
    with open(os.path.join(os.path.dirname(__file__), item["dest"]), "w") as w:
        w.write(template.render())
