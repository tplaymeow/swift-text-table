import XCTest
import TextTable

final class TextTableTests: XCTestCase {
  func testExample() throws {
    struct Point {
      let x: Double
      let y: Double
    }

    let points = [
      Point(x: 12.0, y: 15.2),
      Point(x: 120.0, y: 115.3),
      Point(x: 1200.0, y: 1115.0),
      Point(x: 12000.0, y: 115.3),
      Point(x: 120000.0, y: 15.2),
    ]

    let table = TextTable(points) {
      $0.cornerFence = "•"
    } columns: {
      TextTableColumn(
        title: "X",
        value: \.x,
        format: .number
      )

      TextTableColumn(
        title: "Y",
        value: \.y,
        format: .number.notation(.scientific)
      )

      TextTableColumn(title: "Description") { point in
        let x = point.x.formatted()
        let y = point.y.formatted()
        return "This point is located at (\(x), \(y))"
      }
    }

    XCTAssertEqual(table.render(), """
    •---------•---------•------------------------------------------•
    | X       | Y       | Description                              |
    •---------•---------•------------------------------------------•
    | 12      | 1,52E1  | This point is located at (12, 15,2)      |
    •---------•---------•------------------------------------------•
    | 120     | 1,153E2 | This point is located at (120, 115,3)    |
    •---------•---------•------------------------------------------•
    | 1 200   | 1,115E3 | This point is located at (1 200, 1 115)  |
    •---------•---------•------------------------------------------•
    | 12 000  | 1,153E2 | This point is located at (12 000, 115,3) |
    •---------•---------•------------------------------------------•
    | 120 000 | 1,52E1  | This point is located at (120 000, 15,2) |
    •---------•---------•------------------------------------------•
    """)
  }
}
