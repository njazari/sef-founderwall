class DedicationsController < ApplicationController
    
    WillPaginate.per_page = 9
    
    def show
        @dedication = Dedication.find_by_id(params[:id])
        @donor_logged_in = false
        if current_user
            @donor_logged_in = current_user.donor == @dedication.donor || current_user.admin?
        end
        if @dedication.nil? or !@dedication.status and !@donor_logged_in
            @error = 'Dedication'
            render 'errors/status'
        else
            @published = @dedication.published
            @hospital = Hospital.find(@dedication.hospital_id)
        end
    end
    
    def index
        @dedications = Dedication.visible
        
        @filterrific = initialize_filterrific(
            Dedication.visible, 
            params[:filterrific], 
            select_options: {
            sorted_by: Dedication.options_for_sorted_by,
            with_country_id: Hospital.options_for_select,
            }, 
            default_filter_params: {},
        ) or return 
        @dedications = @filterrific.find.page(params[:page])
        
        respond_to do |format|
            format.html
            format.js
        end
        
    rescue ActiveRecord::RecordNotFound => e
        puts "Had to reset filterrific params: #{ e.message }"
        redirect_to(reset_filterrific_url(format: :html)) and return
    end
    
    def edit
        @dedication = Dedication.find(params[:id])
        if @dedication.published
            flash[:notice] = "You can no longer edit this dedication. Please contact the admin for any concerns."
            redirect_to dedication_path(@dedication)
        end
    end
    
    def update
        @dedication = Dedication.find(params[:id])
        @dedication.dedication = params[:dedication][:dedication]
        @dedication.status = params[:dedication][:status]
        if params[:publish]
            @dedication.published = true
            hospital = Hospital.find(@dedication.hospital_id)
            flash[:notice] = "Your dedication has been published. Go to #{hospital.name}'s page to see it on the Digital Wall of Founders!"
        end
        @dedication.save!
        if @dedication.status
            redirect_to donor_path(@dedication.donor)
        else 
            redirect_to root_path
        end
    end
    
    def _list
        @published_dedications = Dedications.published
    end
end
