# Trabalho Prático 4

Aqui se encontrará o quarto trabalho prático de Algoritmos e Estruturas de
Dados 2 (1610100) de 2024/2.

## Resultados

Todos os exercícios resultaram em corretude de 100% segundo o Verde e, segundo
o [Valgrind](https://valgrind.org/), nenhum vazamento de memória é possível em
nenhuma das questões escritas em C.

## Como testar

### Como testar a corretude

É possível executar todos os testes, verificando se a saída do programa
corresponde com as saídas esperadas pelo
[Verde](http://verde.icei.pucminas.br), tendo instalado e configurado um
[compilador de C](https://clang.llvm.org/), um [kit de desenvolvimento
Java](https://openjdk.org/), [GNU Make](https://www.gnu.org/software/make/), e
o [Valgrind](https://valgrind.org/). Basta clonar esse repositório e, na raiz,
executar o comando abaixo:

```bash
make
```

Dependendo do seu sistema, pode ser nececssário instalar
[GNU Diffutils](https://www.gnu.org/software/diffutils) e, opcionalmente,
[colordiff](https://www.colordiff.org/).

Para cada teste que tiver sucesso, você verá uma linha semelhante a essa:

```txt
Files pub.out and teste.out are identical
```

Se todos os testes tiverem sucesso, você verá algo assim:

```txt
Testando 01. Árvore Binária:
	javac -Xlint -Xdiags:verbose -g ArvoreBinaria.java
	java ArvoreBinaria ../pokemon.csv < pub.in > teste.out
	Files pub.out and teste.out are identical

Testando 02. Árvore Binária de Árvore Binárias:
	javac -Xlint -Xdiags:verbose -g ArvoreArvore.java
	java ArvoreArvore ../pokemon.csv < pub.in > teste.out
	Files pub.out and teste.out are identical

Testando 03. Árvore AVL:
	clang -Werror -Wall -Wextra -pedantic -O3 -g --debug --std=c99  -lm  avl.c   -o avl
	valgrind --leak-check=full --log-file=valgrind_report.txt ./avl ../pokemon.csv < pub.in > teste.out
	Files pub.out and teste.out are identical

Testando 04. Árvore Alvinegra:
	javac -Xlint -Xdiags:verbose -g Alvinegra.java
	java Alvinegra ../pokemon.csv < pub.in > teste.out
	Files pub.out and teste.out are identical

Testando 05. Tabela Hash Direta com Reserva:
	javac -Xlint -Xdiags:verbose -g HashDiretaReserva.java
	java HashDiretaReserva ../pokemon.csv < pub.in > teste.out
	Files pub.out and teste.out are identical

Testando 06. Tabela Hash Direta com Rehash:
	javac -Xlint -Xdiags:verbose -g HashDiretaRehash.java
	java HashDiretaRehash ../pokemon.csv < pub.in > teste.out
	Files pub.out and teste.out are identical

Testando 07. Tabela Hash Indireta com Lista Simples:
	clang -Werror -Wall -Wextra -pedantic -O3 -g --debug --std=c99  -lm  hash_indireta.c   -o hash_indireta
	valgrind --leak-check=full --log-file=valgrind_report.txt ./hash_indireta ../pokemon.csv < pub.in > teste.out
	Files pub.out and teste.out are identical
```

Se algum teste falhar, a execução terminará imediatamente com a seguinte linha
(ou semelhante):

```txt
make: *** [../config.mk:37: testjava] Error 1
```

### Como verificar vazamentos de memória

Basta executar, na raiz:

```bash
make report
```

Para cada questão escrita em C, você deverá ver linhas como essas:

```txt
Command: ./hash_indireta ../pokemon.csv
All heap blocks were freed -- no leaks are possible
```

Eis um exemplo de saída possível, se todos os testes tiverem sucesso:

```txt
==3303628== Memcheck, a memory error detector
==3303628== Copyright (C) 2002-2024, and GNU GPL'd, by Julian Seward et al.
==3303628== Using Valgrind-3.24.0 and LibVEX; rerun with -h for copyright info
==3303628== Command: ./avl ../pokemon.csv
==3303628== Parent PID: 3303627
==3303628==
==3303628==
==3303628== HEAP SUMMARY:
==3303628==     in use at exit: 0 bytes in 0 blocks
==3303628==   total heap usage: 5,586 allocs, 5,586 frees, 134,320 bytes allocated
==3303628==
==3303628== All heap blocks were freed -- no leaks are possible
==3303628==
==3303628== For lists of detected and suppressed errors, rerun with: -s
==3303628== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
==3303768== Memcheck, a memory error detector
==3303768== Copyright (C) 2002-2024, and GNU GPL'd, by Julian Seward et al.
==3303768== Using Valgrind-3.24.0 and LibVEX; rerun with -h for copyright info
==3303768== Command: ./hash_indireta ../pokemon.csv
==3303768== Parent PID: 3303767
==3303768==
==3303768==
==3303768== HEAP SUMMARY:
==3303768==     in use at exit: 0 bytes in 0 blocks
==3303768==   total heap usage: 5,630 allocs, 5,630 frees, 134,360 bytes allocated
==3303768==
==3303768== All heap blocks were freed -- no leaks are possible
==3303768==
==3303768== For lists of detected and suppressed errors, rerun with: -s
==3303768== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```
