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
