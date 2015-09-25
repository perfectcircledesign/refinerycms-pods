require 'refinerycms-core'

module Refinery
  autoload :PodsGenerator, 'generators/refinery/pods_generator'

  module Pods
    require 'refinery/pods/engine'
    require 'pod_helper'
    ::ActionView::Base.send :include, ::PodHelper

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
