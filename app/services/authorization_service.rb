class AuthorizationService
  def authorized_user
    decode_token = JwtService.decode_token
    return unless decode_token

    user_id = decode_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
  end
end
