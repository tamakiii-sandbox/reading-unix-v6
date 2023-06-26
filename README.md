# reading-unix-v6
- https://github.com/memnoth/unix-v6
- http://simh.trailing-edge.com/
- http://www.lemis.com/grog/Documentation/Lions/
- https://minnie.tuhs.org/cgi-bin/utree.pl

## How to use
```sh
make -f docker.mk setup build pdp11
```
```sh
@unix

login: root
# ls -lsah
```

> To halt the system type sync a couple of times, stop and quit the emulator:

```sh
# sync
# sync
# sync
^E
Simulation stopped, PC: 021630 (MOV (SP)+,177776)
sim> exit
Goodbye
```
