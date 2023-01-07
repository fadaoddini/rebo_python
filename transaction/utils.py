def check_is_active(user):
    return user.is_active


def check_is_ok(user, pk):
    if user.pk == pk:
        return True
    return False
