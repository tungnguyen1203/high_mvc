module Animals
  class EditOperation < ApplicationOperation
    attr_reader :animal

    def call
      step_find_id
    end
    
  private
    
    def step_find_id
      @animal = Animal.find(params[:id])
    end
    
  end
end