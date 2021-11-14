class LibrariesController < ApplicationController
  before_action :set_library, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /libraries or /libraries.json
  def index
    @libraries = Library.all
  end

  # GET /libraries/1 or /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    # @library = Library.new
    @library = current_user.libraries.build
  end

  # GET /libraries/1/edit
  def edit
  end

  # POST /libraries or /libraries.json
  def create
    # @library = Library.new(library_params)
    @library = current_user.libraries.build(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to @library, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1 or /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to @library, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1 or /libraries/1.json
  def destroy
    @library.destroy
    respond_to do |format|
      format.html { redirect_to libraries_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @library = current_user.libraries.find_by(id:params[:id])
    redirect_to libraries_path, notice: "Not authorized to update" if @library.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:Book_Id, :Book_Title, :Book_Author, :Book_Publisher, :year,:user_id)
    end
end
