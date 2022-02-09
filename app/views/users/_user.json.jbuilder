json.(user, :id, :email, :username, image)

json.token user.generate_jwt