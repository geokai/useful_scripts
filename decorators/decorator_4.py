"""Adding arguments to decorators"""


def info(arg1, arg2):
    """Info func passes arguments"""
    print('Decorator arg1 = ' + str(arg1))
    print('Decorator arg2 = ' + str(arg2))

    def the_real_decorator(function):
        """Decorator function"""
        def wrapper(*args, **kwargs):
            """Decorator wrapper - the actual decorator"""
            print('S: Function {} args: {} kwargs: {}'.format(
                function.__name__, str(args), str(kwargs)))
            return function(*args, **kwargs)

        return wrapper

    return the_real_decorator

def doubler(number):
    """Doubles the number passed to it."""
    return number * 2

# @info(3, 'Python')
# decorator = info(3, 'Python')(doubler)

decorator_function = info(3, 'Python')
print('1: {}'.format(decorator_function))

actual_decorator = decorator_function(doubler)
print('2: {}'.format(actual_decorator))

# Call the decorator function:
print('3: {}'.format(actual_decorator(6)))

# print('space')
# print(decorator(5))
