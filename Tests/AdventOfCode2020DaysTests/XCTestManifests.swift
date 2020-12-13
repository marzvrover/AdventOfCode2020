import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Day5Tests.allTests),
        testCase(Day6Tests.allTests),
        testCase(Day7Tests.allTests),
        testCase(Day8Tests.allTests),
        testCase(Day9Tests.allTests),
        testCase(Day10Tests.allTests),
        testCase(Day11Tests.allTests),
        testCase(Day12Tests.allTests),
    ]
}
#endif
