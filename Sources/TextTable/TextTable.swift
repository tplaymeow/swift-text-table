import Foundation

public struct TextTable<Data> where Data: Sequence {
  public let data: Data
  public let configuration: TextTableConfiguration
  public let columns: [TextTableColumn<Data.Element>]

  @inlinable
  public init(
    _ data: Data,
    configuration: TextTableConfiguration = .default,
    @TextTableColumnBuilder<Data.Element>
    columns: () -> [TextTableColumn<Data.Element>]
  ) {
    self.data = data
    self.configuration = configuration
    self.columns = columns()
  }

  @inlinable
  public func render() -> String {
    self.render(lines: [self.columns.map(\.title)] + self.data.map { item in
      self.columns.map { column in
        column.render(item)
      }
    })
  }

  @inlinable
  internal func render(lines: [[String]]) -> String {
    let horizontalCount = lines.first?.count ?? 0

    let lengths = (0..<horizontalCount).map { index in
      self.configuration.horizontalPadding * 2 + lines
        .compactMap { $0[safe: index] }
        .reduce(0) { max($0, $1.count) }
    }

    let lineSeparator = Self.withFence(
      fence: self.configuration.cornerFence,
      strings: lengths.map {
        String(
          repeating: self.configuration.horizontalFence,
          count: $0
        )
      }
    )

    let linesString = lines.map { line in
      Self.withFence(
        fence: self.configuration.verticalFence,
        strings: zip(lengths, line).map {
          (
            String(repeating: " ", count: self.configuration.horizontalPadding) +
            $1 +
            String(repeating: " ", count: self.configuration.horizontalPadding)
          ).padding(
            toLength: $0,
            withPad: " ",
            startingAt: 0
          )
        }
      )
    }.joined(separator: "\n\(lineSeparator)\n")

    return "\(lineSeparator)\n\(linesString)\n\(lineSeparator)"
  }

  @inlinable
  internal static func withFence(
    fence: String,
    strings: [String]
  ) -> String {
    fence +
    strings.joined(separator: fence) +
    fence
  }
}


extension TextTable {
  @inlinable
  public init(
    _ data: Data,
    configure: (inout TextTableConfiguration) -> Void,
    @TextTableColumnBuilder<Data.Element>
    columns: () -> [TextTableColumn<Data.Element>]
  ) {
    var configuration = TextTableConfiguration.default
    configure(&configuration)
    self.init(data, configuration: configuration, columns: columns)
  }
}

// MARK: - CustomStringConvertible

extension TextTable: CustomStringConvertible {
  @inlinable
  public var description: String {
    self.render()
  }
}
