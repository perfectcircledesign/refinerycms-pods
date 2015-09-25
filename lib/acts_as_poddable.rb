module ActsAsPoddable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def acts_as_poddable
      has_many :pods, :through => :poddings, :as => :poddable
      has_many :poddings, as: :poddable, dependent: :destroy, class_name: '::Refinery::Pods::Podding'
    end
  end
end

ActiveRecord::Base.send :include, ActsAsPoddable


# module Yaffle
#   module ActsAsYaffle
#     extend ActiveSupport::Concern
#
#     included do
#     end
#
#     module ClassMethods
#       def acts_as_yaffle(options = {})
#         cattr_accessor :yaffle_text_field
#         self.yaffle_text_field = ( options[:yaffle_text_field] || :last_squawk).to_s
#       end
#     end
#   end
# end
#
# ActiveRecord::Base.send :include, Yaffle::ActsAsYaffle