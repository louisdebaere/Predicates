import XCTest
@testable import Predicates

final class PredicatesTests: XCTestCase {
    
    enum Directions: String, CaseIterable { case east, west, south, north }
    
    func testEquals() throws {
        XCTAssertEqual(Directions.allCases.filter(==.north), [.north])
    }
    
    func testNotEquals() throws {
        XCTAssertEqual(Directions.allCases.filter(!=.north), [.east, .west, .south])
    }
    
    func testNotEqualsKeyPath() throws {
        XCTAssertEqual(Directions.allCases.filter(!\.rawValue.is4characters), [.south, .north])
    }
}

extension String {
    var is4characters: Bool { count == 4 }
}
