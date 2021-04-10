from flask import Flask

website = Flask(__name__)


@website.route("/")
def index() -> str:
    return "\U0001F49C"  # Purple heart emoji!
