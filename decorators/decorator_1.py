"""A script showing how to use decorators in Python"""

def doubler(number):
    """Doubles the number passed to it."""
    return number * 2

print()
print(doubler)

print(doubler(10))

# print(doubler.__name__)

# print(doubler.__sizeof__)
print()
print('-' * 16)
print()


# the decorator:

def info(func):
    def wrapper(*args):
        print('Function name: ' + func.__name__)
        print('Function docstring: ' + str(func.__doc__))
        return func(*args)
    return wrapper

my_dec_dblr = info(doubler)
print(my_dec_dblr (2))
print()

