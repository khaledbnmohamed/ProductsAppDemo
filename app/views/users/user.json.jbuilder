json.(user, :id, :email, :username, :avatar)
json.token user.generate_jwt