public struct TextTableConfiguration {
  public var horizontalFence: String
  public var verticalFence: String
  public var cornerFence: String
  public var horizontalPadding: Int

  @inlinable
  public init(
    horizontalFence: String,
    verticalFence: String,
    cornerFence: String,
    horizontalPadding: Int
  ) {
    self.horizontalFence = horizontalFence
    self.verticalFence = verticalFence
    self.cornerFence = cornerFence
    self.horizontalPadding = horizontalPadding
  }
}

// MARK: - Default Configuration

extension TextTableConfiguration {
  @inlinable
  public static var `default`: Self {
    .init(
      horizontalFence: "-",
      verticalFence: "|",
      cornerFence: "+",
      horizontalPadding: 1
    )
  }
}
