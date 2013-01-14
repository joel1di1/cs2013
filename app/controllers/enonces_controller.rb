class EnoncesController < ApplicationController
  # GET /enonces
  # GET /enonces.json
  def index
    @enonces = Enonce.all

    respond_to do |format|
      format.json { render json: @enonces }
    end
  end

  # GET /enonces/1
  # GET /enonces/1.json
  def show
    @enonce = Enonce.find(params[:id])

    respond_to do |format|
      format.json { render json: @enonce }
    end
  end

  # GET /enonces/new
  # GET /enonces/new.json
  def new
    @enonce = Enonce.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enonce }
    end
  end

  # GET /enonces/1/edit
  def edit
    @enonce = Enonce.find(params[:id])
  end

  # POST /enonces
  # POST /enonces.json
  def create
    if Enonce.find(params[:id])
      render json: @enonce, status: 202
    else
      @enonce = Enonce.new
      @enonce.text = params.to_json
      @enonce.id = params[:id]

      respond_to do |format|
        if @enonce.save
          format.json { render json: @enonce, status: :created}
        else
          format.json { render json: @enonce.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /enonces/1
  # PUT /enonces/1.json
  def update
    @enonce = Enonce.find(params[:id])

    respond_to do |format|
      if @enonce.update_attributes(params[:enonce])
        format.json { head :no_content }
      else
        format.json { render json: @enonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enonces/1
  # DELETE /enonces/1.json
  def destroy
    @enonce = Enonce.find(params[:id])
    @enonce.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
