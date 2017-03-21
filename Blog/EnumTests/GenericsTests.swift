//
// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest


// Response to Stackoverflow question:
// http://stackoverflow.com/questions/42924481/swift-func-return-type-inheritting-class-and-conforming-one-or-more-protocols/42927968#42927968

protocol P1 {
}
extension P1 where Self : Aable {
    func myDesiredFunc() {
        print(self)
    }
}

protocol Aable {
}

class A: Aable {
}
class B1 : A, P1 {
}
class B2 : A, P1 {
}

func createBeeInstance(useB1: Bool) -> (Aable & P1) {
    return useB1 ? B1() : B2()
}


class GenericsTests: XCTestCase
{
    func testArray()
    {
        var things = [Aable & P1]()
        
        for i in 1...5 {
            let b = createBeeInstance(useB1: i % 2 == 0)
            things.append(b)
        }
        
        for thing in things {
            thing.myDesiredFunc()
        }
    }
}
