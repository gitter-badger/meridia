class Attend
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :member
  
  field :time, type: Time
  field :entry_time, type: Time
  field :exit_time, type: Time

  before_create :entry
  before_update :exit
  
  def entry
    self.entry_time = Time.now
  end

  def exit
    self.exit_time = Time.now
  end

  def self.get_start_end_date date_start,date_end
    where(:created_at.gte=>date_start, :created_at.lte =>date_end)
  end
  

end
