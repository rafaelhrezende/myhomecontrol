class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contexts
  belongs_to :context

  def get_current_context

    unless self.context.nil?
      return self.context
    end
    set_default_context
  end

  private

  def set_default_context
    if self.contexts.any?
      self.context = self.contexts.first
    else
      self.context = self.contexts.create(description: "My Home");
    end
    self.save

    self.context
  end

end
