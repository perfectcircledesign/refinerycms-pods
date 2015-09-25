module PodHelper
  def set_pod_limit(limit)
    if limit.present?
      limit
    else
      nil
    end
  end

  def set_pod_types(pod_types)
    if pod_types.present?
      pod_types
    else
      Refinery::Pods::Pod.included_pods(::Refinery::Pods::Pod::POD_TYPES)
    end
  end

  def render_pods(object, args ={})
    pods = []
    pod_type = args[:pod_types] || nil
    limit = args[:limit] || nil
    if object.present? and object.pods.published.present?
      object.pods.published.where(:pod_type => set_pod_types(pod_type)).limit(set_pod_limit(limit)).order(:position).each do |pod|
        pods << (render :partial => "refinery/pods/shared/#{pod.system_title}_pod", :locals => {:pod => pod})
      end
    end
    pods.join.html_safe
  end

end

