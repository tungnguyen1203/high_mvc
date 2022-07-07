module  Animals
  class DestroyOperation < ApplicationOperation
    attr_reader :animal
    
    def call
      step_find_id
      step_destroy_animal
    end
  private
  
    def step_find_id
      @animal = Animal.find(params[:id])
      
    end

    def step_destroy_animal
      @animal.destroy
    end
  end
end
