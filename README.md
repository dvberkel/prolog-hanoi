# prolog-hanoi
Towers of Hanoi in Prolog

## Description
The [towers of Hanoi][hanoi]

> a mathematical game or puzzle. It consists of three rods and a number of disks of different sizes, which can slide onto any rod. The puzzle starts with the disks in a neat stack in ascending order of size on one rod, the smallest at the top, thus making a conical shape.
>
> The objective of the puzzle is to move the entire stack to another rod, obeying the following simple rules:
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

| X     | Y    | Z       | Stack | Term         | Segment   |
|-------|------|---------|-------|--------------|-----------|
| 1,2,3 |      |         |       | move 3 X Y Z |           |
| 1,2,3 |      |         | 1     | move 2 X Z Y |           |
| 2,3   |      | 1       | 1.1   | move 1 X Y Z | [X, Z]    |
| 3     | 2    | 1       | 1.2   |              | [X, Y]    |
| 3     | 1, 2 |         | 1.3   | move 1 Z Y X | [Z, Y]    |
|       | 1, 2 | 3       | 2     |              | [X, Z]    |
|       | 1, 2 | 3       | 3     | move 2 Y X Z |           |
| 1     | 2    | 3       | 3.1   | move 1 Y Z X | [Y, X]    |
| 1     |      | 2, 3    | 3.2   |              | [Y, Z]    |
|       |      | 1, 2, 3 | 3.3   | move 1 X Y Z | [X, Z]    |

In the first three columns you will find the contents of poles `X`, `Y` and `Z` respectively. It contains a comma separated list of disks. A disk is represented by its diameter.

The stack column shows which phase of the algorithm is being executed. The first row is empty, and each subsequent row indicates which of the phase in the algorithm is performed. A dot indicate on level of recursion. E.g. `1.2` indicated that we are in phase 1 for `move 3 X Y Z` part of the algorithm, and in phase 2 of the `move 2 X Z Y` algorithm.

The term column shows the corresponding term that we are considering.

The segment column shows the path segment we are executing. When one reads the segment from top to bottom, one retrieves the solution to the puzzle.

## Translation
We will translate the idea into Prolog. I will be using [SWI-Prolog][swi-prolog].

Prolog concerns it self with facts. The fact that we will consider is the following:

> given a number of disks `N` a start pole `X`, an auxiliary pole `Y` and a target pole `Z`, `P` is the solution that moves the `N` disk tower from pole `X` to pole `Z` with auxiliary pole `Y`.

The term that we will use it `move(N, X, Y, Z, P)`.

The base case of the recursion corresponds to the the following fact.

```prolog
move(1, X, _, Z, [[X, Z]]).
```

The recursive step corresponds ot the rule

```prolog
move(N, X, Y, Z, P) :-    /* To move N disks from X to Z                 */
    M is (N - 1),         /* we first must move the smaller N-1 disks    */
    move(M, X, Z, Y, P1), /* from X to Y                                 */
    move(1, X, Y, Z, P2), /* then move the largest disk from X to Z      */
    move(M, Y, X, Z, P3), /* then move the smaller N-1 disks form Y to Z */
    append(P1, P2, Q),    /* we get the corresponding solution           */
    append(Q, P3, P).     /* by appding all the steps.                   */
```

## Usage
I am using [SWI-Prolog][swi-prolog]. Once installed you can run a [REPL][repl] by executing `swipl`. If you do this in the directory you cloned this repository to, loading will be easier.

Load the `hanoi.pl` file at the REPL prompt.

```plain
?- [hanoi].
true.
```

The system is now ready to answer questions about the towers of Hanoi.

## Generalization
The towers of Hanoi can be generalized. So instead of using only 3 rods, one could use `k` number of rods, where `k>=3`. Notice that the `k=2` case can only be solved with one disk.

For the generalized problem one could use the [Frame-Stewart algorithm][stewart] algorithm. It is [proven][stewart-proof] to be optimal by Roberto Demontis. The _Frame-Stewart_ algorithm is

1. Move top `m` disks on a free pole, other than the target pole.
2. Transfer the remaining `n-m` disks to the target pole without using the pole which holds the top `m` disks.
3. Move top 'm' disks from it's pole to the target pole.

[hanoi]: https://en.wikipedia.org/wiki/Tower_of_Hanoi
[swi-prolog]: http://www.swi-prolog.org/
[repl]: https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop
[stewart]: https://en.wikipedia.org/wiki/Tower_of_Hanoi#With_four_pegs_and_beyond
[stewart-proof]: https://arxiv.org/pdf/1203.3280.pdf
