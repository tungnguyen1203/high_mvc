class SampleController < ApplicationController
  def index
    #Do Something
    operator = Sample::IndexOperation.new(params)
    operator.call
  end

  def show
    #Do Something
  end

  def edit
    #Do Something
  end

  def update
    #Do Something
  end

  def destroy
    #Do Something
  end
end
