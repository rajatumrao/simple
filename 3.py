def get_val(obj, key):
    keys = key.split("/")

    val = None
    for k in keys:
        if type(obj) is dict and k in obj.keys():
            val = obj.get(k)
            obj = val
        else:
            raise Exception("Wrong key passed")

    return val


obj = {"a": {"b": {"c": {"d": "e"}}}}
key = "a/b/c/d"
print(get_val(obj, key))
