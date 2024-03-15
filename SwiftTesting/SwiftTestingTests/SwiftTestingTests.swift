//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by Ümit Türkmen on 15.03.2024.
//

import XCTest
@testable import SwiftTesting

final class SwiftTestingTests: XCTestCase {
    
    let math = MathFunc()
    
    func testAddFunc() {
        let result = math.sum(x: 5, y: 8)
        
        XCTAssertEqual(result, 13)
        
    }
    func test2() {
        let result = math.multi(x: 5, y: 8)
        
        XCTAssertEqual(result, 40)
        
        func test4() {
            let result = math.divide(x: 20, y: 4)
            
            XCTAssertEqual(result, 5)
            
        }
        
    }
}
