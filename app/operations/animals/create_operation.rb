module Animals
  class CreateOperation < ApplicationOperation
    attr_accessor :animal

    def call
      step_validation{ return }
      step_create_animal
    end
    
  private
    
    def step_validation
      @form = CreateForm.new(params_permit)
      binding.pry
      yield if form.valid?
    end

    def step_create_animal
      binding
      @animal = Animal.new(params[:form])
      @animal.save
    end

    def params_permit
      params.require(:animal).permit(:name, :age)
    end

  end
end