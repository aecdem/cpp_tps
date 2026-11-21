# TP 2 - Comprendre la compilation

## Generation de fichier objet de math.c et main.c

```bash
gcc -c -g -save-temps math.c -o math.o
gcc -c -g -save-temps main.c -o main.o
```
## Linker et generer l'executable

```bash
gcc math.o main.o -o calcul
./calcul
```
