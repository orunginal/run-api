class CountryController < ApplicationController

  def index
    @countries = Country.all || []
  end

  def new
    @country = Country.new
  end

  def create
    # crate a create.json.jbuilder
    @country = Record.new(country_params)
      if @country.save
        @country
      else
        @country.errors, status: :unprocessable_entity
      end
  end

  def show
    @country = Country.find(params[:id]) || Country.new
  end


  private

  def record_params
    params.require(:country).permit(:name)
  end
end
