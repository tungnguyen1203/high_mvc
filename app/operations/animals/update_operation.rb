module Animals
  class UpdateOperation < ApplicationOperation
    attr_reader :animal

    def call
      step_find_id
      step_validation{return}
      step_update_animal
    end

  private

    def step_find_id
      @animal = Animal.find(params[:id])
    end

    def step_validation
      @form = CreateForm.new(params_permit)
      return if form.valid?
      yield
    end

    def step_update_animal
      @animal.update(params_permit)
    end

    def params_permit
      params.require(:animal).permit(:name, :age)
    end
  end
end
