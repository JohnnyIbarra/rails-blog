class PagesController < ApplicationController

	#CRUD

	#READ, VIEWS ALL THE PAGES 
	def index
		# SQL SELECT * FROM PAGES 
		@pages = Page.all
		# THIS RENDERS VIEWS
  end

	# READ, VIEWS A SINGLE PAGE 
	def show
		@page = Page.find(params[:id])
  end


	# READ , RENDERS THE FORM FOR A NEW PAGE
	def new
		# CREATES A NEW PAGE ONLY IN MEMORY
		@page = Page.new
		# THIS RENDERS THE FORM FROM NEW.HTML.ERB
	end
	
	# CREATE , CREATES A NEW PAGE
	def create 
		@page = Page.new(pages_params)
		if @pages.save
			redirect_to pages_path
		else 
			render :new
		end
	end

	# READ, RENDERS THE EDIT FORM
	def edit
		@page = Page.find(params[:id])
		# THIS RENDERS THE EDIT FORM 
	end

	# UPDATE, UPDATES THE PAGE
	def update
		# LOOKING FOR A PAGE SPECIFIC ID
		@page = Page.find(params[:id])

		# UPDATES THE NEW INFO
		if @page.update(pages_params)
			redirect_to pages_path
		else
			render :edit
		end
	end

	# DESTROY, DELETES A SINGLE PAGE	
	def destroy
		# FIND AND DELETE A PAGE 
		Page.find(params[:id]).destroy
		# TAKES US BACK TO ALL PAGES 
		redirect_to pages_path
	end



	private
	
		def pages_params
			params.require(:page).permit(:title, :body)
		end


end
