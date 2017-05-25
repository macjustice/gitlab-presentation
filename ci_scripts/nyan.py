from time import time
import nyancat

cat = nyancat.Nyancat()

end = time() + 15
while time() < end:
    cat.run()
