module Yammer
  class Client
    # Defines methods related to manipulating opengraph objects
    module OG
      def og_activity(og_json)
        post('activity', og_json)
      end

      def og_payload(activity, options = {})
        raise(ArgumentError.new, "You need to call acts_as_opengraph on your #{obj.class} model") unless activity.respond_to?(:opengraph_data)
        options = {action: "update", notify_users: [], private: true, message: ""}.merge(options)
        {
          activity: {
            actor: {
              name:  options[:user].name,
              email: options[:user].email
            },
            action: options[:action],
            object: {
              url:   options[:url] || activity.opengraph_url,
              type:  'page',
              title: activity.opengraph_title,
              image: activity.opengraph_image
            }
          },
          private: options[:private],
          message: options[:message],
          users: []
        }
      end

    end
  end
end
