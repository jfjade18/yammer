module Yammer
  class Client
    # Defines methods related to manipulating users
    module Users
      def users(options = {})
        response = get("users", options, :json)
      end

      def find_by_id(id, options={})
        response = get("users/#{id}", options, :json)
      end

      def current_user(options = {})
        response = get("users/current", options, :json)
      end
    end
  end
end
