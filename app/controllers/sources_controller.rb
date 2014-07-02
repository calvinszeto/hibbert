class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :update]

  # GET /sources?format=json{&location&no_filter}
  def index
    @sources = Source.all
  end

  # GET /sources/1?format=json
  def show
  end

  # PATCH /sources/1
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, notice: 'Source was successfully updated.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_source
      @source = Source.find(params[:id])
    end
end
