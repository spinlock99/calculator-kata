calculator-kata
===============

A kata is a short exercise to sharpen your skills. In this kata, I've created a toy calculator
(and specs!).

Calculator Kata
 Create a calculator that is initialized with a string expression
   - detail: The expression is of the form digits separated by commas: "1,2"
   - detail: The expression is accessed by a method named expr
   - detail: The expression can be reset for evaluation at any time without re-initializing
   - example: Calculator.new "1,2"

 completed (Y|n): y

Add Method
 Create an add method that sums the string expression
   - detail: The method will return the sum of the digits
   - detail: The expression can contain 0, 1 or 2 numbers
   - detail: Then empty string will return 0
   - example: "" computes to 0
   - example: "1" computes to 1
   - example: "1,2" computes to 3

 completed (Y|n):

 Allow the expression to contain an unknown amount of numbers
   - example: "1,2,3" computes to 6
   - example: "1,2,5,8" computes to 16

 completed (Y|n):

Diff Method
 Create a diff method that computes the consecutive differences
   - detail: The expression must contain at least 2 digits
   - example: "1,0" compues to 1
   - example: "3,2,1" computes to 0
   - example: "5,4,3,2,1 computes to -5
   - detail: Expressions with less than 2 digits raise an exception
   - example: "" or "5"

 completed (Y|n):

Prod Method
 Create a prod method that computes the multiples in the expression
   - detail: The method will return the product of the numbers
   - example: "0" computes to 0
   - example: "2,1" computes to 2
   - example: "3,2,1" computes to 6

 completed (Y|n):

Div Method
 Create a div method that computes the consecutive divisions in the expression
   - detail: The method will return the final quotient of the numbers
   - detail: it will raise an exception if the expression contains the number 0
   - example: "2,1" computes to 2
   - example: "3,2,1" computes to 1
   - example: "1,2,3" computes to 0

 completed (Y|n):

Congratulations!

- Create a calculator that is initialized with a string expression         01:15:02
- Create an add method that sums the string expression                     14:34:41
- Allow the expression to contain an unknown amount of numbers             00:04:33
- Create a diff method that computes the consecutive differences           00:06:14
- Create a prod method that computes the multiples in the expression       00:20:07
- Create a div method that computes the consecutive divisions in the exp   00:11:54

----------------------------------------------------------------------     --------
Total Time taking Calculator kata:                                         16:32:31
