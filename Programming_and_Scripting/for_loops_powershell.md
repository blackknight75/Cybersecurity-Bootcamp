# FOR Loops in PowerShell

In the context of for loops, we engage in a process known as iteration, where we sequentially access each element within a collection. Specifically, when iterating over a directory (represented by `$directory`), the for loop systematically traverses each item contained within this collection. It is important to note that the loop cannot process all elements simultaneously; instead, it requires a temporary variable to act as an intermediary, holding each individual item under scrutiny during a single iteration cycle. In the provided example, `$item` serves as this intermediary variable, temporarily storing each element from `$directory` as the loop progresses through its cycle. Actions defined within the `<script block>` are applied to `$item`, affecting each element within the directory in turn.

Consider a practical example involving a collection of strings:
```powershell
$strings = "a", "b", "c"
```
In constructing a for loop to process `$strings`, we designate a temporary placeholder variable to represent each string during the loop's execution. This placeholder, which can be arbitrarily named, facilitates direct manipulation of each string within the collection. For instance:
```powershell
$strings = "a", "b", "c"
foreach ($letter in $strings) {
    # Execute an operation on $letter
}
```
During each iteration, `$letter` assumes the value of the current element within the collection, sequentially adopting the values "a", "b", and "c". This mechanism underscores the iterative nature of for loops, enabling targeted operations on individual elements within a collection.
