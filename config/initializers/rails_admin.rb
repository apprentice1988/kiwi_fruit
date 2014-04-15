ADMIN_EMAILS= ['zilongji@gmail.com']
RailsAdmin.config do |config|
  #config.current_user_method(&:current_user) # auto-generated
  #config.authenticate_with {} # leave it to authorize
  #config.authorize_with do
    #is_admin= ADMIN_EMAILS.include?(current_user.email)
    #if current_user
        #redirect_to main_app.new_user_session_url unless is_admin
    #end
  #end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
