class User < ActiveRecord::Base
  has_many :reviews
  has_many :ratings, through: :reviews
  belongs_to :city
  # Remember to create a migration!

  include BCrypt

  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => { :with => /\w+@\w+\.\w+/ }

  validates :name, :presence => true

  validates :password, :presence => true

  validates :city, :presence => true


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password ||= Password.create(pass)
    self.password_hash = @password
  end


  def city=(user_city)
    @city = City.where(name: user_city).first_or_create
    self.city_id = @city.id
  end

  def self.create(user_params)
    user = User.new(
      :name => user_params[:name],
      :email => user_params[:email])
    user.city = user_params[:city]
    user.password = user_params[:password]
    user.save
    user
  end

  def self.authenticate(params)
    user = User.find_by_email(params[:email])
    (user && user.password == params[:password]) ? user : nil
  end
end
