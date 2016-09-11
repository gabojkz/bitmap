## Synopsis

This is a Ruby 2.3 program that simulates a basic and interactive bitmap editor.

## Installation

To run this program you may need:

* Ruby 2.3 
* Rspec 3.5.2

## Usage

This program accepts a list of commands followed by some arguments to generate a new bitmap image that will be displayed on the console.

## Example 

Program running: 

```
> I 5 6
OOOOO
OOOOO
OOOOO
OOOOO
OOOOO
OOOOO
> L 2 3 A
> S
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
> V 2 3 6 W
> H 3 5 2 Z
> S
OOOOO
OOZZZ
OWOOO
OWOOO
OWOOO
OWOOO
```

## Tests

To run a test find the files on the folder spec an run each test seperately ;).

## License

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished.
