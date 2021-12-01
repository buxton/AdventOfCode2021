import Foundation

// MARK: Functions
public func readValues() throws -> [Int] {
    guard let fileUrl = Bundle.main.url(forResource: "Day1-input", withExtension: "txt") else { fatalError() }

    let input = try String(contentsOf: fileUrl)

    return input.split(whereSeparator: \.isNewline).compactMap { Int($0) }
}

public func summedValues(list: [Int]) -> Int {
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

public func windowedValues(list: [Int], window: Int) -> [Int] {
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
