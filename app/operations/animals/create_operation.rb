module Animals
  class CreateOperation < ApplicationOperation
    
    def call
      step_validation{ return }
      step_create_animal
    end
    
  private
    
    def step_validation
      @form = CreateForm.new(params_permit)
      return if form.valid?
      yield
    end
    
    def step_create_animal
      Animal.create(form.attributes)
    end

    def params_permit
      params.require(:animal).permit(:name, :age)
    end

  end
end
