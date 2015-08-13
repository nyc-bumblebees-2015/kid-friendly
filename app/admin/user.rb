ActiveAdmin.register User do
  permit_params :first_name, :last_name, :username, :email, :password
end
