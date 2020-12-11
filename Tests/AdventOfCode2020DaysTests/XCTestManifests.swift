import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AdventOfCode2020DaysTests.allTests),
    ]
}
#endif
