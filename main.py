import os

from jinja2 import Environment, FileSystemLoader


loader = FileSystemLoader(os.path.dirname(__file__))
env = Environment(loader=loader)

for k in ["zprofile", "zshrc", "zshenv"]:
    template = env.get_template(k)
    with open(os.path.join(os.path.dirname(__file__), ".{}".format(k)), "w") as w:
        w.write(template.render())
