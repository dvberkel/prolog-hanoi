# prolog-hanoi
Towers of Hanoi in Prolog

## Description
The [towers of Hanoi][hanoi]

> a mathematical game or puzzle. It consists of three rods and a number of disks of different sizes, which can slide onto any rod. The puzzle starts with the disks in a neat stack in ascending order of size on one rod, the smallest at the top, thus making a conical shape.
>
> The objective of the puzzle is to move the entire stack to another rod, obeying the following simple rules:>
>
> * Only one disk can be moved at a time.
> * Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack or on an empty rod.
> * No disk may be placed on top of a smaller disk.

## Idea
As described in the [wikipedia page][hanoi] the towers of Hanoi allow a recursive solution. If you want to move a tower of `n` disks from pole `X` to pole `Z` using pole `Y` as an auxiliary pole, then you can proceed as follows

1. Move a tower of `n-1` disks from pole `X` to pole `Y` using pole `Z` as an auxiliary pole.
2. Move the largest disk from pole `X` to pole `Z`.
3. Move a tower of `n-1` disks from pole `Y` to pole `Z` using pole `X` as an auxiliary pole.

The base case is to move a "tower" of 1 disk from pole `X` to pole `Z` with pole `Y` as an auxiliary pole.

If you think hard about this suggestion you will notice that restrictions of the puzzle are always met. Furthermore the roles of the poles are symmetric and can changes roles.

### Example
To demonstrate the algorithm, we will perform it by hand for a tower of three disks.

```plain
| X     | Y    | Z       | Stack | Step         | Path   |
|--------------------------------------------------------|
| 1,2,3 |      |         |       | move 3 X Y Z |        |
| 1,2,3 |      |         | 1     | move 2 X Z Y |        |
| 2,3   |      | 1       | 1.1   | move 1 X Y Z | [X, Z] |
| 3     | 2    | 1       | 1.2   |              | [X, Y] |
| 3     | 1, 2 |         | 1.3   | move 1 Z Y X | [Z, Y] |
|       | 1, 2 | 3       | 2     |              | [X, Z] |
|       | 1, 2 | 3       | 3     | move 2 Y X Z |        |
| 1     | 2    | 3       | 3.1   | move 1 Y Z X | [Y, X] |
| 1     |      | 2, 3    | 3.2   |              | [Y, Z] |
|       |      | 1, 2, 3 | 3.3   | move 1 X Y Z | [X, Z] |
```

## Usage
I am using [SWI-Prolog][swi-prolog]. Once installed you can run a [REPL][repl] by executing `swipl`. If you do this in the directory you cloned this repository to, loading will be easier.

Load the `hanoi.pl` file at the REPL prompt.

```plain
?- [hanoi].
true.
```

The system is now ready to answer questions about the towers of Hanoi.

[hanoi]: https://en.wikipedia.org/wiki/Tower_of_Hanoi
[swi-prolog]: http://www.swi-prolog.org/
[repl]: https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop
