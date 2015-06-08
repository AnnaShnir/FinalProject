class PartiesController < ApplicationController

	def index
		@parties = Party.order(created_at: :desc)
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

		@party.organizer = User.find(session[:user_id])
		if @party.save
			redirect_to(parties_path({:id => @party.id}) )
			#redirect_to :controller => "parties_controller", :action => "show", :id => @party.id
		else
			render :new
		end
	end

	def attend
		@party = Party.find(params[:id])
		@attender = User.find(session[:user_id])
		@party.attendees << @attender 
		#@party.update
		redirect_to(parties_path)
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






