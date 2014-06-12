json.extract! @current_user, :id, :email, :name
json.tracking do
  json.sign_in_count @current_user.sign_in_count
  json.current_sign_in_at @current_user.current_sign_in_at
  json.last_sign_in_at @current_user.last_sign_in_at
  json.current_sign_in_ip @current_user.current_sign_in_ip
  json.last_sign_in_ip @current_user.last_sign_in_ip
end
