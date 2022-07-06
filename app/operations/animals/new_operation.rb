module Animals
  class NewOperation < ApplicationOperation

    def call
      step_new_animal
    end

  private

    def step_new_animal
      @form = NewForm.new()
    end
    
  end
end
