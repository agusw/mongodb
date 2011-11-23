class ExpensesController < ApplicationController
  before_filter :prepare_data, :only => [:show, :edit, :update, :destroy]

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    respond_to do
      if @expense.update_attributes(params[:expense])
        flash[:notice] = 'Expense was successfully updated.'
        redirect_to @expense
      else
        flash[:notice] = 'Expense was failed to update.'
        render 'edit'
      end
    end
  end

  def destroy
    flash[:notice] = @expense.destroy ? "Expense was successfully destroyed." : "Failed to destroy expense"

    redirect_to :action => :index
  end

  protected
    def prepare_data
      @expense = Expense.find_by_id(params[:id])
    end
end