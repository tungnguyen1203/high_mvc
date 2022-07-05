module Animals
  class CreateForm < BaseForm
    attribute :name
    attribute :age
    
    validates :name, presence: true
    validates :age, presence: true
  end
end
