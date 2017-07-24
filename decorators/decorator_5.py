"""Decorator using 'partial' module"""

from functools import partial

def info(function, arg1, arg2):
    """Info func passes arguments"""
    print('Decorator arg1 = ' + str(arg1))
    print('Decorator arg2 = ' + str(arg2))

    def wrapper(*args, **kwargs):
        """Decorator wrapper - now in the actual decorator"""
        print('S: Function, {}. args: {}. kwargs: {}.'.format(
            function.__name__, str(args), str(kwargs)))
        return function(*args, **kwargs)

    return wrapper

decorator_with_arguments = partial(info, arg1=3, arg2='Py')

@decorator_with_arguments
def doubler(number):
    """Doubles the number passed to it."""
    doubled = number * 2
    return number, doubled

# print(doubler(9))
result = doubler(42)

print()
print(doubler.__doc__)
print('The double of {} is {}.'.format(result[0], result[1]))
print()
