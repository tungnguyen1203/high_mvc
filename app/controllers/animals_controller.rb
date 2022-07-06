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
    @form = operator.form
  end

  def new
    operator = Animals::NewOperation.new(params)
    operator.call
    @form = operator.form
  end

  def edit
    operator = Animals::EditOperation.new(params)
    operator.call
    @form = operator.form
  end

  def create
    operator = Animals::CreateOperation.new(params)
    operator.call
    @form = operator.form

    if operator.form.errors.present?
      render "new"
    else 
      flash[:notice] = "Object successfully created"
      redirect_to root_path
    end
    
  end

  def update
    operator = Animals::UpdateOperation.new(params)
    operator.call

    if operator.form.errors.present?
      flash[:notice] = "Object failed update"
      render "edit"
    else 
      flash[:notice] = "Object successfully created"
      @form = operator.form 
      redirect_to root_path
    end

  end

  def destroy
    operator = Animals::DestroyOperation.new(params)
    operator.call
    flash[:notice] = "Object was successfully deleted"
    redirect_to root_path
  end

end
