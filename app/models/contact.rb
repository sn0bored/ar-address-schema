require_relative '../../db/config'

class Contact< ActiveRecord::Base

  attr_reader :age, :areacode

  validates_uniqueness_of :email
  validates :email, presence: true, format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i} 
  validates_length_of :phone, :in => 9..32
  validates_presence_of :company


  def name
    first_name + " " + last_name
  end

  def areacode
    phone.slice(0..2)
  end

  
end
