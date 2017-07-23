"""Adding arguments to decorators"""


def info(arg1, arg2):
    print('Decorator arg1 = ' + str(arg1))
    print('Decorator arg2 = ' + str(arg2))

    def the_real_decorator(function):

        def wrapper(*args, **kwargs):
            print('Function {} args: {} kwargs: {}'.format(
                function.__name__, str(args), str(kwargs)))
            return function(*args, **kwargs)

        return wrapper

    return the_real_decorator

def doubler(number):
    """Doubles the number passed to it."""
    return number * 2

# @info(3, 'Python')
decorator = info(3, 'Python')(doubler)

print('space')
print(decorator(5))

