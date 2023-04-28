import Foundation

public struct TextTableColumn<Item> {
  public let title: String
  public let render: (Item) -> String

  @inlinable
  public init(
    title: String,
    render: @escaping (Item) -> String
  ) {
    self.title = title
    self.render = render
  }
}

extension TextTableColumn {
  @inlinable
  public init(
    title: String,
    value keyPath: KeyPath<Item, String>
  ) {
    self.title = title
    self.render = { $0[keyPath: keyPath] }
  }

  @inlinable
  @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
  public init<Value, Format>(
    title: String,
    value keyPath: KeyPath<Item, Value>,
    format: Format
  ) where Format: FormatStyle, Format.FormatInput == Value, Format.FormatOutput == String {
    self.title = title
    self.render = { format.format($0[keyPath: keyPath]) }
  }
}
