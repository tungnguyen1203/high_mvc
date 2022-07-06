module Animals
  class IndexOperation < ApplicationOperation
    attr_reader :animals

    def call
      step_load_animals
    end
    
  private

    def step_load_animals
      @animals = Animal.all.page(params[:page]).per(55)
    end
  end
end
