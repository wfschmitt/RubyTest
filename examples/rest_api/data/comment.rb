require_relative '../base_classes/base_class_for_resource'

class Comment < BaseClassForResource

  FIELDS = Set.new([
      :postId,
      :id,
      :name,
      :email,
      :body,
  ])

  attr_accessor *FIELDS

  # Constructor.
  Contract Hash => nil
  def initialize(values = {})
    super(FIELDS, values)
    nil
  end

  Contract Log, VERDICT_ID => Bool
  def verdict_valid?(log, verdict_id)
    log.verdict_assert_integer_positive?([verdict_id, :post_id], self.postId)
    log.verdict_assert_integer_positive?([verdict_id, :id], self.id)
    log.verdict_assert_string_not_empty?([verdict_id, :name], self.name)
    log.verdict_assert_string_not_empty?([verdict_id, :email], self.email)
    log.verdict_assert_string_not_empty?([verdict_id, :body], self.body)
  end

end
