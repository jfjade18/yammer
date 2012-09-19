module Yammer
  class Client
    # Defines methods related to manipulating networks
    module Networks
      def current(options = {})
        response = get("networks/current", options, :json)
      end
    end
  end
end
