import urllib.request

for x in range(100):
    print(str(x))
    urllib.request.urlretrieve("https://picsum.photos/100", "random" + str(x) + ".jpg")
