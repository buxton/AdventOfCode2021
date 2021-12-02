import Foundation

// --- Day 1: Sonar Sweep ---

// MARK: Functions
func readValues() throws -> [Int] {
    guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else { fatalError() }

    let input = try String(contentsOf: fileUrl)

    return input.split(whereSeparator: \.isNewline).compactMap { Int($0) }
}

func summedValues(list: [Int]) -> Int {
    var increaseCount = 0
    var lastValue = list.first

    for value in list {
        if value > lastValue ?? value {
            increaseCount += 1
        }

        lastValue = value
    }

    return increaseCount
}

func windowedValues(list: [Int], window: Int) -> [Int] {
    var result: [Int] = []

    for (startIndex, _) in list.enumerated() {
        let endIndex = startIndex + window

        if endIndex > list.endIndex {
            break
        }

        let range = list[startIndex..<endIndex]
        result.append(range.reduce(0, +))
    }

    return result
}

// MARK: Answers
print("Day 1")
let depthValues = try readValues()

// Part 1
let partOne = summedValues(list: depthValues)
print("Part 1 = \(partOne)")

// Part 2
let windowedDepthValues = windowedValues(list: depthValues, window: 3)
let partTwo = summedValues(list: windowedDepthValues)
print("Part 2 = \(partTwo)")
