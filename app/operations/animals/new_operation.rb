module Animals
  class NewOperation < ApplicationOperation
    attr_reader :animal

    def call
      step_new_animal
    end

  private

    def step_new_animal
      @animal = Animal.new
    end

  end
end
