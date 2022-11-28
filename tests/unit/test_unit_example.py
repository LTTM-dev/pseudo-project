from app import add, getMessage

def test_add():
    result = add(1, 2)
    assert result == 3

def test_getMessage():
    result = getMessage()
    assert result == "It's a beautiful day. I'm glad you're here."