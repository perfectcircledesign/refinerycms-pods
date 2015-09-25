module Refinery
  module Pods
    class Pod < Refinery::Core::BaseModel
      self.table_name = 'refinery_pods'

      attr_accessible :title, :body, :url, :image_id, :pod_type, :gallery_id, :video_id, :position, :start_date, :expiry_date, :page_ids

      POD_TYPES = %w(content banner gallery video inquiry)

      validates :title, :presence => true
      validates_inclusion_of :pod_type, :in => POD_TYPES
      # TODO add validation based on pod type and fields required

      acts_as_indexed :fields => [:title, :body, :url, :pod_type]

      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :gallery, :class_name => '::Refinery::Portfolio::Gallery'
      belongs_to :video, :class_name => '::Refinery::Videos::Video'
      has_many :pages, :through => :poddings, :source => :poddable, :source_type => 'Refinery::Page'
      has_many :poddings, :foreign_key => :pod_id

      scope :not_expired, lambda {
                          pods = Arel::Table.new(::Refinery::Pods::Pod.table_name)
                          where(pods[:expiry_date].eq(nil).or(pods[:expiry_date].gt(Time.now)))
                        }
      scope :published, lambda {
                        not_expired.where("start_date <= ?", Time.now).order(:position)
                      }


      def system_title
        pod_type
      end

      def self.included_pod_types(pod_types)
        unless defined?(::Refinery::Videos::Video)
          pod_types -= ['video']
        end
        unless defined?(::Refinery::Portfolio::Gallery)
          pod_types -= ['gallery']
        end
        unless defined?(::Refinery::Inquiries::Inquiry)
          pod_types -= ['inquiry']
        end
        pod_types
      end

    end
  end
end
