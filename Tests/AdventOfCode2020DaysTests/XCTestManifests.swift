import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Day5Tests.allTests),
        testCase(Day6Tests.allTests),
    ]
}
#endif
