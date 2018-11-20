class PagesController < ApplicationController
	def index
		# SQL SELECT * FROM PAGES 
		@pages = Page.all
		# THIS RENDERS VIEWS
  end

	def show
		@page = Page.find(params[:id])
  end

	def new
		# CREATES A NEW PAGE ONLY IN MEMORY
		@page = Page.new
		# THIS RENDERS THE FORM FROM NEW.HTML.ERB
	end
	
	def create 
		@page = Page.new(pages_params)
		if @pages.save
			redirect_to pages_path
		else 
			render :new
		end
	end

	private
	
		def pages_params
			params.require(:page).permit(:title, :body)
		end


end
