extension Collection {
  @inlinable
  @inline(__always)
  internal subscript(safe index: Index) -> Element? {
    self.indices.contains(index) ? self[index] : nil
  }
}
