module Yammer
  class Client
    # Defines methods related to manipulating messages
    module Activities
      # Creates a new activity from the authenticating user

      
      # @format `:json`, `:xml`
      # @authenticated true
      # @rate_limited false
      # @param type [Symbol] One of 5 Yammer activity types: text, status, created, changed, or deleted
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :text Blurb of arbitrary text, for text type
      # ...
      
      # @return [Hashie::Mash] The created action.
      # @see http://developer.yammer.com/api/streams.html
      # @example Creates a new text-type activity for the authenticating user
      #   Yammer.activity('text', :text => 'Created an activity with the Yammer gem.' )
      def activity(activity_type, options={})
        response = post('activity', { :activity => options.merge(:action => activity_type)} )
        format.to_s.downcase == 'xml' ? response['response']['activities'] : response
      end
    end
  end
end
