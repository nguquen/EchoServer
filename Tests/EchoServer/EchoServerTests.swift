import XCTest
@testable import EchoServer

class EchoServerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(EchoServer().text, "Hello, World!")
    }


    static var allTests : [(String, (EchoServerTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
