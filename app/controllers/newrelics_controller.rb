class NewrelicsController < ApplicationController
  # GET /newrelics
  # GET /newrelics.json
  def index
    @newrelics = Newrelic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newrelics }
    end
  end

  # GET /newrelics/1
  # GET /newrelics/1.json
  def show
    @newrelic = Newrelic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newrelic }
    end
  end

  # GET /newrelics/new
  # GET /newrelics/new.json
  def new
    @newrelic = Newrelic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newrelic }
    end
  end

  # GET /newrelics/1/edit
  def edit
    @newrelic = Newrelic.find(params[:id])
  end

  # POST /newrelics
  # POST /newrelics.json
  def create
    @newrelic = Newrelic.new(params[:newrelic])

    respond_to do |format|
      if @newrelic.save
        format.html { redirect_to @newrelic, notice: 'Newrelic was successfully created.' }
        format.json { render json: @newrelic, status: :created, location: @newrelic }
      else
        format.html { render action: "new" }
        format.json { render json: @newrelic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /newrelics/1
  # PUT /newrelics/1.json
  def update
    @newrelic = Newrelic.find(params[:id])

    respond_to do |format|
      if @newrelic.update_attributes(params[:newrelic])
        format.html { redirect_to @newrelic, notice: 'Newrelic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newrelic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newrelics/1
  # DELETE /newrelics/1.json
  def destroy
    @newrelic = Newrelic.find(params[:id])
    @newrelic.destroy

    respond_to do |format|
      format.html { redirect_to newrelics_url }
      format.json { head :no_content }
    end
  end
end
