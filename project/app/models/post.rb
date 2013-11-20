class Post < ActiveRecord::Base

  before_create :generate_unique_id
  set_primary_key :unique_id

  attr_accessible :title, :text
  has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }

  private

  def generate_unique_id
    self.unique_id = SecureRandom.uuid # => "72569edd-1841-4fd9-af05-edf66a58b74b"
  end


end
