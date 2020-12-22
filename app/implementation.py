from flask import Flask

website = Flask(__name__)


@website.route("/")
def index() -> str:
    return "Flask says hello"
