class TokenRequestForm
  include ActiveModel::Model

  attr_accessor :email

  validates :email, presence: true
end
