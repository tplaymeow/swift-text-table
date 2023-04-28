@resultBuilder
public enum TextTableColumnBuilder<Item> {
  @inlinable
  public static func buildEither(
    first columns: [TextTableColumn<Item>]
  ) -> [TextTableColumn<Item>] {
    columns
  }

  @inlinable
  public static func buildEither(
    second columns: [TextTableColumn<Item>]
  ) -> [TextTableColumn<Item>] {
    columns
  }

  @inlinable
  public static func buildOptional(
    _ columns: [TextTableColumn<Item>]?
  ) -> [TextTableColumn<Item>] {
    columns ?? []
  }

  @inlinable
  public static func buildExpression(
    _ column: TextTableColumn<Item>
  ) -> [TextTableColumn<Item>] {
    [column]
  }

  @inlinable
  public static func buildExpression(
    _: ()
  ) -> [TextTableColumn<Item>] {
    []
  }

  @inlinable
  public static func buildBlock(
    _ columns: [TextTableColumn<Item>]...
  ) -> [TextTableColumn<Item>] {
    columns.flatMap { $0 }
  }

  @inlinable
  public static func buildArray(
    _ columns: [[TextTableColumn<Item>]]
  ) -> [TextTableColumn<Item>] {
    columns.flatMap { $0 }
  }
}
