import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(VaporGoogleCloudTts.allTests),
    ]
}
#endif
