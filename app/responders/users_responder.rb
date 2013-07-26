class UsersResponder < BaseResponder
  def read_all
    User.all
  end
end
