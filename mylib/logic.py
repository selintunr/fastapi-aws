import wikipedia


def wiki(name="War Goddess", lenght=1):
    """This is a wikipedia fetcher"""

    my_wiki = wikipedia.summary(name, lenght)
    return my_wiki
