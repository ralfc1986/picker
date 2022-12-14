class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  has_many :picks, dependent: :destroy
  has_many :league_by_days, dependent: :destroy
  has_many :league_masters, dependent: :destroy
  after_save :add_picks
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum:3, maximum:25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum:105 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  private
  def add_picks
    return if picks.count == Match.count
    # Generate picks for user for every matches
    Match.all.each do |match|
      Pick.find_or_create_by!(user_id: self.id, match_id: match.id)
    end
  end

end
