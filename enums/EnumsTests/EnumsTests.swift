//
// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

class EnumsTests: XCTestCase
{
    func testAssociatedValues() {
        print(Garment.tie)
        print(Garment.shirt(size: "XL"))
        print(Garment.pants(waist: 32, inseam: 34))
        
        let items: [Garment] = [.tie,
                                .shirt(size: "XL"),
                                .pants(waist: 32, inseam: 34)]
        for item in items {
            print(item)
        }
        print(items)
    }
    
    func testFilter() {
        let garments = [
            Garment.tie,
            Garment.shirt(size: "XL"),
            Garment.pants(waist: 32, inseam: 34)
        ]
        
        let garment = garments.filter {
            $0 == .tie
        }
        print(garment)
    }
    
//    func testGeometry() {
//        let origin = Geometry.Point(x: 10, y: 20)
//        let size = Geometry.Size(width: 20, height: 40)
//        print(origin)
//        print(size)
//    }
}
