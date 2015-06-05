class PartiesController < ApplicationController

	def index
		@parties = Parties.all
	end

	def show
		@party = Party.find(params[:id])
	end

	def edit
		@party = Party.find(params[:id])
	end

	def new
		@party = Party.new
	end

	def create
		@party = Party.create(party_params)
		if @party.save
			redirect_to(parties_path)
		else
			render :new
		end
	end

	def update
		Party.find(params[:id]).update(party_params)
		redirect_to(parties_path)
	end

	def destroy
		Party.find(params[:id]).destroy
		redirect_to(parties_path)
	end

	private
	def party_params
		params.require(:party).permit(:location, :description, :type_of_activity, :image_url)
	end

end
