from main import add


def test_add():
    assert add(100, 99) == 199
    assert isinstance(add(100, 3), int)
