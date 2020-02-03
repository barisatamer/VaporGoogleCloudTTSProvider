import XCTest
@testable import vapor_google_cloud_tts

final class vapor_google_cloud_ttsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(vapor_google_cloud_tts().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
