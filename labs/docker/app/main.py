"""A tiny service, so the Dockerfile has something real to build."""
import os
from flask import Flask, jsonify

app = Flask(__name__)
VERSION = os.getenv("APP_VERSION", "1.0.0")


@app.get("/health")
def health():
    """The endpoint a load balancer target group calls."""
    return jsonify(status="ok", version=VERSION)


@app.get("/")
def index():
    return jsonify(message="hello from the app tier", version=VERSION)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
