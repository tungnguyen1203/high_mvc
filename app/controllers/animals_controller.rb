class AnimalsController < ApplicationController
  
  def index
    operator = Animals::IndexOperation.new(params)
    operator.call
    @animals = operator.animals 

    respond_to do |format|
      format.html
      format.json { 
        render json: {entries: render_to_string(partial: "list_animal", formats: [:html]),
        pagination: view_context.paginate(@animals)}
      }
    end
  end

  def show
    operator = Animals::ShowOperation.new(params)
    operator.call
    @animal = operator.animal
  end

  def new
    operator = Animals::NewOperation.new(params)
    operator.call
    @animal = operator.animal
  end

  def edit
    operator = Animals::EditOperation.new(params)
    operator.call
    @animal = operator.animal
  end

  def create
    operator = Animals::CreateOperation.new(params)
    if operator.call.nil?
      # flash[:notice] = operator.form.errors.full_messages.join(', ')
      redirect_to new_animal_path
    else 
      flash[:notice] = "Object successfully created"
      @animal = operator.animal 
      redirect_to root_path
    end
    
  end

  def update
    operator = Animals::UpdateOperation.new(params)

    if operator.call.nil?
      flash[:notice] = "Object failed update"
      redirect_to animal_path
    else 
      flash[:notice] = "Object successfully created"
      @animal = operator.animal 
      redirect_to root_path
    end

  end

  def destroy
    operator = Animals::DestroyOperation.new(params)
    operator.call
    flash[:notice] = "Object was successfully updated"
    redirect_to root_path
  end

end
