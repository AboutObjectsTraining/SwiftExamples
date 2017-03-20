//
// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

func area(size: (Double, Double)) -> Double {
    return size.0 * size.1
}

// Tuple parameter type difficult to read
func areaB(size: (width: Double, height: Double)) -> Double {
    return size.width * size.height
}

// Declare a typealias named 'Size'
typealias Size = (width: Double, height: Double)

// Using 'Size' typealias streamlines function prototype
func areaC(size: Size) -> Double {
    return size.width * size.height
}

func discounted(_ price: Double, _ discount: Double) -> (Double, Double) {
    let amount = price * discount
    return (price - amount, amount)
}

extension Double {
    func discounted(by discount: Double) -> (net: Double, savings: Double) {
        let amount = self * discount
        return (self - amount, amount)
    }
}

class TupleTests: XCTestCase
{
    func testTupleLiteral() {
        let temperature = (72, "Fahrenheit")
        print(temperature)   // prints "(72, "Fahrenheit")"
        print(temperature.0) // prints "72"
        print(temperature.1) // prints "Fahrenheit"
    }
    
    func testTuplePatternConstants() {
        let temperature = (72, "Fahrenheit")
        let (degrees, scale) = temperature
        print(degrees) // prints "72"
        print(scale)   // prints "Fahrenheit"
    }
    
    func testTupleWithLabels() {
        let temperature = (degrees: 72, scale: "Fahrenheit")
        print(temperature.degrees) // prints "72"
        print(temperature.scale)   // prints "Fahrenheit"
    }

    func testTupleTypeWithLabels() {
        let values = (72, "Fahrenheit")
        let temperature: (degrees: Int, scale: String) = values
        print(temperature.degrees) // prints "72"
        print(temperature.scale)   // prints "Fahrenheit"
    }
    
    func testTupleParameter() {
        let area1 = area(size: (12.5, 14))
        print(area1)
    }
    
    func testTupleReturnValueWithLabels() {
        let price = 25.0
        let amountSaved = price.discounted(by: 0.15).savings
        print(amountSaved)
    }
    
    func testTupleAsReturnValue() {
        let (price, discount) = discounted(25.00, 0.15)
        print(price)            // prints "21.25"
        print(discount)         // prints "3.75"

        var (foo, _) = (price, discount)
        foo += 1
        print("foo: \(foo)")
        
        let vals = discounted(12.00, 0.25)
        print(vals.0)
        print(vals.1)
    }
    
    func testLabels() {
        let item = (price: 19.99, quantity: 2)
        print("price: \(item.price), quantity: \(item.quantity)")
        
        let item2 = defaultItem
        print("price: \(item2.price), quantity: \(item2.quantity)")
        
        let (amount, number) = defaultItem
        print("price: \(amount), quantity: \(number)")
    }
    
    func testSwitch() {
        foo(item: (4.99, 2))
        foo(item: (2.95, 3))
        foo(item: (1.15, 5))
    }

    func testStuff() {
        let a = 1, b = "foo"
        print("a: \(a), b: \(b)")
        let (x, y) = (1, 2)
        print("x: \(x), y: \(y)")
    }
    
    func testStuff2() {
        let (x, y) = (0.5, "foo")
        print("x: \(x), y: \(y)")
    }
    
    func testIfCase() {
        let items = [(12.99, 2), (14.95, 3),(19.99, 2)]
        for item in items {
            // Unwraps amount and tests whether quantity is 2
            if case (let amount, 2) = item {
                print(amount)
            }
            if case let (amount, 2) = item {
                print(amount)
            }
        }
    }
    
    func testDictionaryIterator() {
        let dogInfo: [String: Any] = ["name": "Fido", "breed": "Lab", "age": 5]
        
        for (key, value) in dogInfo {
            print("\(key): \(value)")
        }
        // name: Fido
        // breed: Lab
        // age: 5
        
        for item in dogInfo {
            print("\(item.key): \(item.value)")
        }
        
        for case let (key, value) in dogInfo {
            print("\(key): \(value)")
        }
    }
    
    func testSwitchCase() {
        let items = [(12.99, 2), (14.95, 3),(19.99, 2)]
        for item in items {
            switch item {
            case (let p, 2):     print("2 items for $\(p * 2)")
            case (2.95, let q):  print("\(q) items at $2.95")
            case let (p, q):     print("\(q) items for $\(p * Double(q))")
            }
        }
    }
    
    func testSwitchCase2() {
        let discount1 = 10.0
        let discount2 = 14.0
        
        let items = [("Shirt", 44.99), ("Shoes", 89.99), ("Jeans", 64.99)]
        
        for item in items {
            switch item {
            case let ("Shirt", p):  print("Shirt: $\(p - discount1)")
            case let ("Shoes", p):  print("Shoes: $\(p - discount2)")
            case let (itemName, p): print("\(itemName): $\(p)")
            }
        }
        // Shirt: $34.99
        // Shoes: $75.99
        // Jeans: $64.99

    }
    
    var defaultItem: (price: Double, quantity: Int) {
        return (19.99, 2)
    }
}


func foo(item: (Double, Int)) {
    switch item {
    case (let p, 2):     print("2 items for $\(p * 2)")
    case (2.95, let q):  print("\(q) items at $2.95")
    case let (p, q):     print("\(q) items for $\(p * Double(q))")
    }
}
