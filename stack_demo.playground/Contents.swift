
/*
 @author : mdadil2019
 @date   : 7 Dec 2019
 @topic  : Stack
 
 @questions :
    1. Why using struct instead of class?
    2. What is <T> ?
    3. What is @discardableResult
    4. Why using mutating keyword with function declaration?
    5. What is CustomStringConvertible?

 @answers :
   1. Structs are value type which means once they are created, the value in the memory for all the variables are initialized and will not be changed later(immutable), so it's good choice when we just need to hold the data.

   2. You must be fimiliar with Generics in swift, T here indicates the associated type which means the data type can be anything (Int, Double, Custom Object)

   3. @discardableResult itself indicates that we are specifying that we don't care about the return value of the function

   4. Since struct are value type, means we are can't change the value of it's instance, Using the mutating keyword, we ask to make new copy of the variable (mutate the variable) for the struct where the new values will be written to a completely new copy the variable
       Note: for in-depth explanation, watch this talk from 12:20 https://youtu.be/7AqXBuJOJkY

   5. CustomStringConvertible is to repreesnt the instance when it's printed in string format. It is same like .toString() method in Java. Generally we use this to provide a way to represent the instance in string format.
*/

struct Stack<T>: CustomStringConvertible{
    private var values : [T] = []
    
    mutating func push(element : T){
        values.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T?{
        values.popLast()
    }
    
    func peek()->T?{
        values.last
    }
    
    var description: String {
        values.map {
            "\($0)"
        }.reversed()
        .joined(separator: "\n")
    }
}



var stack = Stack<Int>()
stack.push(element: 1)
stack.push(element: 2)
stack.push(element: 3)
stack.pop()

stack.push(element: 4)
stack.pop()

stack.push(element: 5)

print("\(stack.description)")



/*
 @practice :
    1. Write a program to know the balancing of paranthesis (should return true if balanced or should return false if not balanced)
 
    eg, Hello(World) , Hello((World)
 */



