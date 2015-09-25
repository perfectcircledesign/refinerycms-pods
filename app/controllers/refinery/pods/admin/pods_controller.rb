module Refinery
  module Pods
    module Admin
      class PodsController < ::Refinery::AdminController

        crudify :'refinery/pods/pod',
                :xhr_paging => true

      end
    end
  end
end
