module Refinery
  module Pods
    class Podding < Refinery::Core::BaseModel
      self.table_name = 'refinery_poddings'

      attr_accessible :pod_id, :poddable_id, :poddable_type

      belongs_to :pod, class_name: '::Refinery::Pods::Pod'
      belongs_to :poddable, class_name: '::Refinery::Pods::Podding', :polymorphic => true

    end
  end
end
