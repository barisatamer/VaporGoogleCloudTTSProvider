import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(vapor_google_cloud_ttsTests.allTests),
    ]
}
#endif
