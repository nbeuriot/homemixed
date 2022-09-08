
if @user_ingredient.persisted?
  json.response(true)
else
  json.response(false)
end
