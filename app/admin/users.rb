ActiveAdmin.register User do
  permit_params :first_name, :last_name, :patronymic, :phone_number, :email, :password, :password_confirmation, :role_ids

  controller do
    def create
      attrs = params[:user]
      first_name = attrs[:first_name]
      last_name = attrs[:last_name]
      email = attrs[:email]
      password = attrs[:password]

      @user = User.new(first_name: first_name,
                       last_name: last_name,
                       password: password,
                       email: email)

      if @user.save
        role_ids = params[:user][:role_ids]
        roles = Role.where(id: role_ids).pluck(:name)
        roles.each do |role|
          @user.add_role(role.to_sym)
        end
        flash[:success] = "New User created."
        redirect_to '/admin/users'
      else
        render :new
      end
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :roles
    column :created_at
    actions
  end


  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end
end
