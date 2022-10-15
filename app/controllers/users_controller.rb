class UsersController < ApplicationController
    # authorization
    before_action :require_admin, only: [:edit, :update, :ban, :destroy , resend_confirmation_instructions]
    before_action :require_admin_or_invitor, only: [:resent_invitation]
    before_action :require_admin_or_owner, only: [:edit, :update]
    
    def index 
        @users = User.all.order(created_at: :desc)
    end
    
    def edit
         @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.update(user_params)
             redirect_to @user, notice: "User was successfully updated"
        else
            render :edit
        end
    end
    
   
    def show
        @user = User.find(params[:id])
    end
    
    def resend_confirmation_instructions
        @user = User.find(params[:id])
        if @user.confirmed? == false && @user.created_by_invite? == false
            @user.resend_confirmation_instructions
            redirect_to @user, notice: "Confirmation instructions were resent"
        else
            redirect_to @user, alert: "User already confirmed"
        end
    end
    
    def resent_invitation
        @user = User.find(params[:id])
        if @user.created_by_invite? && @user.invitation_accepted? == false && @user.confirmed? == false 
            @user.invite!
            redirect_to @user, notice: "Invitation were resent"
        else
            redirect_to @user, alert: "User already confirmed"
        end
    end
    
    
    def ban
        @user = User.find(params[:id])
        if @user == current_user
            redirect_to @user, alert: "You can not ban yourself"
        else
            if  @user.access_locked?
                @user.unlock_access!
            else    
                @user.lock_access!
            end
            redirect_to @user, notice: "User access locked: #{@user.access_locked?}"
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: "User was successfully destroyed"
    end
    
    
    private
    def user_params
        list_allowed_params = []
        list_allowed_params += [:name] if current_user == @user || current_user.admin?
        list_allowed_params += [*User::ROLES] if current_user.admin?
        params.require(:user).permit(list_allowed_params)
        #params.require(:user).permit(*User::ROLES, :name)
    end
    
    def require_admin
       # unless current_user.admin? || current_user.teacher?
        unless current_user.admin?
            redirect_to (request.referrer || root_path), alert: "You are not authorizated to perform this action"
        end
    end
    
    def require_admin_or_invitor
        @user = User.find(params[:id])
        unless current_user.admin? || @user.invited_by == current_user
            redirect_to root_path, alert: "You are not authorizated to perform this action"
        end
    end
    
    def require_admin_or_owner
        @user = User.find(params[:id])
        unless current_user.admin? || current_user == @user
            redirect_to (request.referrer || root_path), alert: "You are not authorizated to perform this action"
        end
    end
end
    
