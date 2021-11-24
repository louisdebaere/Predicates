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
    
    struct Person { let name: String }
    
    let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Clarus")]
    
    func testEqualSubKeyPath() {
        XCTAssertEqual(people.filter(\.name == "Alice").count, 1)
    }
    
    func testNotEqualSubKeyPath() {
        XCTAssertEqual(people.filter(\.name != "Alice").count, 2)
    }
}

extension String {
    var is4characters: Bool { count == 4 }
}
