"""A script showing how to use decorators in Python"""


def info(func):
    """Decorator function"""
    def wrapper(*args):
        """Decorator wrapper - the actual decorator"""
        print('Function name: ' + func.__name__)
        print('Function docstring: ' + str(func.__doc__))
        return func(*args)
    return wrapper

@info
def doubler(number):
    """Doubles the number passed to it."""
    return number * 2

print(doubler(4))
