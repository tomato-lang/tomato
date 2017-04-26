# Tomato

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


A stack-based esoteric programming language based on interleaving consonants and vowels.

For the spec, look at `docs/spec.md` or [the Google Doc](https://docs.google.com/document/d/14XCGxxTl6gx-KgIfKN5i6Ix4whVovMwSvNLOdOOnblI/edit).

## Concept

Tomato is a stack-based language where consonants and vowels alternate. Consonants are the main function while vowels modify functions or add to their functionality.

The stack can consist of integers, strings, booleans, or characters (which are just one-length strings).

Commands are represented by one of three things: a consonant and one or more vowels, the letters y or Y (which are neither), or a literal or loop. Commands can modify values on the stack, compare them and act as tests, or perform operations using other commands.

Commands are executed from left to right. Bare literals, when encountered, are pushed to the stack. At the end of the program, the topmost value in the stack is implicitly printed.

Most commands are reversible. The “U” modifier reverses their function. This makes the amount of possible commands larger. It also allows for powerful modifications, like taking logarithms with “QU”.

## Repository structure

Code is in `/code`. Documentation is in `/docs`. Extra files are in `/etc`.

## Contributing

Feel free to submit pull requests. I will approve and merge them.
