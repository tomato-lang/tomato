# Tomato
Esoteric Programming Language

## Concept
Tomato is a stack-based language where consonants and vowels alternate. Consonants are the main function while vowels modify functions or add to their functionality. 

The stack can consist of integers, strings, or characters (which are just one-length strings).

Commands are represented by one of three things: a consonant and one or more vowels, the letters y or Y (which are neither), or a literal or loop. Commands can modify values on the stack, compare them and act as tests, or perform operations using other commands. 

Commands are executed from left to right. Bare literals, when encountered, are pushed to the stack. At the end of the program, the topmost value in the stack is implicitly printed.

Most commands are reversible. The “U” modifier reverses their function. This makes the amount of possible commands larger. It also allows for powerful modifications, like taking logarithms with “QU”. 

Some commands apply only to integers, characters, or strings. Attempting to use one of these commands on the wrong type will result in either runtime errors or undefined results.

A divide or mod by 0, or a log base <= 1 will result in a runtime error.

Line feed characters are ignored, and used for organization purposes only.

## Commands

### Consonants (functions)

|Command|Description|Command|Description|
|---|---|---|---|
|`b`|Pop two elements, push bitwise xor|`B`|Pops a string, reads a file with that name, then pushes its contents. Reversed: Pops a string, creates a file with that name, pops another string, and writes it to that file.|
|`c`|Pop a character and push its char code, or pop a string and push the integer it results in when converted to base 256 using ASCII|`C`|Pop an integer, then pop that many items and concatenate them into a string, or pop a string, and push its individual chars.|
|`d`|Convert the topmost value to an integer.|`D`|Convert the topmost value to a string.|
|`f`|Randomly shuffle the stack.|`F`|Pop a value, cast it to a string if it isn’t one, and push its length.|
|`g`|Test if the stack is empty.|`G`|Push an Ascii Art Tomato. Shown below.|
|`h`|Pop an element. Push the element divided by 2. For strings, push half the string rounding up.|`H`|Push “Hello, World!”|
|`j`|Execute the top value in the stack as code in the shell. Result is pushed onto the stack. (Runs in bash)|`J`|Pop a value, then end the program with the status code of that value if it’s an int or 0 otherwise. (Letter chosen due to lack of other available letters.)|
|`k`|Push the stack’s length.|`K`|Swap the top two values of the stack (if there are two or more)|
|`l`|Pop two values and test if they are equal.|`L`|Pop two values and test if the first is less than the second.|
|`m`|Pop two values and push their sum.|`M`|Pop two values and push their product.|
|`n`|Negate the top value in the stack.|`N`|Perform  bitwise not on the top value in the stack.|
|`p`|Pop an element off the stack and push it back on.|`P`|Pop an element off the stack.|
|`q`|Pop an int, sleep that many milliseconds.|`Q`|Pop two values x and y, push xy.|
|`r`|Pop the bottom-most value and push it onto the top. (Rotate stack)|`R`|Transpose top two values of the stack.|
|`s`|Sort the stack using the sorting order.|`S`|Reverse the stack.|
|`t`|Test if the top value in the stack is falsy (0, “0”, empty string, space)|`T`|Pop two values x and y. Push the y’th root of x.|
|`v`|Pop a value. If it is a string, evaluate as code. |`V`|Push the program’s code onto the stack.|
|`w`|Pop a value and test if it is or starts with a vowel.|`W`|Pop a value and test that it is or starts with an alphanumeric character.|
|`x`|Clear the stack.|`X`|Pop a string, push its downcased version.|
|`z`|Pop two values, x and y, push x modulo y.|`Z`|Push a random number from 0 to 232.|

### Vowels (modifiers)

|Command|Description|Command|Description|
|-------|-----------|-------|-----------|
`a`|Function peeks instead of popping|`A`|Debug, print the actions taken to stderr
`e`|Pop an int before operating and perform the function that many times, or once if it’s not a number.|`E`|If the top of the stack is a boolean, pop it, only execute the command if it is equal to true. Else, treat as o.
`i`|Print the value instead of pushing it.|Equivalent to oY|`I`|Take Input instead of popping. Operations that pop n times take input n times.
`o`|No modifier|`O`|If a falsey value would be pushed, push nothing instead
`u`|Operate on the bottom of the stack instead|`U`|Negate the operation (only valid in some cases)

### Other

|Command|Description|Command|Description|
|---|---|---|---|
|y|Read one line of input from stdin to top of stack, or push 0 on EOF|Y|Pop top of stack and print to stdout. No newline added.|

## Literals

### String literals

    "These string literals are cool! You can even use \nescapes\nin\tthem!"

### Number literals
Just numbers

    12345

### Character literal
    'c

### Boolean literals

True is `.`
False is `,`
Output as `true` and `false`

## Control flow

### Loops

    {`test`:`code to run`}
    
The loop control flow works approximately like this:

1. The test is run.
2. A value is popped from the stack. 
  * If the value is truthy, the code is run, then the loop restarts.
  * If the value is falsey, the loop terminates.
  
### Conditionals

    ?(`code if test succeeds`):(`code if test fails`)

Works approximately like the ternary operator in C-like languages. The question mark pops a boolean, runs the first code if it is true, and runs the second code if it is false.

### Comments 

A comment starting at the beginning of a line may be started with #. This is mostly useful for Unix-like systems’ “shebang” convention.

    #!/usr/local/bin/tomato
    `This is a comment. It is completely ignored.`

### ASCII art tomato

                	/``\_
             _.-`| \ ``._
         .-''`-.       _.'`.
       .'      / /'\/`.\    `.
      /        |/             \
     '                         ;
    :                          :
    ;                          .
     '                        /
      \                     .'
       `.                 .'
         `-..___....----`


### Sorting order

(bottom)  
Numeric values, sorted numerically.  
Strings Alphabetically, longer strings being sorted after their shorter counterparts.  
(top)

### Language suggestions
If you have any language suggestions, please add them as issues, pull requests, or in the Google Doc.
