

/*

 @topic : Queue
 
 @discussion :
    1. There are multiple ways we can represent the queue
        a) Array
        b) Two Stacks
        c) Ring Buffer
        d) Double Linked List
        e) Your own implementation (Umm!! try some other way)
 
 
 @questions :
    1. What is protocol and why should we use it?
    2. What is _ in parameter declaration
    3. What is ? : syntax
 
 
 @answers :
    1. Protocols are used to define the requirements which can be implemented by structures, classes or enums
    2. Whenever we declare a parameter in function, it's by default a named parameter in Swift which means that whenever
       we will be calling that function we need to mention the name of the paramter before passing the value for that
       argument.
    3. ? : is known as ternary operator which is shortcut of -> if else
 */


protocol Queue {
    associatedtype T
    mutating func enqueue(_ element : T)
    mutating func dequeue() -> T?
    mutating func peek()-> T?
    var isEmpty : Bool {get}
}

//@type : Array based implementation
struct QueueArray<T> : Queue, CustomStringConvertible {
    
    private var values : [T] = []
    
    mutating func enqueue(_ element: T) {
        values.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T?{
        return isEmpty ? nil : values.removeFirst()
    }
    
    mutating func peek() -> T? {
        return values.first
    }
    
    var isEmpty: Bool {
        return values.count == 0
    }
    
    var description: String {
        String(describing: values)
    }
    
}

var queue = QueueArray<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(6)
print("\(queue)")

queue.dequeue()
print("\(queue)")



/*
 @conclusion
    1. The queue implementation using array has some disadvantages
        a) Whenever you will try to dequeue element from the queue, it has to shift the complete array which means it's an O(n) operation and rearranging will also result in unused memory
        b) Enqueue in average case is O(1) operation since we are using append function
 
 @practice
    1. Implement the array queue for practice
    2. Try to improve the dequeue operation to have better time efficiency
 */

