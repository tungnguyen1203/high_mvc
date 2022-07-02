class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  def initialize(attributes = {})
    # Define dynamic attributes
    self.class.attribute_names.each do |attr|
      self.class.attribute attr.to_sym
    end

    super attributes
  end

  def valid!
    raise BadRequestError, error_messages unless valid?
  end

  private

  def error_messages
    errors.messages.map { |key, value| { key => value.first } }
  end

  def attribute_names
    []
  end
end
