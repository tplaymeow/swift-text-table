# swift-text-table

A simple swift library that provides an API for text table rendering.

## Installation
### SwiftPM
```swift
dependencies: [
  ...
  .package(url: "https://github.com/tplaymeow/swift-text-table", branch: "main"),
]
```
## Examples
Let's display some information using `TextTable`:
```swift
let points = [
  Point(x: 12.0, y: 15.2),
  Point(x: 120.0, y: 115.3),
  Point(x: 1200.0, y: 1115.0),
]

let table = TextTable(points) {
  TextTableColumn(title: "X", value: \.x, format: .number)
  TextTableColumn(title: "Y", value: \.y, format: .number.notation(.scientific))
  TextTableColumn(title: "Description") { point in
    let x = point.x.formatted()
    let y = point.y.formatted()
    return "This point is located at (\(x), \(y))"
  }
}

print(table.render())
```
Output:
```
+-------+---------+-----------------------------------------+
| X     | Y       | Description                             |
+-------+---------+-----------------------------------------+
| 12    | 1,52E1  | This point is located at (12, 15,2)     |
+-------+---------+-----------------------------------------+
| 120   | 1,153E2 | This point is located at (120, 115,3)   |
+-------+---------+-----------------------------------------+
| 1 200 | 1,115E3 | This point is located at (1 200, 1 115) |
+-------+---------+-----------------------------------------+
```

## Customizations
`TextTable` supports configuration, which can be configured using the configure block:
```swift
...

let table = TextTable(points) {
  $0.cornerFence = "•"
  $0.horizontalPadding = 0
} columns: {
  TextTableColumn(title: "X", value: \.x, format: .number)
  TextTableColumn(title: "Y", value: \.y, format: .number.notation(.scientific))
  TextTableColumn(title: "Description") { point in
    let x = point.x.formatted()
    let y = point.y.formatted()
    return "This point is located at (\(x), \(y))"
  }
}

...
```
Output:
```
•-----•-------•---------------------------------------•
|X    |Y      |Description                            |
•-----•-------•---------------------------------------•
|12   |1,52E1 |This point is located at (12, 15,2)    |
•-----•-------•---------------------------------------•
|120  |1,153E2|This point is located at (120, 115,3)  |
•-----•-------•---------------------------------------•
|1 200|1,115E3|This point is located at (1 200, 1 115)|
•-----•-------•---------------------------------------•
```

