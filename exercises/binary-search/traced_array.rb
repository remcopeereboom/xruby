# A static sorted array.
#
# This class is used by the BinarySearch tests to ensure that the BinarySearch
# algorithm does not make unnecessary copies and does not do more reads than
# necessary.
#
# Maintains the invariant that all items are stored in sorted order.
# Constructing a new {TracedArray} takes time proportional to the number of
# items in the array. Returning the size and accessing an element of the array
# takes constant time.
class TracedArray
  # @!attribute [r] reads
  #   @return [Integer] The number of read accesses.
  attr_reader :reads

  # Initializes a new TracedArray
  # @param collection [Enumerable]
  def initialize(collection)
    @array  = collection.to_a.sort
    @reads  = 0
  end

  # Returns the size of the array.
  # @return [Integer]
  def size
    @array.size
  end

  # Return the ith element.
  # @param i [Integer] The index (Negative indices are NOT supported).
  # @return [Object]
  # @raise [RangeError] if i lies outside the valid dimensions of the array.
  def [](i)
    fail RangeError, i unless (0...@array.size).cover? i
    @reads += 1
    @array[i]
  end
end
