module Refinery
  module Pods
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Pods

      engine_name :refinery_pods

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pods"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pods_admin_pods_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/pods/pod'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Pods)
      end
      config.autoload_paths += Dir["#{config.root}/lib/**/"]
    end
  end
end
