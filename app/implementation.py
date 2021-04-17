import os
import random

from flask import Flask, render_template

revision = os.environ.get("REVISION", "Unknown revision")

hearts = [
    "\U0001F49C",  # Purple.
    "\U0001F499",  # Blue.
    "\U0001F49A",  # Red.
]

website = Flask(__name__)


def get_content() -> str:
    cp = hearts.copy()
    random.shuffle(cp)
    return " ".join(cp)


@website.route("/")
def index() -> str:
    return render_template("base.html", content=get_content(), revision=revision)
