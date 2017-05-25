import time
import nyancat

cat = nyancat.Nyancat()

end = time.time() + 15
while time.time() < end:
    cat.run()
