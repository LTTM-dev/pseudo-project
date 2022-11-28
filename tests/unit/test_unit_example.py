from app import add, get_message

def test_add():
    result = add(1, 2)
    assert result == 3

def test_get_message():
    result = get_message()
    assert result == "It's a beautiful day. I'm glad you're here."