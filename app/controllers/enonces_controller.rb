class EnoncesController < ApplicationController
  # GET /enonces
  # GET /enonces.json
  def index
    @enonces = Enonce.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enonces }
    end
  end

  # GET /enonces/1
  # GET /enonces/1.json
  def show
    @enonce = Enonce.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
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
    @enonce = Enonce.new(params[:enonce])

    respond_to do |format|
      if @enonce.save
        format.html { redirect_to @enonce, notice: 'Enonce was successfully created.' }
        format.json { render json: @enonce, status: :created, location: @enonce }
      else
        format.html { render action: "new" }
        format.json { render json: @enonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enonces/1
  # PUT /enonces/1.json
  def update
    @enonce = Enonce.find(params[:id])

    respond_to do |format|
      if @enonce.update_attributes(params[:enonce])
        format.html { redirect_to @enonce, notice: 'Enonce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
      format.html { redirect_to enonces_url }
      format.json { head :no_content }
    end
  end
end
