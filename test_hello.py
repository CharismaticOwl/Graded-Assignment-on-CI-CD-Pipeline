# test_hello.py
# importing the application
from app import app

# defning a test case
def test_hello():
    response = app.test_client().get('/')

    # exprected results are status 200 and a data hello world
    assert response.status_code == 200
    assert response.data == b'Hello, World!'