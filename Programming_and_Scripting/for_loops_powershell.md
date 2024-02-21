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

## Adding Conditionals

Adding conditionals to a foreach loop allows you to execute specific operations based on certain criteria or conditions for each item in the collection. In PowerShell, this is commonly done using if statements within the loop to check each element against a condition and execute corresponding actions.  
  
Given the code block above:

```powershell
$strings = "a", "b", "c"
foreach ($letter in $strings) {
    # Execute an operation on $letter
}
```
Let's say you want to perform a different operation depending on whether the letter is "a", "b", or "c". You can integrate if statements into the loop to accomplish this.

### Adding a Simple Conditional
Here's an example of adding a simple conditional to perform a check on each $letter:

```powershell
$strings = "a", "b", "c"
foreach ($letter in $strings) {
    if ($letter -eq "a") {
        Write-Host "Letter is a"
    } else {
        Write-Host "Letter is not a"
    }
}
```
In this example, the script checks if the current $letter is "a". If the condition is true ($letter -eq "a"), it executes the first block (Write-Host "Letter is a"); otherwise, it executes the else block.  
  
`Write-Host` is a PowerShell cmdlet that outputs text to the console (or host window). It's specifically designed to display information directly to the user. When you use 
`Write-Host`, the output is intended for the human eye, not for piping or redirecting to files or other commands. It's primarily used for writing informational messages, debugging output, or any other text that should be seen by the user but not processed further by the script.

### Incorporating Complex Logic
Conditionals can be more complex and include logical operators (-and, -or, -not), allowing for more nuanced checks:

```powershell
$strings = "a", "b", "c", "d"
foreach ($letter in $strings) {
    if ($letter -eq "a" -or $letter -eq "b") {
        Write-Host "$letter is in the first half of the alphabet"
    } elseif ($letter -eq "c" -or $letter -eq "d") {
        Write-Host "$letter is in the second half of the alphabet"
    } else {
        Write-Host "$letter is not in the considered range"
    }
}
```
In this expanded example, each letter is checked against multiple conditions to determine its grouping in the alphabet. This approach demonstrates how conditional logic can be used to differentiate actions based on complex criteria.
