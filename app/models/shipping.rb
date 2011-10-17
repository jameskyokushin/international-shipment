class Shipping < ActiveRecord::Base
  STATUS_AIR = 'AIR'
  STATUS_SEA = 'SEA'
 
  belongs_to :supplier
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :allow_destroy => true
  validates :status, :inclusion => { :in => [STATUS_AIR, STATUS_SEA], :message => "You need to pick one status." }
 class << self
  def status_collection
      {
        "AIR" => STATUS_AIR,
        "SEA" => STATUS_SEA
      }
  end

  def status_tag
    case self.status
      when STATUS_AIR then :warning
      when STATUS_SENT then :ok
    end
  end
end

end
