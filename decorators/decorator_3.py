"""Using stacked decorators"""

def bold(func):
    """Decorator function"""
    def wrapper():
        """Decorator wrapper - the actual decorator"""
        return "<b>" + func() + "</b>"
    return wrapper

def italic(func):
    """Decorator function"""
    def wrapper():
        """Decorator wrapper - the actual decorator"""
        return "<i>" + func() + "</i>"
    return wrapper

@bold
@italic
def formatted_text():
    """Returns some text"""
    return "Python Rocks!"

print()
print(formatted_text())
print()
