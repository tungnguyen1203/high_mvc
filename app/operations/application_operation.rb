class ApplicationOperation
  attr_reader :form, :errors, :params

  def initialize(params = {})
    @errors          = []
    @params          = params
  end
end
