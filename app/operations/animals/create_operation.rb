module Animals
  class CreateOperation < ApplicationOperation
    attr_reader :animal

    def call
      step_validation{ return }
      step_create_animal
      step_save
    end
    
  private
    
    def step_validation
      @form = CreateForm.new(params_permit)
      return if form.valid?
      yield
    end
    
    def step_create_animal
      @animal = Animal.new(params_permit)
    end

    def step_save
      @animal.save
    end
    
    def params_permit
      params.require(:animal).permit(:name, :age)
    end

  end
end
