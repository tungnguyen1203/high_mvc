module Animals
  class UpdateOperation < ApplicationOperation
    attr_reader :animal

    def call
      step_find_id
      step_update_animal
    end

  private

    def step_find_id
      @form = Animal.find(params[:id])
    end

    def step_update_animal
      @form.update(params_permit)
    end

    def params_permit
      params.require(:animal).permit(:name, :age)
    end
      
  end
end
