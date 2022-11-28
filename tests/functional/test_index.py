
def test_index(client):
    response = client.get("/", follow_redirects=True)
    assert response.status_code == 200
    assert b'Hello DHBW' in response.data

def test_hello(client):
    response = client.post("/hello", data=dict(name="LeL"))
    assert response.status_code == 200
    assert b'LeL' in response.data
